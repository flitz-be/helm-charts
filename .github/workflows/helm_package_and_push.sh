#!/bin/bash

if [[ $# -ne 3 ]] ; then
    echo 'Need chart dir name, repo name and repo remote url as arguments'
    exit 1
fi

chartDirName=$1
repoName=$2
remoteUrl=$3
helmv3 package $1
helmv3 plugin install https://github.com/hypnoglow/helm-s3.git
helmv3 repo add $repoName $remoteUrl
helmv3 repo update
export HELM_S3_MODE=3
chartTarBallName=$(ls *.tgz | grep $chartDirName)
helmv3 s3 push --force $chartTarBallName $repoName

