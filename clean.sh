# 変数初期化
LOGDIR=$1
AREA=$2
SHOP=$3
PAGE=$4

# cd
cd ${LOGDIR}

# 直近２ファイルを残して削除
ls -r ${AREA}_${SHOP}_${PAGE}_*.html | gawk 'BEGIN{a=0;}{a++;if(a>=3){print("rm -f " $1);}}' | bash

