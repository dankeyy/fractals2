{-# LANGUAGE RankNTypes #-}
module Mandelbrot where

import Data.Complex


type Formula a = (Fractional a, RealFloat a) => Complex a -> Complex a -> Complex a -- e.g z' = z^2 + c where z, c, z' are Complex


maxIter = 100


mandelbrot :: Formula a
mandelbrot z c = z ^ 2 + c


burningShip :: Formula a
burningShip z = mandelbrot (abs (realPart z) :+ abs (imagPart z))


tricorn :: Formula a
tricorn z = mandelbrot $ conjugate z


fractal :: (Fractional a, RealFloat a) => Formula a -> Complex a ->  Int
fractal f c = iterateFractal f (0 :+ 0) c 0


-- returns intensity in correspondence to a point on the complex plane
-- for mandelbrot, tricorn, burning ship we can just pass in the formula. julia sets are a bit trickier. TODO
iterateFractal :: (Fractional a, RealFloat a) => Formula a -> Complex a -> Complex a -> Int -> Int
iterateFractal formula z c iter
  | iter > maxIter = 0
  | otherwise = let z' = formula z c in
      if magnitude z' > 2 then iter 
      else iterateFractal formula z' c iter + 1