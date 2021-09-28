module PlotUtils where

import Data.Complex ( Complex((:+)) )
import Graphics.GD ( newImage, rgb, savePngFile, setPixel, Color, Point, Size )
import Fractals ( iteratingFractal, Formula , flipForJulia) 


type ViewPoint = (Float, Float) -- note that while gd's Point will refer to pixel points, ViewPoint will refer to points in the view port, on the complex plane
type ViewPort = (ViewPoint, ViewPoint) -- the exact window frame on the complex plane we want to observe
type JuliaMode = Bool


gridBy :: Size -> [(Int, Int)]
gridBy (width, height) = [(x, y) | x <- [0 .. width - 1], y <- [0 .. height - 1]]


colorBy :: Int -> Color
colorBy x = rgb (x*3+60) (x*2+30) (x^2+ 60) -- change by color ratio wanted


toColor :: ViewPoint -> Formula -> JuliaMode ->  Color
toColor (vx, vy) formula juliaMode = colorBy $ iteratingFractal formula zc 0
  where zc = flipForJulia (0 :+ 0, vx :+ vy) juliaMode


-- pointing from the outside world to a specific point on the complex plane outputing its x,y as a ViewPoint
pixelToViewPoint :: Point -> Size -> ViewPort -> ViewPoint
pixelToViewPoint (pixX, pixY) (width, height) ((minXvp, minYvp), (maxXvp, maxYvp)) = 
  (xVP, yVP) where

    xscale = fromIntegral pixX / fromIntegral width
    yscale = fromIntegral pixY / fromIntegral height

    xVP = (maxXvp - minXvp) * xscale + minXvp
    yVP = (maxYvp - minYvp) * yscale + minYvp


plot :: ViewPort -> Size -> Formula -> JuliaMode -> String -> IO ()
plot viewPort size formula juliaMode fileName = do
  img <- newImage size

  mapM_ (\point -> 
          let 
            viewPoint = pixelToViewPoint point size viewPort
            color = toColor viewPoint formula juliaMode
          in 
            setPixel point color img
        ) (gridBy size)

  savePngFile fileName img
