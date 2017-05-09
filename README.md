# k8s-cli-utils
Docker image that has kubectl and helm tools pre-installed.

### Important note:
This image expects to find the k8s certificates (find them in LP) mounted under `/credentials` folder and 
an environment variable pointing to the K8S api server. 

## Running locally
Start the container with an interactive tools i.e. sh:
```
docker run -it --rm -e "K8S_API_SERVER=<k8s-api-server-url>" -v <local_credentials_dir>:/credentials coco/k8s-cli-utils /bin/sh
```

