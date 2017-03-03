# 変数初期化
LOGDIR=$1
AREA=$2
SHOP=$3
PAGE=$4

# cd
cd ${LOGDIR}

# 差異を取得
CNT=`ls -r ${AREA}_${SHOP}_${PAGE}_*.html | head -2 | gawk 'BEGIN{a=1;}{b[a++]=$0;}END{print "diff " b[2] " " b[1] " 2>/dev/null";}' | bash | wc -l`

# 差異があったら表示
if [ ${CNT} -ge 1 ]
then
	echo "chmeld ${AREA}_${SHOP}_${PAGE}"
fi

