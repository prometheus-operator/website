---
title: "Introduction"
description: "The Prometheus Operator provides Kubernetes native deployment and management of Prometheus and related monitoring components"
lead: ""
date: 2020-10-06T08:48:57+00:00
lastmod: 2020-10-06T08:48:57+00:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 101
toc: true
---

Prometheus Operator is a [Kubernetes Operator](https://github.com/cncf/tag-app-delivery/blob/main/operator-wg/whitepaper/Operator-WhitePaper_v1-0.md#foundation) that provides Kubernetes native deployment and management of [Prometheus](https://prometheus.io/) and related monitoring components. 

The Prometheus operator includes, but is not limited to, the following features:

- **Kubernetes Custom Resources**: Use Kubernetes custom resources to deploy and manage Prometheus, Alertmanager, and related components.

- **Simplified Deployment Configuration**: Configure the fundamentals of Prometheus like versions, persistence, retention policies, and replicas from a native Kubernetes resource.

- **Prometheus Target Configuration**: Automatically generate monitoring target configurations based on familiar Kubernetes label queries; no need to learn a Prometheus specific configuration language.

Prometheus Operator provides a set of Custom Resource Definitions(CRDs) that allows you to configure your Prometheus and related instances. Currently, the CRDs provided by Prometheus Operator are: 

- Prometheus
- Alertmanager
- ThanosRuler
- ServiceMonitor
- PodMonitor
- Probe
- PrometheusRule
- AlertmanagerConfig
- PrometheusAgent
- ScrapeConfig

> Check the [Design]({{<ref "design">}}) page for an overview of all the resources provided by Prometheus Operator.

### Goals

- To significantly reduce the effort required to configure, implement and manage all components of Prometheus based monitoring stack.

- Automate the management of Prometheus monitoring targets, ultimately increasing efficiency. This automation is performed by the use of Kubernetes [Custom Resource Definition](https://kubernetes.io/docs/tasks/extend-kubernetes/custom-resources/custom-resource-definitions/). The Operator introduces custom resources like `Prometheus`, `Alertmanager`, `ThanosRuler`, and others, which help automate the deployment and configuration of these resources.

- The Operator abstracts the complexity of many aspects in management of Prometheus resources. Let us look into each of them:

  - **Configuration** - Instead of learning and manually writing Prometheus Relabeling rules (which can be time consuming), you can simply use Kubernetes [Label Selectors](https://kubernetes.io/docs/concepts/overview/working-with-objects/labels/#label-selectors). `ServiceMonitor`, `PodMonitor` and `Probe` custom resources provide this abstraction.

  - **Configuration Validation** - The Operator removes the complexity of validating the configuration of `AlertmanagerConfig` and `PrometheusRule` objects by using K8s [Admission Webhooks](http://prometheus-operator.dev/docs/platform/webhook/).

    > We're evaluating using [CEL](https://kubernetes.io/docs/reference/using-api/cel/) to make sure mutually exclusive configurations aren't set by accident.

  - **Rule Evaluation** - By leveraging [ThanosRuler](https://prometheus-operator.dev/docs/platform/thanos/#thanos-ruler) custom resource, one can easily process alerting and recording rules across multiple Prometheus instances.

  - **Autoscaling** - The Operator provides many features that help us to integrate well with [HPAs](https://kubernetes.io/docs/tasks/run-application/horizontal-pod-autoscale/) ensuring scaling the number of instances automatically.

  - **Storage** - `Prometheus` CRD provides running [Thanos sidecar](https://thanos.io/v0.4/components/sidecar/) with Prometheus instance which allows it to run Prometheus with low retention periods and Thanos sidecars for long-term storage. Overall, this reduces the storage need, making it easier to scale.

### Next Steps

By now, you have the basic idea about Prometheus Operator!!

Take a look at these guides to get into action with Prometheus Operator.

<!-- Getting-Started -->
{{<link-card
  title="Getting-Started"
  href="https://prometheus-operator.dev/docs/getting-started/introduction/"
  description="Get started with Prometheus-Operator."
>}}

<!-- API -->
{{<link-card
  title="API Reference"
  href="https://prometheus-operator.dev/docs/api-reference/api/"
  description="Reference for different fields of Custom Resources in Prometheus-Operator."
>}}

<!-- Developer Guide -->
{{<link-card
  title="Developer Guide"
  href="https://prometheus-operator.dev/docs/developer/getting-started/"
  description="Learn how to configure scraping, alerting, and recording rules for your applications."
>}}

<!-- Platform Guide -->
{{<link-card
  title="Platform Guide"
  href="https://prometheus-operator.dev/docs/platform/webhook/"
  description="Set up, configure and manage instances of Prometheus-Operator, Prometheus, Alertmanager and ThanosRuler resources."
>}}

<!-- Community -->
{{<link-card
  title="Community"
  href="https://prometheus-operator.dev/docs/community/contributing/"
  description="Join and interact with Prometheus-Operator community."
>}}