module PlotUtils where

import Data.Complex
import Graphics.GD

import Fractals --( iterateFractal, mandelbrot, Formula )

type ViewPoint = (Float, Float) -- note that while gd's Point will refer to pixel points, ViewPoint will refer to points in the view port, on the complex plane
type ViewPort = (ViewPoint, ViewPoint) -- the exact window frame on the complex plane we want to observe

size@(width, height) = (1200, 800) :: Size


grid :: [(Int, Int)]
grid = [(x, y) | x <- [0 .. width - 1], y <- [0 .. height - 1]]


colorBy :: Int -> Color
colorBy x = rgb (x^2) (2*x) 40 -- idk



drawBy :: ViewPoint -> Formula -> Color
drawBy (vx, vy) f = colorBy $ iterateFractal f (0 :+ 0) (vx :+ vy) 0


-- pointing from the outside world to a specific point on the complex plane outputing its x,y as a ViewPoint
scalePixelToViewPoint :: Point -> Size -> ViewPort -> ViewPoint
scalePixelToViewPoint (pixX, pixY) (width, height) ((minXvp, minYvp), (maxXvp, maxYvp)) = 
  (xVP, yVP) where

    xscale = fromIntegral pixX / fromIntegral width
    yscale = fromIntegral pixY / fromIntegral height

    xVP = (maxXvp - minXvp) * xscale + minXvp
    yVP = (maxYvp - minYvp) * yscale + minYvp


plot :: ViewPort -> Size -> String -> IO ()
plot (p1, p2) (w, h) fileName = undefined
