#!/bin/bash

_grafana_tag=$1
_grafana_version=${_grafana_tag:1}

if [ "$_grafana_version" != "" ]; then
	echo "Building version ${_grafana_version}"
	echo "Download url: https://github.com/lichao-mobanche/grafana/releases/download/${_grafana_tag}/grafana_${_grafana_version}_amd64.deb"
	
	docker build \
		--build-arg DOWNLOAD_URL=https://github.com/lichao-mobanche/grafana/releases/download/${_grafana_tag}/grafana_${_grafana_version}_amd64.deb \
		--tag "mobanche/grafana:${_grafana_version}" \
		--no-cache=true .
	docker tag mobanche/grafana:${_grafana_version} mobanche/grafana:latest

else
	echo "please input the version"
	#echo "Building latest for master"
	# docker build \
	# 	--build-arg DOWNLOAD_URL=https://s3-us-west-2.amazonaws.com/grafana-releases/master/grafana_latest_amd64.deb \
	# 	--tag "grafana/grafana:master" \
	# 	--no-cache=true .
fi
