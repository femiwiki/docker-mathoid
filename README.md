Dockerized Mathoid server [![Container Registry]][Container Registry Link]
========

A [Mathoid] Docker image. This is originally created for [FemiWiki].

## Usage

The following command starts a Mathoid container:

```sh
docker run -p 10044:10044 femiwiki/mathoid
```

Then, access it via http://localhost:10044/?spec in a browser.

### Environment Variables

Variables | Default | Description
--|--|--
MATHOID_NUM_WORKERS | `'ncpu'` | Number of worker processes to spawn.<br/>Set to 0 to run everything in a single process without clustering.<br/>Use `'ncpu'` to run as many workers as there are CPU units

## Build

```sh
docker build --tag femiwiki/mathoid .
docker push femiwiki/mathoid
```

&nbsp;

--------

The source code of *femiwiki/mathoid* is primarily distributed under the terms
of the [GNU Affero General Public License v3.0] or any later version. See
[COPYRIGHT] for details.

[Container Registry]: https://badgen.net/badge/icon/docker?icon=docker&label
[Container Registry Link]: https://github.com/orgs/femiwiki/packages/container/mathoid
[FemiWiki]: https://femiwiki.com
[Mathoid]: https://www.mediawiki.org/wiki/Mathoid
[GNU Affero General Public License v3.0]: LICENSE
[COPYRIGHT]: COPYRIGHT
