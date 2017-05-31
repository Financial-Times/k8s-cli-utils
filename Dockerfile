FROM alpine:3.4

ENV KUBECONFIG=/kubeconfig \
    KUBECTL_VERSION="v1.5.5" \
    HELM_VERSION="v2.4.2" \
    HELM_DLD_TEMP_LOCATION="helm.tar.gz"

COPY ./kubeconfig-template /
COPY ./docker-entrypoint.sh /

RUN apk --update add ca-certificates openssl \
  && wget https://storage.googleapis.com/kubernetes-helm/helm-${HELM_VERSION}-linux-amd64.tar.gz -O ${HELM_DLD_TEMP_LOCATION} \
  && tar zxvf ${HELM_DLD_TEMP_LOCATION} \
  && mv linux-amd64/helm /usr/local/bin/helm \
  && rm -rf linux-amd64 \
  && wget https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \ 
  && mv ./kubectl /usr/local/bin/kubectl \
  && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]