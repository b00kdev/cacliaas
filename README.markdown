# Cardano Addresses CLI as a Service

Exposes the [Cardano Addresses CLI](https://github.com/IntersectMBO/cardano-addresses) as a service. Right now it just generates a 24 word seed phrase, but with proper attention it could be extended to support all the features of the CLI.

## Build

```bash
$ docker build -t cacliaas:latest .
```

## Run

```bash
$ docker run -d -p3000:3000 cacliaas:latest
```

## Screenshots

![The CACLIaaS in all its glory](docs/screenshot.png)
