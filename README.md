# website
The Prometheus Operator &amp; kube-prometheus website

## Development

To generate the website you need to install [hugo](https://gohugo.io/).

Fetching the theme, synchronizing the docs from both repositories and building it locally is done by running:

```shell
make
```

If you want to run a local devleopment server you can simply run `hugo serve` after running `make` once.
