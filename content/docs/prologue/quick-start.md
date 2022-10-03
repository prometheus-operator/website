---
title: "Quick Start"
description: "One page summary of how to start with the Prometheus Operator and kube-prometheus."
lead: "One page summary of how to start with the Prometheus Operator and kube-prometheus."
date: 2020-11-16T13:59:39+01:00
draft: false
images: []
menu:
  docs:
    parent: "prologue"
weight: 110
toc: true
---

## Requirements

The easiest way of starting with the Prometheus Operator is by deploying it as part of kube-prometheus.
kube-prometheus deploys the Prometheus Operator and already schedules a Prometheus called `prometheus-k8s` with alerts and rules by default.

All you need is access to a **Kubernetes cluster with kubectl!**

<!-- TODO: Reference the deploy kube-prometheus to kind tutorial once available  -->

> Note: For versions before Kubernetes v1.20.z refer to the [Kubernetes compatibility matrix](https://github.com/prometheus-operator/kube-prometheus#kubernetes-compatibility-matrix) in order to choose a compatible branch.

## Get the kube-prometheus project

For a quick start we are going to deploy a compiled version of the Kubernetes [manifests](https://github.com/prometheus-operator/kube-prometheus/tree/main/manifests).

You can either clone the kube-prometheus from GitHub

```shell
git clone https://github.com/prometheus-operator/kube-prometheus.git
```

or download the current main branch as zip file and extract its contents:

[github.com/prometheus-operator/kube-prometheus/archive/main.zip](https://github.com/prometheus-operator/kube-prometheus/archive/main.zip)

Once you have the files on your machine change into the project's root directory.

## Deploy kube-prometheus

```shell
# Create the namespace and CRDs, and then wait for them to be availble before creating the remaining resources
kubectl create -f manifests/setup

# Wait until the "servicemonitors" CRD is created. The message "No resources found" means success in this context.
until kubectl get servicemonitors --all-namespaces ; do date; sleep 1; echo ""; done

kubectl create -f manifests/
```

We create the namespace and CustomResourceDefinitions first to avoid race conditions when deploying the monitoring components.
Alternatively, the resources in both folders can be applied with a single command `kubectl create -f manifests/setup -f manifests`,
but it may be necessary to run the command multiple times for all components to be created successfullly.

## Access Prometheus

Prometheus, Alertmanager, and Grafana dashboards can be accessed quickly using `kubectl port-forward` after running the quickstart via the commands below.

You can also learn how to [expose via an Ingress →]({{< ref "docs/kube/exposing-prometheus-alertmanager-grafana-ingress" >}})

```shell
kubectl --namespace monitoring port-forward svc/prometheus-k8s 9090
```

Open Prometheus on [localhost:9090](http://localhost:9090) in your browser.

Check out the [alerts](http://localhost:9090/alerts) and [rules](http://localhost:9090/rules) pages with the pre-configured rules and alerts!  
This Prometheus is supposed to monitor your Kubernetes cluster and make sure to alert you if there's a problem with it.

For your own applications we recommend running one or more other instances.
<!-- TODO: Write a tutorial/doc on self service aspcects of Prometheus Operator -->

## Access Alertmanager

```shell
kubectl --namespace monitoring port-forward svc/alertmanager-main 9093
```

Open Alertmanager on [localhost:9093](http://localhost:9093) in your browser.

<!-- TODO: Link to a document describing how to configure Alertmanager -->

## Access Grafana

```shell
kubectl --namespace monitoring port-forward svc/grafana 3000
```

Open Grafana on [localhost:3000](http://localhost:3000) in your browser.   
You can login with the username `admin` and password `admin`.

## Remove kube-prometheus 

If you're done experimenting with kube-prometheus and the Prometheus Operator you can simply teardown the deployment by running:
```shell
kubectl delete --ignore-not-found=true -f manifests/ -f manifests/setup
```

## Next Steps

kube-prometheus is developed as a library.  
The idea is that you get a Kubernetes cluster monitoring stack and additionally you can add more Prometheus servers.

