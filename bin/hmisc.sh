#!/bin/sh

mkdir -p $HOME/.aws/cli
curl -q -o $HOME/.aws/cli/alias https://raw.githubusercontent.com/awslabs/awscli-aliases/master/alias
