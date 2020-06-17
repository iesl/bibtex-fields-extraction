#!/bin/bash

/mnt/nfs/scratch1/zhiyangxu/fairseq-cfe/baseline-scripts/conlleval.pl -d "\t" < $1 > $1.eval
