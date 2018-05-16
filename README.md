# k8s-cli-utils
Docker image that has kubectl, kube-aws and helm tools pre-installed.

## Build locally
```
docker build -t coco/k8s-cli-utils:local .

```

## Running locally

Expected environment variables:

- K8S_API_SERVER: the URL of the API server of the Kubernetes cluster
- K8S_TOKEN: For authentication with the K8s API server, it uses [service account tokens](https://kubernetes.io/docs/admin/authentication/#service-account-tokens). This is the token of the service account.

### Example
Start the container with an interactive tools i.e. sh:
```
docker run -it --rm -e "K8S_API_SERVER=<k8s-api-server-url>" -e "K8S_TOKEN=<the_token>" coco/k8s-cli-utils /bin/sh
```

