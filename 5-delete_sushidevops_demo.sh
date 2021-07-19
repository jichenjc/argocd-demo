#!/bin/bash

cd app

for app in sushi-proxy sushi-dev sushi-x86 sushi-z sushi-power; do
    argocd app delete $app --cascade
done

