#!/bin/bash

set -e 
 failure(){

    echo "failed at:$1 and $2"

 }
trap ' failure "${LINENO}" "$BASH_COMMAND" ' ERR
echo "hello world"
echooo "hello world"
echo "helloworld two"

