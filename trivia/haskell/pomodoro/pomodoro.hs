import System.Environment
import System.Process
import Control.Concurrent

-- 引数i秒だけスリープする
waitForSec :: Int -> IO ()
waitForSec i = threadDelay (1000000 * i)

-- 引数i分だけスリープする
waitForMin :: Int -> IO ()
waitForMin i = waitForSec (i * 60)

-- 整数値の引数iの個数だけ"*"を出力する
-- なお引数iが0以下だった場合は"*"は出力しない。
printManyChar :: Int -> Char -> IO ()
printManyChar i chr = do
  if i <= 0
    then putStrLn ""
    else do
    putStr [chr]
    printManyChar (i - 1) chr

-- AA風メッセージを出力する（ひとまずアスキー文字だけ）
aaMessage :: String -> IO ()
aaMessage str = do
  printManyChar (length str + 4) '-'
  putStrLn ("- " ++ str ++ " -")
  printManyChar (length str + 4) '-'

-- 任意のMP3ファイルを再生する
playMP3 :: String -> IO ()
playMP3 fileName = do
  let cmdStr = "play -q " ++ fileName
  callCommand cmdStr

-- MP3ファイル（ピンポン音）を再生する
playPingPong1 :: IO ()
playPingPong1 = do
  envValDir <- getEnv "FITTIMER_MP3_DIR"
  envValFile <- getEnv "FITTIMER_MP3_FILENAME1"
  playMP3 (envValDir ++ "/" ++ envValFile)

-- MP3ファイル（ピンポン音＊2）を再生する
playPingPong2 :: IO ()
playPingPong2 = do
  envValDir <- getEnv "FITTIMER_MP3_DIR"
  envValFile <- getEnv "FITTIMER_MP3_FILENAME2"
  playMP3 (envValDir ++ "/" ++ envValFile)

-- ポモドーロテクニック1周分
pomodoroOneCycle :: Int -> Int -> IO ()
pomodoroOneCycle timeForWork timeForRest = do
  -- 作業時間
  playPingPong1
  aaMessage "Do Your Work!"
  waitForMin timeForWork

  -- 休憩時間
  playPingPong2
  aaMessage "Rest For Now!"
  waitForMin timeForRest

-- 引数n回分だけポモドーロを回す
pomodoroNCycle :: Int -> Int -> Int -> IO ()
pomodoroNCycle timeForWork timeForRest 0 = pure ()
pomodoroNCycle timeForWork timeForRest num = do
  pomodoroOneCycle timeForWork timeForRest
  pomodoroNCycle timeForWork timeForRest (num - 1)

main :: IO ()
main = do
  -- 引数を取得する
  args <- getArgs

  if length args == 0
    then putStrLn "Usage: pomodoro [working min] [resting min] [num of cycles]"
    else
    do
    let timeForWork = (read (args !! 0) :: Int)
    let timeForRest = (read (args !! 1) :: Int)
    let cycle = (read (args !! 2) :: Int)
        
    -- ポモドーロを回す
    pomodoroNCycle timeForWork timeForRest cycle
