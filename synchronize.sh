#!/usr/bin/env bash

set -xe

rm -rf repos/
mkdir repos/

git clone https://github.com/prometheus-operator/prometheus-operator -b main --depth 1 repos/prometheus-operator
git clone https://github.com/prometheus-operator/kube-prometheus -b main --depth 1 repos/kube-prometheus

# prometheus-operator

cp repos/prometheus-operator/ADOPTERS.md content/adopters.md
cp repos/prometheus-operator/CONTRIBUTING.md content/docs/prologue/contributing.md
cp repos/prometheus-operator/Documentation/api.md content/docs/operator/api.md
cp repos/prometheus-operator/Documentation/compatibility.md content/docs/operator/compatibility.md
cp repos/prometheus-operator/Documentation/design.md content/docs/operator/design.md
cp repos/prometheus-operator/Documentation/high-availability.md content/docs/operator/high-availability.md
cp repos/prometheus-operator/Documentation/rbac-crd.md content/docs/operator/rbac-crd.md
cp repos/prometheus-operator/Documentation/rbac.md content/docs/operator/rbac.md
cp repos/prometheus-operator/Documentation/thanos.md content/docs/operator/thanos.md
cp repos/prometheus-operator/Documentation/troubleshooting.md content/docs/operator/troubleshooting.md

cp -r repos/prometheus-operator/Documentation/img static/img

# kube-prometheus

cp repos/kube-prometheus/docs/blackbox-exporter.md content/docs/kube/blackbox-exporter.md
cp repos/kube-prometheus/docs/deploy-kind.md content/docs/kube/deploy-kind.md
cp repos/kube-prometheus/docs/customizations/developing-prometheus-rules-and-grafana-dashboards.md content/docs/kube/developing-prometheus-rules-and-grafana-dashboards.md
cp repos/kube-prometheus/docs/customizations/exposing-prometheus-alertmanager-grafana-ingress.md content/docs/kube/exposing-prometheus-alertmanager-grafana-ingress.md
cp repos/kube-prometheus/docs/kube-prometheus-on-kubeadm.md content/docs/kube/kube-prometheus-on-kubeadm.md
cp repos/kube-prometheus/docs/monitoring-external-etcd.md content/docs/kube/monitoring-external-etcd.md
cp repos/kube-prometheus/docs/monitoring-other-namespaces.md content/docs/kube/monitoring-other-namespaces.md
