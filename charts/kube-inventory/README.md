# Kube Inventory Helm Chart

A Helm chart for deploying Kube Inventory, a Kubernetes cluster monitoring and inventory management solution.

## Overview

This chart deploys [Kube Inventory](https://github.com/srekit/kube-inventory) on a Kubernetes cluster using the Helm package manager. 
It includes monitoring capabilities with Prometheus integration and Grafana dashboards.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- Prometheus Operator (for monitoring features)
- Grafana (for dashboards)


## Installation

```bash
helm repo add srekit https://srekit.github.io/helm-charts
helm repo update
helm -n inventory upgrade kube-inventory --install --create-namespace srekit/kube-inventory
```

## Required Access

The Kube Inventory requires certain permissions to access cluster resources:
- Get and List all `namespaces` in the cluster.
- Get and List all `pods` in the cluster.


## Arguments

| Argument                                             | Options         | Description                              | Default                    |
|------------------------------------------------------|-----------------|------------------------------------------|----------------------------|
| `clusterRoles.create`                                | `true`, `false` | Create ClusterRoles for Kube Inventory   | `true`                     |
| `container.name`                                     | `<string>`      | Name of the container                    | `kube-inventory`           |
| `container.portName`                                 | `<string>`      | Name of the container port               | `http`                     |
| `container.protocol`                                 | `<string>`      | Protocol used by the container port      | `TCP`                      |
| `container.livenessProbe.initialDelaySeconds`        | `<int>`         | Initial delay for liveness probe         | `30`                       |
| `container.livenessProbe.periodSeconds`              | `<int>`         | Period for liveness probe                | `10`                       |
| `container.livenessProbe.timeoutSeconds`             | `<int>`         | Timeout for liveness probe               | `5`                        |
| `container.livenessProbe.failureThreshold`           | `<int>`         | Failure threshold for liveness probe     | `3`                        |
| `container.readinessProbe.initialDelaySeconds`       | `<int>`         | Initial delay for liveness probe         | `30`                       |
| `container.readinessProbe.periodSeconds`             | `<int>`         | Period for liveness probe                | `10`                       |
| `container.readinessProbe.timeoutSeconds`            | `<int>`         | Timeout for liveness probe               | `5`                        |
| `container.readinessProbe.failureThreshold`          | `<int>`         | Failure threshold for liveness probe     | `3`                        |
| `container.securityContext.allowPrivilegeEscalation` | `true`, `false` | Allow privilege escalation               | `false`                    |
| `container.securityContext.readOnlyRootFilesystem`   | `true`, `false` | Read-only root filesystem                | `false`                    |
| `container.securityContext.capabilities.drop`        | `<list>`        | Capabilities to drop                     | `["ALL"]`                  |
| `dashboards.enabled`                                 | `true`, `false` | Enable Grafana dashboards                | `true`                     |
| `extraApps.fileDirPath`                              | `<string>`      | Path to extra apps directory             | `"/app/config"`            |
| `extraApps.fileName`                                 | `<string>`      | Name of the extra apps config file       | `"extra-apps.yaml"`        |
| `extraApps.apps`                                     | `<list>`        | List of extra apps to monitor            | `[]`                       |
| `fullnameOverride`                                   | `<string>`      | Override the full name of the release    | `""`                       |
| `github.apiUrl`                                      | `<string>`      | GitHub API URL                           | `"https://api.github.com"` |
| `github.env`                                         | `<string>`      | GitHub environment for Access Token      | `"GITHUB_ACCESS_TOKEN"`    |
| `github.token`                                       | `<string>`      | GitHub Access Token                      | `""`                       |
| `image.name`                                         | `<string>`      | Kube Inventory image name                | `"kube-inventory"`         |
| `image.pullPolicy`                                   | `<string>`      | Image pull policy                        | `"IfNotPresent"`           |
| `image.tag`                                          | `<string>`      | Kube Inventory image tag                 | `"1.0.1"`                  |
| `logLevel`                                           | `<string>`      | Log level for Kube Inventory             | `"INFO"`                   |
| `podMonitor.enabled`                                 | `true`, `false` | Enable PodMonitor for Prometheus         | `true`                     |
| `podMonitor.interval`                                | `<string>`      | Scrape interval for PodMonitor           | `"60s"`                    |
| `podMonitor.labels`                                  | `<map>`         | Labels for PodMonitor                    | `{}`                       |
| `podMonitor.path`                                    | `<string>`      | Metrics path for PodMonitor              | `"/metrics"`               |
| `podMonitor.prometheusNamespace`                     | `<string>`      | Prometheus namespace for PodMonitor      | `"monitoring"`             |
| `podMonitor.prometheusName`                          | `<string>`      | Prometheus name for PodMonitor           | `"prometheus"`             |
| `podMonitor.scrapeTimeout`                           | `<string>`      | Scrape timeout for PodMonitor            | `"10s"`                    |
| `podSecurityContext.runAsNonRoot`                    | `true`, `false` | Run pod as non-root user                 | `true`                     |
| `podSecurityContext.runAsUser`                       | `<int>`         | User ID to run the pod as                | `1000`                     |
| `podSecurityContext.fsGroup`                         | `<int>`         | File system group ID                     | `1000`                     |
| `prometheusRules.enabled`                            | `true`, `false` | Enable PrometheusRules for monitoring    | `false`                    |
| `prometheusRules.interval`                           | `<string>`      | Evaluation interval for PrometheusRules  | `"30s"`                    |
| `prometheusRules.rules`                              | `<list>`        | List of Prometheus alerting rules        | `[]`                       |
| `refreshInterval`                                    | `<string>`      | Data refresh interval                    | `"5m"`                     |
| `replicaCount`                                       | `<int>`         | Number of replicas to deploy             | `1`                        |
| `resources.limits.memory`                            | `<string>`      | Memory limit for the container           | `"128Mi"`                  |
| `resources.requests.cpu`                             | `<string>`      | CPU request for the container            | `"100m"`                   |
| `resources.requests.memory`                          | `<string>`      | Memory request for the container         | `"128Mi"`                  |
| `serviceAccount.create`                              | `true`, `false` | Create ServiceAccount for Kube Inventory | `true`                     |
| `serviceAccount.name`                                | `<string>`      | Name of the ServiceAccount               | `""`                       |
