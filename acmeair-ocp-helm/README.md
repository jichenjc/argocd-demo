```
helm install acmeair2 acmeair --set host=acmeair2.apps.ocp4.demointel.mpl --create-namespace -n acmeair2
```

```
helm plugin install https://github.com/app-registry/quay-helmv3-plugin

helm quay install quay.io/schabrolles/acmeair -- acmeair --set host=acmeair.apps.sandbox.power.mpl --create-namespace -n acmeair
```

```

```
