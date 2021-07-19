#!/bin/bash

oc login https://10.3.3.202:6443

for project in sushi-proxy sushi-devops sushi-devops-dev; do 

    ./force-delete-openshift-project -n $project
done
