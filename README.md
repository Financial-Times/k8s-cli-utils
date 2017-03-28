# 8s-cli-utils
Docker image that has kubectl, helm tools pre-installed and `k8s-delivery-poc` project (https://github.com/Financial-Times/k8s-aws-delivery-poc) setup done.

## Running locally
Start the container with an interactive tools i.e. sh:
`docker run -ti <IMAGE_NAME> /bin/sh`

### Important note:
This image expects to find the k8s certificates (find them in LP) mounted under `/credentials` folder.
