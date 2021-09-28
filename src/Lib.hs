module Lib
    ( someFunc
    ) where

import PlotUtils
import Fractals


size = (1200, 1000)

someFunc :: IO ()
someFunc =  plot ( (-1.9,1.1), (1.9,-1.1) ) size julia True "f.png"
