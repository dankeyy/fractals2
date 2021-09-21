module PlotUtils where

import Data.Complex
import Graphics.GD

import Fractals ( iterateFractal, mandelbrot )

type VPoint = (Double, Double) -- note that while gd's Point will refer to pixel points, VPoint will refer to points in the view port, on the complex plane
type ViewPort = (VPoint, VPoint) -- the exact window frame on the complex plane we want to observe 

size@(width, height) = (1200, 800) :: Size
grid = [(x, y) | x <- [0 .. width - 1], y <- [0 .. height - 1]]


colorBy :: Int -> Color
colorBy x = rgb (x^2) (2*x) 40 -- idk


draw :: VPoint -> Color
draw (x, y) = colorBy $ iterateFractal mandelbrot (0 :+ 0) (x :+ y) 0

-- pointing from the outside world to a specific point on the complex plane outputing its x,y as a VPoint
pixelToVPoint :: Point -> ViewPort -> VPoint 
pixelToVPoint (x, y) (p1, p2) = undefined 


-- plot :: ViewPort -> Size -> String -> IO ()
-- plot (p1, p2) (w, h) fileName = undefined

