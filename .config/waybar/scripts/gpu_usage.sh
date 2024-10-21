#!/bin/bash

radeontop -d - -l 1 | grep -m 1 'gpu' | awk '{gsub(/,$/, "", $5); gsub(/%/, "", $5); print int($5)}'


