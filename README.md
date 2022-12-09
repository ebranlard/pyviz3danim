[![Build status](https://github.com/ebranlard/pyviz3danim/workflows/Tests/badge.svg)](https://github.com/ebranlard/pyviz3danim/actions?query=workflow%3A%22Tests%22)
<a href="https://www.buymeacoffee.com/hTpOQGl" rel="nofollow"><img alt="Donate just a small amount, buy me a coffee!" src="https://warehouse-camo.cmh1.psfhosted.org/1c939ba1227996b87bb03cf029c14821eab9ad91/68747470733a2f2f696d672e736869656c64732e696f2f62616467652f446f6e6174652d4275792532306d6525323061253230636f666665652d79656c6c6f77677265656e2e737667"></a>
# pyviz3Danim

Python app for interactive visualization of 3D structures, mode shapes and animations.

The python app is in a beta version and it is recommended to use the [web app](https://github.com/ebranlard/viz3danim) for now.


## Python App (Beta)

The python app can open SubDyn and HydroDyn inputs files (.dat), and SubDyn yaml files (.yaml) to display the structure and potentially the mode shapes (SubDyn yaml file).

###Installation:
```bash
git clone --recurse-submodules http://github.com/ebranlard/pyviz3danim
cd pyviz3danim
python -m pip install -r requirements.txt

cd weio
python -m pip install -e .
cd ..
```

If you forgot the `recurse-submodules` flag, and you end up with errors that `weio` is missing, type the following:
```bash
git submodule update --init --recursive
```

###Running:
```bash
python pyviz3danim.py
```

Drag and drop files.



## Json file format

NOTE: the json file format is not fully supported by the python app yet. Use SubDyn or HydroDyn or DubDyn yaml files for now.


The input files are `.json` files. You can see [an example](#a-simple-example-of-json-file) below.
The content of the file is as follows: 

  - `Nodes`: a list of nodal coordinates (x,y,z) for each node
  - `Connectivity`: a connectivity matrix providing the node indices defining each element (for now elements consists of two nodes)
  - `ElemeProps`: properties for each element
  - `Modes`: optional field providing the modes of the structure. 
  - `TimeSeries`: optional field providing the time series of displacements of the structure.
The format is mostly undocumented for now, it might evolve in the future. 
Example files are located in the `examples` folder of this repository. 

The `json` files can be generated using: 

 - SubDyn (part of [OpenFAST](https://github.com/openfast/openfast)). Setting the options `OutCBModes` and `OutFEMModes`, see [here](https://openfast.readthedocs.io/en/dev/source/user/subdyn/input_files.html#output-summary-and-outfile).

 - The python module `graph.py` and finite element (FEM) module of [welib](https://github.com/ebranlard/welib). See [examples](https://github.com/ebranlard/welib/tree/dev/welib/FEM/examples).


### A simple example of Json file:

```json
{"Connectivity":[
      [0, 1],
      [1, 2],
      [2, 0]
  ],
 "Nodes": [
      [ 0.0, 0.0, 1.0],
      [ 0.0,-0.25, 0.0], 
      [ 0.0, 0.25, 0.0]
 ],
 "ElemProps": [
      {"shape": "cylinder", "Diam": 0.1},
      {"shape": "cylinder", "Diam": 0.2},
      {"shape": "cylinder", "Diam": 0.1}
  ],
  "Modes": {
      "defaultSet": [
          {"name": "Mode1", "Displ": [[0.0, 0.0, 0.0], [0.3, 0.0, 0.0], [0.3, 0.0, 0.0]]},
          {"name": "Mode2", "Displ": [[0.0, 0.0, 0.0], [0.0, 0.3, 0.0], [0.0, 0.3, 0.0]]}
      ]
  }
}
```







