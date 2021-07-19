#!/bin/bash

cd app

for yaml in sushi-proxy_demo.yaml sushi-Z.yaml sushi-power_sandbox.yaml sushi-dev.yaml sushi-x86.yaml; do
    argocd app create -f $yaml
done

echo
echo "---"
echo "proxy-stats: http://proxy-stats.10.3.3.60.nip.io/stats"
echo 
echo "sushi-everywhere: http://sushi-everywhere.10.3.3.60.nip.io"
echo
echo "----"
echo "gitlab webcode: https://gitlab.com/schabrolles/sushiweb"
echo "gitlab argo: https://gitlab.com/schabrolles/argocd-demo"
echo
