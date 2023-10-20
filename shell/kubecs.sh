#!/bin/zsh

set -e

# 色をつけて出力する
printf "current context:\033[35m $(kubectl config current-context) \033[m\n\n"

configs=$(kubectl config get-contexts)

contexts=($(echo $configs | grep -o 'arn[^[:space:]]*' | sort -u))

PS3=$'\nselect context >> '

select context in "${contexts[@]}"
do
  printf '\n\033[35m%s\033[m\n' "$(kubectl config use-context $context)"
  break
done
