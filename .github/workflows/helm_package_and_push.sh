#!/bin/bash

if [[ $# -ne 4 ]] ; then
    echo 'Need chart name, chart dir, repo name and repo remote url as arguments'
    exit 1
fi

chartName=$1
chartDirName=$2
repoName=$3
remoteUrl=$4
helmv3 package $2
helmv3 plugin install https://github.com/hypnoglow/helm-s3.git
helmv3 repo add $repoName $remoteUrl
helmv3 repo update
export HELM_S3_MODE=3
chartTarBallName=$(ls *.tgz | grep $chartName)
helmv3 s3 push --force $chartTarBallName $repoName

