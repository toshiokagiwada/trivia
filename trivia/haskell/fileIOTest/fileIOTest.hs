-- fileIOTest.hs
-- なんか変なお遊びプログラム
import System.IO
import Data.List.Split
import System.Random
import System.Environment

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

-- 引数fileNameのテキストファイルを読み込み、
-- 1要素1行ごとのリストとして返す
loadDataFile :: String -> IO [String]
loadDataFile fileName = do
  wholeStr <- readFile fileName
  return(lines wholeStr)

-- 引数の文字列のリストを、
-- 1要素1行としてテキストファイルに出力する
saveDataFile :: String -> [String] -> IO ()
saveDataFile fileName strLines = do
  writeFile fileName (unlines strLines)

-- 0 から 引数iまでのランダムな整数値を返す
randomInt :: Int -> IO Int
randomInt i = getStdRandom (randomR (0, i))

-- 引数の文字列リストから、ランダムに1要素選択して、文字列として返す
randomStrFromList :: [String] -> IO String
randomStrFromList strLines = do
  indexInt <- randomInt (length strLines - 1)
  return(strLines !! indexInt)

-- fileIOTestのループはここ
-- 再帰関数で無限ループ？を作って良いのかは不明
fileIOTestLoop :: [String] -> IO [String]
fileIOTestLoop strList = do

  -- 標準入力から文字列を得る
  inStr <- getLine

  -- "ばいばい"と入力されたらループを抜ける方向へ
  -- そうでなければリストに文字列を追加して、
  -- リストからランダムに1文出力する（イミフ）
  if inStr == "ばいばい"
    then return(strList)
    else do
    let strList2 = [inStr] ++ strList
    outStr <- randomStrFromList strList2
    putStrLn outStr
    fileIOTestLoop strList2

fileIOTest :: IO ()
fileIOTest = do
  -- 開始メッセージ
  aaMessage "fileIOTest.hs"
  putStrLn "Quit when you input ばいばい"

  -- 開始処理として、データファイルを読み込む
  -- ファイル名は引数で取得する
  args <- getArgs
  if length args == 0
    then putStrLn "Usage: fileIOTest [fileName.txt]"
    else
    do
      let fileName = (args !! 0)
      strList <- loadDataFile fileName
  
      -- データファイルが空（リストが空）の場合はアイサツする
      -- （そこまで丁寧ではない）
      if length strList == 0
        then putStrLn "こんにちは"
        else do
        outStr <- randomStrFromList strList
        putStrLn outStr
        
      -- ループに入る
      dataList <- fileIOTestLoop strList

      -- 終了処理としてファイル出力する。
      saveDataFile fileName dataList

main :: IO ()
main = fileIOTest
