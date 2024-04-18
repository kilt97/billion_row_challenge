import System.IO
import System.CPUTime
import Control.Monad
import qualified Data.Text as T
import qualified Data.Text.IO as TIO
import Data.List (sort)
import Data.Map.Strict (Map)
import qualified Data.Map.Strict as Map
import Data.Maybe (fromMaybe)
import Control.Monad (forM_)

outputsPath = "outputs.txt"
measurementsPath = "measurements.txt"

-- data Status = Status {
--     minVal :: Integer,
--     maxVal :: Integer,
--     total :: Integer,
--     count :: Integer
-- } deriving (Show)

-- updateStatus :: Status -> Integer -> Status
-- updateStatus (Status min max total count) newVal = Status (min `min` newVal) (max `max` newVal) (total + newVal) (count + 1)

-- solution :: IO String
-- solution = do
--     content <- TIO.readFile measurementsPath
--     let lines = T.lines content
--     let map = foldl updateMap Map.empty lines
--     let results = sort $ Map.toList map
--     return $ T.concat $ map formatResult results
--     where
--     updateMap :: Map T.Text Status -> T.Text -> Map T.Text Status
--     updateMap map line = 
--         let [city, measurement] = T.splitOn ";" line
--             newVal = read (T.unpack measurement) :: Integer
--             oldStatus = fromMaybe (Status newVal newVal 0 0) (Map.lookup city map)
--         in Map.insert city (updateStatus oldStatus newVal) map

--     formatResult :: (T.Text, Status) -> T.Text
--     formatResult (city, status) = 
--         let avg = total status `div` count status
--         in T.concat [city, "=", T.pack (show (minVal status)), ";", T.pack (show (maxVal status)), ";", T.pack (show avg), "(", T.pack (show (total status)), "/", T.pack (show (count status)), ")\n"]
    
solution :: String
solution = "Hello World"

main = do
    expectOutput <- readFile outputsPath
    putStrLn expectOutput

    start <- getCPUTime
    let got = solution
    end <- getCPUTime

    let diff = floor((fromIntegral (end - start)) / (10^9)) :: Integer
    putStrLn $ "Elapsed: " ++ show diff ++ " ms"

    if got == expectOutput
        then putStrLn "Test Passed"
        else do 
            putStrLn "Test Failed"
            putStrLn $ "Expected: " ++ expectOutput
            putStrLn $ "Got: " ++ got