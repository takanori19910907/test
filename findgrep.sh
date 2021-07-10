#!/bin/bash

usage()

{

  echo "usage"

}

if [ "$#" -eq 0 ]; then

  usage

  exit 1

fi

pattern=$1
dir=$2
name=$3


if [ -z "$dir" ]; then

  dir='.'

fi

if [ -z "$name" ]; then

  name='*'

fi

if [ ! -d "$dir" ]; then

  echo "${dir}というファイルは見つかりませんでした" 1>&2

  exit 2

fi

find "$dir" -type f -name "$name"  | xargs grep -n "$pattern"
