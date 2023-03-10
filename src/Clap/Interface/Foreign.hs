module Clap.Interface.Foreign where

import Control.Applicative
import Data.Bits
import Data.Maybe
import Data.Word
import Foreign.C

fromCInt :: CInt -> Int
fromCInt = fromIntegral

fromCUInt :: CUInt -> Int
fromCUInt = fromIntegral

toCInt :: Int -> CInt
toCInt = fromIntegral

toCUInt :: Int -> CUInt
toCUInt = fromIntegral

fromCDouble :: CDouble -> Double
fromCDouble (CDouble double) = double

fromCChars :: [CChar] -> String
fromCChars = fmap castCCharToChar

pureIf :: (Alternative m) => Bool -> a -> m a
pureIf b a = if b then pure a else empty

flagsToInt :: Enum a => [a] -> Word32
flagsToInt flags = foldl (.|.) 0 $ (\flag -> 1 `shiftL` fromEnum flag ) <$> flags

intToFlags :: (Enum a, Bounded a) => Word32 -> [a]
intToFlags int = 
    catMaybes $ (\flag -> if testBit int (fromEnum flag) then Just flag else Nothing) <$> [minBound .. maxBound]
