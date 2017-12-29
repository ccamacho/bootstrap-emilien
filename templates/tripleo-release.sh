#!/bin/bash

RELEASE=$1
TYPE=$2
#git branch -D tripleo/$RELEASE || true
#git checkout -b tripleo/$RELEASE

if [[ "$RELEASE" == "newton" ]]; then
#    PROJECTS="instack os-net-config instack-undercloud os-collect-config tripleo-ui puppet-tripleo os-refresh-config os-apply-config python-tripleoclient tripleo-image-elements tripleo-validations tripleo-puppet-elements tripleo-heat-templates tripleo-common"
    PROJECTS="instack os-net-config instack-undercloud os-collect-config os-refresh-config os-apply-config python-tripleoclient tripleo-image-elements tripleo-validations tripleo-puppet-elements tripleo-heat-templates tripleo-common"
    PROJECTS="instack os-net-config instack-undercloud os-collect-config os-refresh-config os-apply-config python-tripleoclient tripleo-image-elements tripleo-validations tripleo-puppet-elements tripleo-heat-templates tripleo-common"
elif [[ "$RELEASE" == "ocata" ]]; then
    PROJECTS="instack os-net-config instack-undercloud os-collect-config puppet-tripleo os-refresh-config os-apply-config python-tripleoclient tripleo-image-elements tripleo-validations tripleo-puppet-elements tripleo-heat-templates tripleo-common"
    PROJECTS="instack os-net-config instack-undercloud os-collect-config os-refresh-config os-apply-config python-tripleoclient tripleo-image-elements tripleo-validations tripleo-puppet-elements tripleo-heat-templates tripleo-common"
elif [[ "$RELEASE" == "pike" ]]; then
    PROJECTS="instack os-net-config instack-undercloud os-collect-config tripleo-ui puppet-tripleo os-refresh-config os-apply-config python-tripleoclient tripleo-image-elements tripleo-validations tripleo-puppet-elements tripleo-heat-templates tripleo-common paunch"
elif [[ "$RELEASE" == "queens" ]]; then
    PROJECTS_MILESTONE="tripleo-image-elements tripleo-puppet-elements tripleo-heat-templates"
    PROJECTS_FEATURE="instack os-net-config instack-undercloud os-collect-config tripleo-ui puppet-tripleo os-refresh-config os-apply-config python-tripleoclient tripleo-validations paunch tripleo-common"
else
    echo "$RELEASE release isn't supported."
fi

for p in $PROJECTS;
do
    tox -e venv -- new-release $RELEASE $p $TYPE
done

for p in $PROJECTS_MILESTONE;
do
    tox -e venv -- new-release $RELEASE $p milestone
done

for p in $PROJECTS_FEATURE;
do
    tox -e venv -- new-release $RELEASE $p feature
done

git add *
git commit -m "TripleO $RELEASE release"
