# MMTF.jl

**Latest Release:**

[![Latest Release](https://img.shields.io/github/release/BioJulia/MMTF.jl.svg)](https://github.com/BioJulia/MMTF.jl/releases/latest)
[![License](https://img.shields.io/badge/license-MIT-green.svg)](https://github.com/BioJulia/MMTF.jl/blob/master/LICENSE)
[![BioJulia Maintainer : joels94](https://img.shields.io/badge/BioJulia%20Maintainer-joels94-orange.svg)](https://github.com/joels94)

**Development Status:**

[![Build Status](https://travis-ci.org/BioJulia/MMTF.jl.svg?branch=master)](https://travis-ci.org/BioJulia/MMTF.jl)
[![Build status](https://ci.appveyor.com/api/projects/status/eptv612bhx0fa6nt/branch/master?svg=true)](https://ci.appveyor.com/project/jgreener64/mmtf-jl/branch/master)
[![codecov](https://codecov.io/gh/BioJulia/MMTF.jl/branch/master/graph/badge.svg)](https://codecov.io/gh/BioJulia/MMTF.jl)

## Description
The Macromolecular Transmission Format (MMTF) is a new compact binary format to transmit and store biomolecular structures for fast 3D visualization and analysis.
MMTF.jl lets you encode and decode MMTF files.

## Installation
Install MMTF.jl from the Julia REPL:

```julia
julia> using Pkg
julia> Pkg.add("MMTF")
```

To start using the package:
```julia
julia> using MMTF
```

## Usage
**To download and parse a MMTF file as Julia Dict from RCSB database.**
```julia
julia> MMTFdict = fetchmmtf("4HHB")
Dict{String,Any} with 39 entries:
  "chainNameList" => String["A", "B", "C", "D", "A", "B", "B", "C", "D", "D", "A", "B", "C", "D"]
  "bondAtomList"  => Int32[7, 2, 15, 9, 21, 17, 28, 23, 33, 30  …  4337, 4331, 4342, 4339, 4352, 4344, 4361, 4354, 4373, 4363]
  "numGroups"     => 801
  "bFactorList"   => Float32[49.05, 43.14, 24.8, 37.68, 72.12, 61.79, 80.12, 26.44, 26.32, 32.96  …  43.37, 43.46, 41.77, 43.68, 45.36, 41.53, 36.25, …
  "groupIdList"   => Int32[1, 2, 3, 4, 5, 6, 7, 8, 9, 10  …  188, 189, 190, 191, 192, 193, 194, 195, 196, 197]
  "structureId"   => "4HHB"
  "unitCell"      => Any[63.15, 83.59, 53.8, 90.0, 99.34, 90.0]
  "numAtoms"      => 4779
  "groupList"     => Any[Dict{Any,Any}(Pair{Any,Any}("groupName", "VAL"),Pair{Any,Any}("bondAtomList", Any[1, 0, 2, 1, 3, 2, 4, 1, 5, 4, 6, 4]),Pair{A…
  "numChains"     => 14
  "groupTypeList" => Int32[0, 11, 22, 13, 9, 7, 1, 21, 10, 0  …  3, 3, 3, 3, 3, 3, 3, 3, 3, 3]
  ⋮               => ⋮
```
`pdbid::AbstractString` - PDB ID of the structure.

**To parse an existing MMTF file as Julia Dict.**
```julia
julia> MMTFDict = parsemmtf("path/to/MMTF/file", gzip=false)
```
`gzip::Bool` - if set to `true`, parses a compressed MMTF file.

**To write a valid MMTF Julia Dict as MMTF file**
```julia
julia> writemmtf(MMTFdict, "path/to/write/MMTF/file", gzip=false)
```
`gzip::Bool` - if set to `true`, writes a compressed MMTF file.

See [BioStructures.jl](https://github.com/BioJulia/BioStructures.jl) for how to read MMTF files into a hierarchical data structure and convert them to PDB/mmCIF files.

## Citation

If you use MMTF.jl, please cite the BioStructures.jl paper where it is mentioned:

Greener JG, Selvaraj J and Ward BJ. BioStructures.jl: read, write and manipulate macromolecular structures in Julia, *Bioinformatics* 36(14):4206-4207 (2020) - [link](https://academic.oup.com/bioinformatics/advance-article/doi/10.1093/bioinformatics/btaa502/5837108?guestAccessKey=aec90643-1d43-4521-9883-4a4a669187da) - [PDF](https://github.com/BioJulia/BioStructures.jl/blob/master/paper.pdf)

## Contributing and Questions

We appreciate contributions from users including reporting bugs, fixing issues,
improving performance and adding new features.

If you have a question about
contributing or using this package, our [Gitter chat room](https://gitter.im/BioJulia/General) would be
the best starting place to communicate with other users and developers.
You are encouraged to use the [Bio category of the Julia discourse
site](https://discourse.julialang.org/c/domain/bio) for technical questions.
