# magma_crashes

This repository contains PoCs for crashes discovered in [srividya-p/magma](https://github.com/srividya-p/magma).

To run a PoC create a file named `config` in the repository root with the following values (for example):
```bash
TARGET=libpng
BUG=TIF009
```

To build the container with the bug applied and run the PoC script for the bug:
```bash
$ ./run.sh
```

To add a new PoC, create a folder `<TARGET>/<BUG>`. This folder must contain the following:

1. Input file causing the crash named with the format `*_<BUG>.*`
2. Patch to apply to the `TARGET` source code to introduce the bug
3. A `poc.sh` script to reproduce the crash using the container specified in `TAG`
4. [OPTIONAL] A folder with other input files which also cause the same bug
