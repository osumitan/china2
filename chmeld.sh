#!/bin/sh

LOG_HOME=/home/sysadmin/data/develop/sh/china2/log
PARAM=$1
PREFIX=${LOG_HOME}/${PARAM}

CNT=`ls ${PREFIX}* | wc -l`
if [ ${CNT} -ne 2 ]
then
	echo "illegal file count: ${PARAM} ${CNT}"
	exit 1
fi

FILEA=`ls ${PREFIX}* | head -1`
FILEB=`ls ${PREFIX}* | head -2 | tail -1`

meld ${FILEA} ${FILEB}

