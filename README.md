# HDF5Builder

This repository is a work in progress for building [HDF5](https://www.hdfgroup.org/downloads/hdf5/)
on Travis using [BinaryBuilder](https://github.com/JuliaPackaging/BinaryBuilder.jl) and hosting
the resulting binaries on GitHub Releases.

**NOTE**: HDF5 does not support cross compilation (see
[here](https://portal.hdfgroup.org/pages/viewpage.action?pageId=48808266)), which means
it cannot be used with BinaryBuilder.
So much for this experiment then.
