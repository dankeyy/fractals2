module Lib
    ( someFunc
    ) where

import PlotUtils
import Fractals


someFunc :: IO ()
someFunc =  plot ( (-1.9,1.1), (1.9,-1.1) ) size julia True "f.png"
