# Kube Inventory Helm Chart

A Helm chart for deploying Kube Inventory, a Kubernetes cluster monitoring and inventory management solution.

## Overview

This chart deploys Kube Inventory on a Kubernetes cluster using the Helm package manager. 
It includes monitoring capabilities with Prometheus integration and Grafana dashboards.

## Prerequisites

- Kubernetes 1.19+
- Helm 3.0+
- Prometheus Operator (for monitoring features)
- Grafana (for dashboards)

## Installation

### Add Helm Repository

```bash
helm repo add <your-repo-name> <repository-url>
helm repo update
```
