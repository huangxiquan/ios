#!/usr/bin/env bash
for file in ./*
do
    if [ -d "$file" ]
        then
            echo $file
            cd $file
            rm -rf .git
            cd ..
        else
            echo "no dir"
    fi
done
