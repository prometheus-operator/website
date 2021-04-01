# website
The Prometheus Operator &amp; kube-prometheus website

## Development

To generate the website you need to install the extended version of [Hugo](https://gohugo.io/).

Before building the docs, you need to pull the [doks](https://getdoks.org/) theme locally:

```shell
git submodule init
git submodule update
```

Fetching the theme, synchronizing the docs from both repositories and building it locally is done by running:

```shell
make
```

If you want to run a local development server you can simply run `hugo serve` after running `make` once.
