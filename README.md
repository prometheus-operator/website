# The Prometheus Operator &amp; kube-prometheus website

[![Netlify Status](https://api.netlify.com/api/v1/badges/cb1050ce-72fb-4aaf-89bb-5944c4c848b4/deploy-status)](https://app.netlify.com/sites/sleepy-hopper-0fdb6b/deploys)

## Development

### Pre requisites

To generate the website, you need to install the extended version of [Hugo](https://gohugo.io/).

Before building the docs, you need to pull the [doks](https://getdoks.org/) theme locally:

```shell
git submodule init
git submodule update
```

### Generating the site

Fetching the theme, pulling the documentation contents from repositories and building the site locally is done by running:

```shell
make
```

### Testing locally

If you want to run a local development server, run `hugo serve` after running `make` once.
