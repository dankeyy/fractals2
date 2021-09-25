module Lib
    ( someFunc
    ) where

import PlotUtils
import Fractals

someFunc :: IO ()
someFunc =  plot ((-2.0, 2.0), (2.0, -2.0)) size mandelbrot "mandel.png"
