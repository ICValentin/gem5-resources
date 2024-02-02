---
title: SpMV
tags:
    - x86
    - fullsystem
permalink: resources/spmv
shortdoc:
author: ["Valentin Isaac--Chassande"]
---

This document provides instructions to create a disk image, which, along with an example script, may be used to run SpMV kernels within gem5 simulations.

## Building the Disk Image

Assuming that you are in the `src/spmv/` directory, first create `m5` (which is needed to create the disk image):

```sh
git clone https://gem5.googlesource.com/public/gem5
cd gem5/util/m5
scons build/x86/out/m5
```

To create the disk image you need to add the packer binary in the disk-image directory:

```sh
cd disk-image/
./build.sh          # the script downloading packer binary and building the disk image
```

After this process succeeds, the disk image can be found on the `src/spmv/disk-image/spmv-image/spmv`.

SpMV.zip for matrices. (TODO)
