#!/bin/sh

# ホームフォルダ
HOME=~/data/develop/sh/china2
SITE=${HOME}/sitelist.txt

# ログファイル名
DT=`date +"%Y%m%d%H%M%S"`
LOG="${HOME}/log"

# HTMLダウンロード
echo "■ ■ ■ HTMLダウンロード ■ ■ ■"
cat ${SITE} | gawk -v dt=${DT} -v homedir=${HOME} -v logdir=${LOG} -f ${HOME}/pagelist.awk | bash

# 前回と比較
echo "■ ■ ■ 前回と比較 ■ ■ ■"
cat ${SITE} | gawk -v home=${HOME} -v logdir=${LOG} -f ${HOME}/compare.awk | bash

# クリーン
echo "■ ■ ■ クリーン ■ ■ ■"
cat ${SITE} | gawk -v home=${HOME} -v logdir=${LOG} -f ${HOME}/clean.awk | bash

# サイズゼロ
echo "■ ■ ■ サイズゼロ ■ ■ ■"
echo "--tmp"
ls -l ${LOG} | gawk '/\.tmp$/{if($5=="0") printf("%s\n",$9);}'
echo "--html"

ls -l ${LOG} | gawk '/\.html$/{if($5=="0") if(match($9,/^[^_]*_[^_]*/)) printf("%s\n",substr($9,RSTART,RLENGTH));}' | sort | uniq

