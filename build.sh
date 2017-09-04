#!/bin/bash

_grafana_tag=$1
_grafana_version=${_grafana_tag:1}

if [ "$_grafana_version" != "" ]; then
	echo "Building version ${_grafana_version}"
	echo "Download url: https://github.com/laincloud/grafana/releases/download/${_grafana_tag}/grafana_${_grafana_version}_amd64.deb"
	
	docker build \
		--build-arg DOWNLOAD_URL=https://github.com/laincloud/grafana/releases/download/${_grafana_tag}/grafana_${_grafana_version}_amd64.deb \
		--tag "laincloud/grafana:${_grafana_version}" \
		--no-cache=true .
	docker tag laincloud/grafana:${_grafana_version} laincloud/grafana:latest

else
	echo "please input the version"
fi
