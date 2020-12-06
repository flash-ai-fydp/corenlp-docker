# corenlp-docker
Forked from [chilland/corenlp-docker](https://github.com/chilland/corenlp-docker).
Fork status removed due to git-lfs being disabled for public forks??

Dockerfile for Stanford CoreNLP Server

---------

This Dockerfile builds the [Stanford CoreNLP
Server](http://stanfordnlp.github.io/CoreNLP/corenlp-server.html) and exposes
the endpoint on port 9000. Requests are made as covered in the documentation.

## Docker
### Build the docker image

```bash
# From the root directory of the repo (so the same level as this README)
docker image build -t corenlp .
```

### Run the docker container
```bash
docker run \
-p 9000:9000 \
--name corenlp \
-d corenlp
```