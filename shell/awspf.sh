#!/bin/bash

# set -e

# 色をつけて出力する
printf "aws profile:\033[35m $AWS_PROFILE \033[m\n\n"

AWS_CONFIG="$HOME/.aws/config"
AWS_CREDENTIALS="$HOME/.aws/credentials"

# ファイルを読み込んでパターンにマッチする部分を抽出
pattern="^\[profile (.*)\]$"
configs=($(grep -oE "$pattern" "$AWS_CONFIG" | sed 's/\[profile//g; s/\]//g' ))

pattern="^\[(.*)\]$"
credentials=($(grep -oE "$pattern" "$AWS_CREDENTIALS" | sed 's/\[//g; s/\]//g' ))

profiles=("${configs[@]}" "${credentials[@]}")

PS3='select profile number >> '

select profile in "${profiles[@]}"
do
  export AWS_PROFILE=$profile
  echo "\n\e[35mexport AWS_PROFILE=$AWS_PROFILE \e[m\n"
  break
done

echo "aws configure list"
aws configure list
