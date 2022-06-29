<a name="logo"/>
<div align="center">
<a href="https://julialang.org/" target="_blank">
<img src="docs/src/images/logo.svg" alt="Julia Logo" width="280" height="189"></img>
</a>
</div>

# LAR Mapper

Project **LAR Mapper** from **Calcolo Parallelo e Distribuito** developed by:

| Name| Serial Number | E-mail | Github Profile |
|:---|:---|:---|:---|
|Filippo Iacobelli|582898|fil.iacobelli@stud.uniroma3.it| [https://github.com/ZoSo9999/](https://github.com/ZoSo9999/) |
| Luca Rossicone |523938|luc.rossicone@stud.uniroma3.it|[https://github.com/Asprofumo/](https://github.com/Asprofumo/)|

Documentation: [https://asprofumo.github.io/Mapper.jl/]

## Packages

```julia
(@v1.6) pkg> add "https://github.com/cvdlab/ViewerGL.jl"
(@v1.6) pkg> add LinearAlgebraicRepresentation
(@v1.6) pkg> add DataStructures
(@v1.6) pkg> add CUDA
```
### ! Note: The `Studio Definitivo` notebook is for explanatory purposes only, as the code is meant to run on GPU!

Consult Notebooks:
 - `Studio Preliminare`: [https://github.com/Asprofumo/Mapper.jl/blob/master/notebooks/studiopreliminare.ipynb](https://github.com/Asprofumo/Mapper.jl/blob/master/notebooks/studiopreliminare.ipynb)
 - `Studio Esecutivo`: [https://github.com/Asprofumo/Mapper.jl/blob/master/notebooks/studioesecutivo.ipynb](https://github.com/Asprofumo/Mapper.jl/blob/master/notebooks/studioesecutivo.ipynb)
 - `Studio Definitivo`: [https://github.com/Asprofumo/Mapper.jl/blob/master/notebooks/studiodefinitivo.ipynb](https://github.com/Asprofumo/Mapper.jl/blob/master/notebooks/studiodefinitivo.ipynb)

## Mapper

The mapper.jl file contains the implementation of several parametric primitives, including curves, surfaces and solids embedded in either 2D or 3D.

The constructive approach is common to all methods. It consists in generating a simplicial or cuboidal decomposition of a simple geometrical domain in u,v or u,v,w parametric space. Then a change of coordinates, e.g. from Cartesian to polar or cylindrical coordinates, is applied to the vertices of the cellular complex decomposing the domain.

![](./images/grids.png)
> **Figure 1:** Cellular 3-complexes, slightly exploded: (a) cuboidal mesh; (b) simplicial mesh.

So, the mapped domain produces a curved manifold in 2D or 3D space. To obtain a closed curved surface, i.e. a manifold-without-boundary, as in the case of a 2-sphere in 3D, or of the toroidal surface in 3D, a suitable identification of coincident mapped points is performed. 


## Source Code Organization

The Julia source code is organized as follows:

| Directory         | Contents                                                           |
| -                 | -                                                                  |
| `domain/`         | domains of some important functions in txt format                  |
| `reports/`        | reports in pdf e md formats                                        |
| `notebooks/`      | notebooks that explain how the functions work                      |
| `doc/src/`        | source for the user manual                                         |
| `src/`            | source for Julia language core                                     |
| `test/`           | test suites                                                        |

## List of currently available primitives

The mapper module aims to provide the tools needed to apply both dimension-independent affine transformations and general simplicial maps to geometric objects and assemblies developed within the LAR scheme.
A large number of surfaces and primitives solids are definable using the map function and the local parametrization.

### Curves

Primitive one-dimensional objects:

* `circle` - Circle centered in the origin
* `helix` - Helix curve about the z axis 

### Surfaces

![](./images/mappings-1.png)
> **Figure 3:** Cellular 1- and 2-complexes: (a) 2D unit circle; (b) spiral curve embedded in 3D; (c) 2D unit disk; (3) spiraloid surface in 3D.


Primitive two-dimensional objects:

* `disk` - Disk centered in the origin
* `helicoid` - Helicoid about the z axis
* `ring` - Ring centered in the origin
* `cylinder` - Cylinder surface with z axis
* `sphere` - Spherical surface of given radius
* `toroidal` - Toroidal surface of given radiuses
* `crown` - Half-toroidal surface of given radiuses

![](./images/mappings-2.png)
> **Figure 4:** Cellular 2- and 3-complexes: (a) 2D disk; (b) cylinder surface in 3D; (c) 2-sphere surface in 3D; (3) toroidal surface in 3D.

### Solids

Primitive three-dimensional objects:

* `cuboid` - Solid cuboid of given extreme vectors
* `ball` - Solid Sphere of given radius
* `rod` - Solid cylinder of given radius and height
* `hollowCyl` - Hollow cylinder of given radiuses and height 
* `hollowBall` - Hollow sphere of given radiuses
* `torus` - Solid torus of given radiuses
* `pizza` - Solid pizza of given radiuses

![](./images/mappings-3.png)
> **Figure 5:** Cellular complexes: (a) 1-skeleton of 3D cube; (b) assembly of cell complexes of mixed dimensions; (c) 3-mesh of portion of hollow solid cylinder; (d) 3-mesh of a portion of hollow solid torus.
