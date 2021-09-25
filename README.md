# Fractal Sets
(py was being annoying so I decided to continue my fractal endeavours in haskell)

The fractal sets here share a similar theme - the points in it are the points for which their function, when iterated, does not diverge.

This makes it stupidly simple to make a single iterating function to which we pass the function definition of the fractal set we desire (ok julia sets can be a bit trickier but still). Check out src for more implementation details.
If you want to play around with this further then just clone and `stack run` it.

Here are a few renders:

[burning ship](https://en.wikipedia.org/wiki/Burning_Ship_fractal) with a nice zoom to the bottom left of it at a viewport of ((-1.7, -0.08), (-1.8, 0.02)). I actually rendered the original one (with the wider viewport) in my [old repo](https://github.com/dankeyy/fractals) if you want to check it out too. Though this angle looks cooler imo.

![b](/renders/burning_ship.png)

[tricorn](https://en.wikipedia.org/wiki/Tricorn_(mathematics))

![t](/renders/tricorn.png)

[julia set]() with the constant `c = −0.835 − 0.2321i` for the classic `z^2 + c`

![j](/renders/julia.png)

and of course the [mandelbrot set](https://en.wikipedia.org/wiki/Mandelbrot_set) itself

![m](/renders/mandelbrot.png)
