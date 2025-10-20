#!/bin/sh
#PJM -L rscgrp=b-batch
#PJM -L gpu=1
#PJM -L elapse=1:00:00
#PJM -j

source ~/.bashrc
conda activate genkai
module load cuda

bash exp.sh
