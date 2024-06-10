#!/usr/bin/env bash

set -xe

rm -rf repos/
mkdir repos/

if [[ -z "$USE_LOCAL_REPOSITORIES" ]]; then
  git clone https://github.com/AshwinSriram11/prometheus-operator.git -b docs-restructure --depth 1 repos/prometheus-operator
  git clone https://github.com/prometheus-operator/kube-prometheus -b main --depth 1 repos/kube-prometheus
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

# prologue section
cp repos/prometheus-operator/Documentation/compatibility.md content/docs/prologue/compatibility.md
cp repos/prometheus-operator/Documentation/design.md content/docs/prologue/design.md

# api section
cp repos/prometheus-operator/Documentation/api.md content/docs/api-reference/api.md

# beginner section
cp repos/prometheus-operator/Documentation/user-guides/getting-started.md content/docs/beginner/getting-started.md
cp repos/prometheus-operator/Documentation/user-guides/alerting.md content/docs/beginner/alerting.md
cp repos/prometheus-operator/Documentation/user-guides/prometheus-agent.md content/docs/beginner/prometheus-agent.md
cp repos/prometheus-operator/Documentation/user-guides/scrapeconfig.md content/docs/beginner/scrapeconfig.md
cp repos/prometheus-operator/Documentation/user-guides/webhook.md content/docs/beginner/webhook.md

# advanced section
cp repos/prometheus-operator/Documentation/operator.md content/docs/advanced/operator.md
cp repos/prometheus-operator/Documentation/high-availability.md content/docs/advanced/high-availability.md
cp repos/prometheus-operator/Documentation/rbac-crd.md content/docs/advanced/rbac-crd.md
cp repos/prometheus-operator/Documentation/rbac.md content/docs/advanced/rbac.md
cp repos/prometheus-operator/Documentation/thanos.md content/docs/advanced/thanos.md
cp repos/prometheus-operator/Documentation/troubleshooting.md content/docs/advanced/troubleshooting.md
cp repos/prometheus-operator/Documentation/user-guides/storage.md content/docs/advanced/storage.md
cp repos/prometheus-operator/Documentation/user-guides/strategic-merge-patch.md content/docs/advanced/strategic-merge-patch.md

# kube-prometheus section
cp repos/kube-prometheus/docs/blackbox-exporter.md content/docs/kube/blackbox-exporter.md
cp repos/kube-prometheus/docs/deploy-kind.md content/docs/kube/deploy-kind.md
cp repos/kube-prometheus/docs/customizations/developing-prometheus-rules-and-grafana-dashboards.md content/docs/kube/developing-prometheus-rules-and-grafana-dashboards.md
cp repos/kube-prometheus/docs/customizations/exposing-prometheus-alertmanager-grafana-ingress.md content/docs/kube/exposing-prometheus-alertmanager-grafana-ingress.md
cp repos/kube-prometheus/docs/kube-prometheus-on-kubeadm.md content/docs/kube/kube-prometheus-on-kubeadm.md
cp repos/kube-prometheus/docs/monitoring-external-etcd.md content/docs/kube/monitoring-external-etcd.md
cp repos/kube-prometheus/docs/monitoring-other-namespaces.md content/docs/kube/monitoring-other-namespaces.md

# community section
cp repos/prometheus-operator/CONTRIBUTING.md content/docs/community/contributing.md
cp repos/prometheus-operator/TESTING.md content/docs/community/testing.md
cp repos/prometheus-operator/DCO content/docs/community/dco.md
cp repos/prometheus-operator/LICENSE content/docs/community/license.md
cp repos/prometheus-operator/code-of-conduct.md content/docs/community/code-of-conduct.md
cp repos/prometheus-operator/RELEASE.md content/docs/community/release.md