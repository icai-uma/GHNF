# GHNF Demos (MATLAB)
This repository contains several MATLAB demos illustrating different functionalities of the GHNF model ([link](https://www.mdpi.com/3584042)), including clustering, color quantization, and self-organization methods.

## Requirements
- MATLAB (R2020b or later recommended)
- No additional toolboxes are required unless specified inside each script.

## How to Run
Each demo can be executed directly from the MATLAB command window.
Simply run:
```
ghnf_demo_X
```
where X can be one of the following options:
- clustering
- clustering2
- color_quantization
- self_organization
- self_organization2
- self_organization3

Example:
```
ghnf_demo_clustering
```
Each script loads its own data (if needed) and produces visualizations or console outputs illustrating the behavior of the corresponding method.

## Cite our work
Please use the following citation if you use our code:
```
@article{Palomo2020GHNF,
  author       = {Palomo, E. J. and L{\'o}pez-Rubio, E. and Ortega-Zamorano, F. and Ben{\'i}tez-Rochel, R.},
  title        = {Exploratory Data Analysis and Foreground Detection with the Growing Hierarchical Neural Forest},
  journal      = {Neural Processing Letters},
  volume       = {52},
  number       = {3},
  pages        = {2537--2563},
  year         = {2020},
  doi          = {10.1007/s11063-020-10360-2},
  url          = {https://doi.org/10.1007/s11063-020-10360-2}
}
```
