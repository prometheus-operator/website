#!/usr/bin/env bash

set -xe

rm -rf repos/
mkdir repos/

if [[ -z "$USE_LOCAL_REPOSITORIES" ]]; then
  # git clone https://github.com/prometheus-operator/prometheus-operator -b main --depth 1 repos/prometheus-operator
  git clone https://github.com/AshwinSriram11/prometheus-operator -b elastic-ref --depth 1 repos/prometheus-operator
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

# getting-started section
cp repos/prometheus-operator/Documentation/getting-started/introduction.md content/docs/getting-started/introduction.md
cp repos/prometheus-operator/Documentation/getting-started/installation.md content/docs/getting-started/installation.md
cp repos/prometheus-operator/Documentation/getting-started/compatibility.md content/docs/getting-started/compatibility.md
cp repos/prometheus-operator/Documentation/getting-started/design.md content/docs/getting-started/design.md

# api section
cp repos/prometheus-operator/Documentation/api-reference/api.md content/docs/api-reference/api.md
cp repos/prometheus-operator/Documentation/api-reference/elastic-api.md content/docs/api-reference/elastic-api.md

# platform guide
cp repos/prometheus-operator/Documentation/platform/platform-guide.md content/docs/platform/platform-guide.md
cp repos/prometheus-operator/Documentation/platform/exposing-prometheus-and-alertmanager.md content/docs/platform/exposing-prometheus-and-alertmanager.md
cp repos/prometheus-operator/Documentation/platform/webhook.md content/docs/platform/webhook.md
cp repos/prometheus-operator/Documentation/platform/prometheus-agent.md content/docs/platform/prometheus-agent.md
cp repos/prometheus-operator/Documentation/platform/operator.md content/docs/platform/operator.md
cp repos/prometheus-operator/Documentation/platform/high-availability.md content/docs/platform/high-availability.md
cp repos/prometheus-operator/Documentation/platform/rbac-crd.md content/docs/platform/rbac-crd.md
cp repos/prometheus-operator/Documentation/platform/rbac.md content/docs/platform/rbac.md
cp repos/prometheus-operator/Documentation/platform/thanos.md content/docs/platform/thanos.md
cp repos/prometheus-operator/Documentation/platform/troubleshooting.md content/docs/platform/troubleshooting.md
cp repos/prometheus-operator/Documentation/platform/storage.md content/docs/platform/storage.md
cp repos/prometheus-operator/Documentation/platform/strategic-merge-patch.md content/docs/platform/strategic-merge-patch.md

# developer guide
cp repos/prometheus-operator/Documentation/developer/getting-started.md content/docs/developer/getting-started.md
cp repos/prometheus-operator/Documentation/developer/alerting.md content/docs/developer/alerting.md
cp repos/prometheus-operator/Documentation/developer/scrapeconfig.md content/docs/developer/scrapeconfig.md
cp repos/prometheus-operator/Documentation/developer/scrapeclass.md content/docs/developer/scrapeclass.md

# proposals

# implemented
cp repos/prometheus-operator/Documentation/proposals/implemented/202201-prometheus-agent.md content/docs/proposals/implemented/prometheus-agent.md
cp repos/prometheus-operator/Documentation/proposals/implemented/202212-scrape-config.md content/docs/proposals/implemented/scrape-config.md
cp repos/prometheus-operator/Documentation/proposals/implemented/202305-scrapeclasses.md content/docs/proposals/implemented/scrapeclasses.md
cp repos/prometheus-operator/Documentation/proposals/implemented/202309-controller-id.md content/docs/proposals/implemented/controller-id.md
cp repos/prometheus-operator/Documentation/proposals/implemented/202405-docs-restructuring.md content/docs/proposals/implemented/docs-restructuring.md
cp repos/prometheus-operator/Documentation/proposals/implemented/202409-status-subresource.md content/docs/proposals/implemented/status-subresource.md

# accepted
cp repos/prometheus-operator/Documentation/proposals/accepted/202310-shard-autoscaling.md content/docs/proposals/accepted/shard-autoscaling.md
cp repos/prometheus-operator/Documentation/proposals/accepted/202405-agent-daemonset.md content/docs/proposals/accepted/agent-daemonset.md
cp repos/prometheus-operator/Documentation/proposals/accepted/202405-scrapeconfig-graduation.md content/docs/proposals/accepted/scrapeconfig-graduation.md
cp repos/prometheus-operator/Documentation/proposals/accepted/202407-remote-write.md content/docs/proposals/accepted/remote-write.md
cp repos/prometheus-operator/Documentation/proposals/accepted/202411-zone-aware-sharding.md content/docs/proposals/accepted/zone-aware-sharding.md

# community section
cp repos/prometheus-operator/CONTRIBUTING.md content/docs/community/contributing.md
cp repos/prometheus-operator/TESTING.md content/docs/community/testing.md
cp repos/prometheus-operator/Documentation/materials.md content/docs/community/materials.md
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
