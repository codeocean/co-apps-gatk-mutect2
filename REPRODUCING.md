This [Code Ocean](https://codeocean.com) Compute Capsule will allow you to run and reproduce the results of [GATK - Mutect2](https://apps.codeocean.com/capsule/6292005/tree) on your local machine<sup>1</sup>. Follow the instructions below, or consult [our knowledge base](https://help.codeocean.com/user-manual/sharing-and-finding-published-capsules/exporting-capsules-and-reproducing-results-on-your-local-machine) for more information. Don't hesitate to reach out via live chat or [email](mailto:support@codeocean.com) if you have any questions.

<sup>1</sup> You may need access to additional hardware and/or software licenses.

# Prerequisites

- [Docker Community Edition (CE)](https://www.docker.com/community-edition)

# Instructions

## Download attached Data Assets

In order to fetch the Data Asset(s) this Capsule depends on, download them into the Capsule's `data` folder:
* [hg38-Reference with fai index](https://apps.codeocean.com/data-assets/d51e214f-a22d-409c-aa11-6b8102d2f282) should be downloaded to `data/Reference`
* [Hg38-Mutect2-Preprocess](https://apps.codeocean.com/data-assets/105ef7f2-965c-460e-affa-276872ecc9e7) should be downloaded to `data/Alignment`
* [hg38 Germline Resource](https://apps.codeocean.com/data-assets/f1ecb3e9-87cd-4022-8fbe-002d30fe9fe6) should be downloaded to `data/Germline`
* [hg38 Panel of Normals](https://apps.codeocean.com/data-assets/d8d6329c-71d9-45d0-98bc-a28887d55a4e) should be downloaded to `data/PoN`

## Log in to the Docker registry

In your terminal, execute the following command, providing your password or API key when prompted for it:
```shell
docker login -u stephen@codeocean.com registry.apps.codeocean.com
```

## Run the Capsule to reproduce the results

In your terminal, navigate to the folder where you've extracted the Capsule and execute the following command, adjusting parameters as needed:
```shell
docker run --platform linux/amd64 --rm \
  --workdir /code \
  --volume "$PWD/code":/code \
  --volume "$PWD/data":/data \
  --volume "$PWD/results":/results \
  registry.apps.codeocean.com/capsule/8b5194ea-5311-4dad-84d7-177b5495796d \
  bash run
```
