#!/bin/bash

argocd_server="argocd-demo.10.3.3.60.nip.io"

argocd login $argocd_server --username admin --insecure

echo "agrocd GUI: http://$argocd_server"
