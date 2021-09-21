{-# LANGUAGE RankNTypes #-}
module Fractals (  iterateFractal, mandelbrot, burningShip, tricorn ) where

import Data.Complex


type Formula a = (Fractional a, RealFloat a) => Complex a -> Complex a -> Complex a -- e.g z' = z^2 + c where z, c, z' are Complex

maxIter = 100


mandelbrot :: Formula a
mandelbrot z c = z ^ 2 + c


burningShip :: Formula a
burningShip z c = (abs (realPart z) :+ abs (imagPart z)) ^ 2 + c


tricorn :: Formula a
tricorn z c = conjugate z ^ 2 + c


-- i think julia sets can be just our regular sets (mandelbrot for the classic ones) given a const c. maybe in a curried form. TODO 

-- julia :: Formula a
-- julia z _ = z ^ 2 + ((-0.835) :+ (-0.2321))


-- returns intensity in correspondence to a point on the complex plane
iterateFractal :: (Fractional a, RealFloat a) => Formula a -> Complex a -> Complex a -> Int -> Int
iterateFractal formula z c iter
  | iter > maxIter = 0
  | otherwise = let z' = formula z c in
      if magnitude z' > 2 then iter 
      else iterateFractal formula z' c iter + 1