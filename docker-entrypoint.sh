#!/bin/sh

# Generate the kubeconfig file based on the K8S_API_SERVER env variable
sed "s|\${api-server}|${K8S_API_SERVER}|g" /kubeconfig-template > ${KUBECONFIG}
# Replace the token for auth
sed -i "s|\${token}|${K8S_TOKEN}|g" ${KUBECONFIG}

# Run the command that was passed at "docker run". Using exec will make the command have the PID 1.
# See https://docs.docker.com/engine/userguide/eng-image/dockerfile_best-practices/#entrypoint
exec "$@"