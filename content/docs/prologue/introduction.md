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
weight: 100
toc: true
---

The Prometheus Operator provides [Kubernetes](https://kubernetes.io/) native deployment and management of [Prometheus](https://prometheus.io/) and related monitoring components.
The purpose of this project is to simplify and automate the configuration of a Prometheus based monitoring stack for Kubernetes clusters.

The Prometheus operator includes, but is not limited to, the following features:

* Kubernetes Custom Resources: Use Kubernetes custom resources to deploy and manage Prometheus, Alertmanager, and related components.
* Simplified Deployment Configuration: Configure the fundamentals of Prometheus like versions, persistence, retention policies, and replicas from a native Kubernetes resource.
* Prometheus Target Configuration: Automatically generate monitoring target configurations based on familiar Kubernetes label queries; no need to learn a Prometheus specific configuration language.

## Get started

<!-- There are two main ways to get started with the Prometheus Operator and kube-prometheus: -->

### Tutorial

{{< alert icon="👉" text="The Tutorial is intended for novice to intermediate users." >}}

We still need to write you a proper tutorial...  
Feel free to [comment on the opened issue](https://github.com/prometheus-operator/website/issues/3) if you want to help!

<!-- Step-by-step instructions on how to deploy the Prometheus Operator and kube-prometheus. [Tutorial →](https://getdoks.org/tutorial/introduction/) -->

### Quick Start

{{< alert icon="👉" text="The Quick Start is intended for intermediate to advanced users." >}}

One page summary of how to start with the Prometheus Operator and kube-prometheus. [Quick Start →]({{< ref "quick-start" >}})

## Go further

Recipes, Reference Guides, Extensions, and Showcase.

## Contributing

Find out how to contribute to the Prometheus Operator and kube-prometheus. [Contributing →]({{< ref "contributing" >}})

## Support

We have [GitHub Discussions](https://github.com/prometheus-operator/kube-prometheus/discussions) for kube-prometheus.
We recommend asking questions there, as this is searchable compared to Slack.

We're happy to talk to you on the [Kubernetes Slack](http://slack.k8s.io/) in #prometheus-operator!
