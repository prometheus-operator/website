#!/usr/bin/env bash

set -xe

rm -rf repos/
mkdir repos/

if [[ -z "$USE_LOCAL_REPOSITORIES" ]]; then
  git clone https://github.com/prometheus-operator/prometheus-operator -b main --depth 1 repos/prometheus-operator
  # git clone https://github.com/prometheus-operator/kube-prometheus -b main --depth 1 repos/kube-prometheus
  git clone https://github.com/AshwinSriram11/kube-prometheus -b main repos/kube-prometheus
else
  ln -s ../../prometheus-operator repos/prometheus-operator 
  ln -s ../../kube-prometheus repos/kube-prometheus
fi

for r in repos/prometheus-operator repos/kube-prometheus; do
  echo "$r -> ""$(cd $r && git rev-parse HEAD)"
done

# main section + images
cp repos/prometheus-operator/ADOPTERS.md content/adopters.md
cp -r repos/prometheus-operator/Documentation/img static/img

# getting-started section
cp repos/prometheus-operator/Documentation/compatibility.md content/docs/getting-started/compatibility.md
cp repos/prometheus-operator/Documentation/design.md content/docs/getting-started/design.md

# api section
cp repos/prometheus-operator/Documentation/api.md content/docs/api-reference/api.md

# developer guide
cp repos/prometheus-operator/Documentation/user-guides/getting-started.md content/docs/developer/getting-started.md
cp repos/prometheus-operator/Documentation/user-guides/alerting.md content/docs/developer/alerting.md
cp repos/prometheus-operator/Documentation/user-guides/scrapeconfig.md content/docs/developer/scrapeconfig.md

# platform guide
cp repos/prometheus-operator/Documentation/user-guides/webhook.md content/docs/platform/webhook.md
cp repos/prometheus-operator/Documentation/user-guides/prometheus-agent.md content/docs/platform/prometheus-agent.md
cp repos/prometheus-operator/Documentation/operator.md content/docs/platform/operator.md
cp repos/prometheus-operator/Documentation/high-availability.md content/docs/platform/high-availability.md
cp repos/prometheus-operator/Documentation/rbac-crd.md content/docs/platform/rbac-crd.md
cp repos/prometheus-operator/Documentation/rbac.md content/docs/platform/rbac.md
cp repos/prometheus-operator/Documentation/thanos.md content/docs/platform/thanos.md
cp repos/prometheus-operator/Documentation/troubleshooting.md content/docs/platform/troubleshooting.md
cp repos/prometheus-operator/Documentation/user-guides/storage.md content/docs/platform/storage.md
cp repos/prometheus-operator/Documentation/user-guides/strategic-merge-patch.md content/docs/platform/strategic-merge-patch.md

# community section
cp repos/prometheus-operator/CONTRIBUTING.md content/docs/community/contributing.md
cp repos/prometheus-operator/TESTING.md content/docs/community/testing.md
cp repos/prometheus-operator/DCO content/docs/community/dco.md
cp repos/prometheus-operator/code-of-conduct.md content/docs/community/code-of-conduct.md
cp repos/prometheus-operator/RELEASE.md content/docs/community/release.md

# kube-prometheus docs
cp repos/kube-prometheus/docs/access-ui.md content/kube-prometheus/kube/access-ui.md
cp repos/kube-prometheus/docs/blackbox-exporter.md content/kube-prometheus/kube/blackbox-exporter.md
cp repos/kube-prometheus/docs/deploy-kind.md content/kube-prometheus/kube/deploy-kind.md
cp repos/kube-prometheus/docs/customizations/developing-prometheus-rules-and-grafana-dashboards.md content/kube-prometheus/kube/developing-prometheus-rules-and-grafana-dashboards.md
cp repos/kube-prometheus/docs/customizations/exposing-prometheus-alertmanager-grafana-ingress.md content/kube-prometheus/kube/exposing-prometheus-alertmanager-grafana-ingress.md
cp repos/kube-prometheus/docs/kube-prometheus-on-kubeadm.md content/kube-prometheus/kube/kube-prometheus-on-kubeadm.md
cp repos/kube-prometheus/docs/monitoring-external-etcd.md content/kube-prometheus/kube/monitoring-external-etcd.md
cp repos/kube-prometheus/docs/monitoring-other-namespaces.md content/kube-prometheus/kube/monitoring-other-namespaces.md
