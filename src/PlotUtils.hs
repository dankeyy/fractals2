module PlotUtils where
    
import Graphics.GD


type VPoint = (Double, Double) -- note that while gd's Point will refer to pixel points, VPoint will refer to points in the view port
type ViewPort = (VPoint, VPoint) -- the exact window frame on the complex plane we want to observe 

size@(width, height) = (1200, 800) :: Size
grid = [(x, y) | x <- [0 .. width - 1], y <- [0 .. height - 1]]


plot :: ViewPort -> Size -> String -> IO ()
plot (p1, p2) (w, h) fileName = undefined

