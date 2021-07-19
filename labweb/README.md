# Labweb

SushiWeb is a simple containerized http website used to demonstrate :
 - Docker containerization concept
 - Multi-Architecture Containerization
 - Kubernetes helm chart creation
 - Integration into IBM ICP catalog

## Introduction

This chart is a generic chart intended to be deployed in IBM Cloud Private environments. 

## Prerequisites

Nothing Special, but having Power and Intel worker node into the cluster helps to demonstrate multiarchitecure deployement.

## Installing the Chart

To install the chart with the release name `my-release`:

```bash
$ helm install --name my-release sushiweb
```

> **Tip**: List all releases using `helm list`

## Verifying the Chart
See NOTES.txt associated with this chart for verification instructions

## Uninstalling the Chart

To uninstall/delete the `my-release` deployment:

```bash
$ helm delete my-release
```

The command removes all the Kubernetes components associated with the chart and deletes the release.  If a delete can result in orphaned components include instructions additional commands required for clean-up.  

For example :

When deleting a release with stateful sets the associated persistent volume will need to be deleted.  
Do the following after deleting the chart release to clean up orphaned Persistent Volumes.

```console
$ kubectl delete pvc -l release=my-release
``` 

## Configuration
The following tables lists the configurable parameters of the IBM PostgreSQL chart and their default values.

| Parameter                            | Description                                     | Default                                                    |
| ----------------------------------   | ---------------------------------------------   | ---------------------------------------------------------- |
| `arch.amd64`                  | `Amd64 worker node scheduler preference in a hybrid cluster` | `2 - No preference` - worker node is chosen by scheduler       |
| `arch.ppc64le`                | `Ppc64le worker node scheduler preference in a hybrid cluster` | `2 - No preference` - worker node is chosen by scheduler       |
| `image`                              | `sushiweb` image repository                   | `schabrolles/sushiweb`                                               |
| `imageTag`                           | `sushiweb` image tag                          | `latest`                                                    |
| `imagePullPolicy`                    | Image pull policy                               | `Always` if `imageTag` is `latest`, else `IfNotPresent`    |
| `persistence.enabled`                | Use a PVC to persist data                       | `false`                                                     |
| `persistence.useDynamicProvisioning` | Specify a storageclass or leave empty           | `false`                                                    |
| `resources`                          | CPU/Memory resource requests/limits             | Memory: `100Mi`, CPU: `200m`                               |
| `service.port`                       | TCP port                                        | `80`                                                     |
| `service.type`                       | k8s service type exposing ports, e.g. `NodePort`| `NodePort`                                                 |


Specify each parameter using the `--set key=value[,key=value]` argument to `helm install`.

Alternatively, a YAML file that specifies the values for the parameters can be provided while installing the chart. For example,

> **Tip**: You can use the default [values.yaml](values.yaml)

## Architecture

- Two major architectures are now available for Sushiweb on IBM Cloud Private worker nodes:
  - AMD64 / x86_64
  - ppc64le

An ‘arch’ field in values.yaml is required to specify supported architectures to be used during scheduling and includes ability to give preference to certain architecture(s) over another.

Specify architecture (amd64, ppc64le) and weight to be  used for scheduling as follows :
   0 - Do not use
   1 - Least preferred
   2 - No preference
   3 - Most preferred
