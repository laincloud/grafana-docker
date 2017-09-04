#!/bin/bash

_grafana_tag=$1
_grafana_version=${_grafana_tag:1}

if [ "$_grafana_version" != "" ]; then
	echo "pushing mobanche/grafana:${_grafana_version}"
	docker push mobanche/grafana:${_grafana_version}
	docker push mobanche/grafana:latest
else
	echo "please input the version"
	# echo "pushing mobanche/grafana:master"
	# docker push mobanche/grafana:master
fi
