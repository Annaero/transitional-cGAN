#!/bin/bash
set -e

declare -A classes=( ['triangle']=0
                     ['circle']=1
                     ['rectangle']=2
                     ['kite']=3
                     ['square']=4
                     ['rhombus']=5
                     ['trapezoid']=6
                     ['parallelogram']=7
                    )

# check whether user had supplied -h or --help . If yes display usage
if [[ ( $@ == "--help") ||  $@ == "-h" ]]
then 
    echo "Usage: $0 [CLASS_NAME] [SAMPLES=4]"
    echo ""
    echo "    CLASS_NAME - name if the class, should be one of:"
    echo "        ${!classes[@]}"
    echo "    SAMPLES - number of samples to generate, default=4"
    echo ""
    exit 0
fi 

if [ -z "$1" ]; then
    echo "No class name supplied" >&2
    exit 1
fi

re='^[0-9]+$'
if [ -z $2 ]; then
    N=4
elif ! [[ $2 =~ $re ]]; then
    echo "Invalid value for SAMPLES, got '$2'" >&2
    exit 1
else
    N=$2
fi

if [ -v classes[$1] ]; then
    python generate.py \
        --network=./checkpoints/network-snapshot-003800.pkl \
        --class=${classes[$1]} \
        --outdir=generated/$1 \
        --seeds=`seq -s ',' 1 $N`
else
    echo "Unknown class $1." >&2
    echo "Known classes are ${!classes[@]}" >&2
    exit 1
fi

