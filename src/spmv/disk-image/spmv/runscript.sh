#!/bin/sh

# Copyright (c) 2020 The Regents of the University of California.
# SPDX-License-Identifier: BSD 3-Clause


# This file is the script that runs on the gem5 guest.

cd /home/gem5/spmv

./__A_WORKLOAD__;
