#!/bin/bash
exec wsadmin.sh -lang jython -conntype NONE \
    -javaoption -Dcom.ibm.ws.scripting.exceptionPropagation=thrown \
    -javaoption -Dpython.path=${WDR_HOME}/lib/legacy:${WDR_HOME}/lib/common:. \
    -profile ${WDR_HOME}/profile.py \
    "$@"
