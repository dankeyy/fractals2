module PlotUtils where

import Data.Complex ( Complex((:+)) )
import Graphics.GD ( newImage, rgb, savePngFile, setPixel, Color, Point, Size )
import Fractals ( iteratingFractal, Formula ) 

type ViewPoint = (Float, Float) -- note that while gd's Point will refer to pixel points, ViewPoint will refer to points in the view port, on the complex plane
type ViewPort = (ViewPoint, ViewPoint) -- the exact window frame on the complex plane we want to observe

size@(width, height) = (600, 400) :: Size


grid :: [(Int, Int)]
grid = [(x, y) | x <- [0 .. width - 1], y <- [0 .. height - 1]]


colorBy :: Int -> Color
colorBy x = rgb (x^2) (2*x) 40 -- idk


toColor :: ViewPoint -> Formula -> Color
toColor (vx, vy) f = colorBy $ iteratingFractal f (0 :+ 0) (vx :+ vy) 0


-- pointing from the outside world to a specific point on the complex plane outputing its x,y as a ViewPoint
pixelToViewPoint :: Point -> Size -> ViewPort -> ViewPoint
pixelToViewPoint (pixX, pixY) (width, height) ((minXvp, minYvp), (maxXvp, maxYvp)) = 
  (xVP, yVP) where

    xscale = fromIntegral pixX / fromIntegral width
    yscale = fromIntegral pixY / fromIntegral height

    xVP = (maxXvp - minXvp) * xscale + minXvp
    yVP = (maxYvp - minYvp) * yscale + minYvp


plot :: ViewPort -> Size -> Formula -> String -> IO ()
plot viewPort size formula fileName = do
  img <- newImage size

  mapM_ (\point -> 
          let 
            viewPoint = pixelToViewPoint point size viewPort
            color = toColor viewPoint formula
          in 
            setPixel point color img
        ) grid

  savePngFile fileName img
