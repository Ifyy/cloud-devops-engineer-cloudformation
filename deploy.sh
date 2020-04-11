#!/bin/bash

PARAMS=$(jq -r '.[] | [.ParameterKey, .ParameterValue] | "\"\(.[0])=\(.[1])\""' $3)

eval aws cloudformation deploy \
  --template-file $1 \
  --stack-name $2 \
  --parameter-overrides ${PARAMS[@]} \
  --capabilities CAPABILITY_IAM
