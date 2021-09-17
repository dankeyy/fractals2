module Mandelbrot where
import Data.Complex


maxIter = 100


mandelbrot :: RealFloat a => Complex a -> Complex a -> Integer -> Integer
mandelbrot z c iter
  | iter > maxIter = maxIter
  | otherwise = let z' = z ^ 2 + c in 
      if magnitude z' > 4 then iter else mandelbrot z' c iter + 1

