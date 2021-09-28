module Fractals (  iteratingFractal, mandelbrot, burningShip, tricorn, julia, flipForJulia, Formula, Parameters ) where

import Data.Complex
import Data.Bool
import Data.Tuple


-- type Formula a = (Fractional a, RealFloat a) => Complex a -> Complex a -> Complex a -- e.g z' = z^2 + c where z, c, z' are Complex
type Formula = Complex Float -> Complex Float -> Complex Float -- e.g z' = z^2 + c where z, c, z' are Complex
type Parameters = (Complex Float, Complex Float)
maxIter = 100

flipForJulia :: Parameters -> Bool -> Parameters
flipForJulia =  bool <*> swap


mandelbrot :: Formula
mandelbrot z c = z ^ 2 + c


burningShip :: Formula
burningShip z c = (abs (realPart z) :+ abs (imagPart z)) ^ 2 + c


tricorn :: Formula
tricorn z c = conjugate z ^ 2 + c


-- i think julia sets can be just our regular sets (mandelbrot for the classic ones) given a const c in reversed c z paremeter order.
-- for now let it be just a regular formula. for which we just reverse z and c
julia :: Formula
julia z _ = z ^ 2 + ((-0.835) :+ (-0.2321))


-- returns intensity in correspondence to a point on the complex plane
iteratingFractal :: Formula -> Parameters -> Int -> Int
iteratingFractal formula (z, c) iter
  | iter > maxIter = 0
  | otherwise = let z' = formula z c in
      if magnitude z' > 2 then iter 
      else iteratingFractal formula (z', c) (iter + 1)
