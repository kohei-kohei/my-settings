#!/bin/bash

# set -e

# 色をつけて出力する
echo -e "\e[35mcurrent aws profile: $AWS_PROFILE \e[m\n"

AWS_CONFIG="$HOME/.aws/config"

pattern="^\[profile (.*)\]$"

# ファイルを読み込んでパターンにマッチする部分を抽出
profiles=($(grep -oE "$pattern" "$AWS_CONFIG" | sed 's/\[profile//g; s/\]//g' ))

PS3='select profile number >> '

select profile in "${profiles[@]}"
do
  export AWS_PROFILE=$profile
  echo "\n\e[35mexport AWS_PROFILE=$AWS_PROFILE \e[m\n"
  break
done

echo "aws configure list"
aws configure list
