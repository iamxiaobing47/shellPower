#!/bin/bash

function log_msg {
  echo "$(date '+ %F %T'):" "$@"        #[ 2024-05-22 18:24:26 ]: var1 var2
  echo "$(date '+ %A, %B %-d, %Y'):" "$@"  #[ Wednesday, May 22, 2024]: var1 var2
}


function main {
  log_msg "var1" "var2"
}

main