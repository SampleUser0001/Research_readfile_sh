#!/bin/bash

while read data; do
  echo ${data}
done << END
`cat $1`
END
