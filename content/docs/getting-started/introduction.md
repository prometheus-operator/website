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

The Prometheus Operator provides [Kubernetes](https://kubernetes.io/) native deployment and management of [Prometheus](https://prometheus.io/) and related monitoring components.
The purpose of this project is to simplify and automate the configuration of a Prometheus based monitoring stack for Kubernetes clusters.

The Prometheus operator includes, but is not limited to, the following features:

- Kubernetes Custom Resources: Use Kubernetes custom resources to deploy and manage Prometheus, Alertmanager, and related components.
- Simplified Deployment Configuration: Configure the fundamentals of Prometheus like versions, persistence, retention policies, and replicas from a native Kubernetes resource.
- Prometheus Target Configuration: Automatically generate monitoring target configurations based on familiar Kubernetes label queries; no need to learn a Prometheus specific configuration language.

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