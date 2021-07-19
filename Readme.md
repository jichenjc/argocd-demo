# ArgoCD Demo - Sushiweb Mutli-Arch

ArgoCD server: https://argocd-demo.10.3.3.60.nip.io

### 0 (optional) - Provision sushi-proxy with the ArgoCD GUI

```
application: haproxy/sushi/overlays/demo

target cluster name: x86-Cluster
namespace: argocd-demo
```

- check proxy stats
http://proxy-stats.10.3.3.60.nip.io/stats

### 1 - Deploy all the applications with the CLI

- Login to argocd

```sh
./1-argocd_login.sh
```

- Deploy application

```sh
./2-start_sushidevops_demo.sh
```

- check proxy stats
http://proxy-stats.10.3.3.60.nip.io/stats

- Test sushi web site 
http://sushi-everywhere.10.3.3.60.nip.io
