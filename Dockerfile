FROM alpine:3.6

ENV KUBECONFIG=/kubeconfig \
    KUBECTL_VERSION="v1.7.6" \
    KUBE_AWS_VERSION="v0.9.9" \
    KUBE_AWS_DLD_TEMP_LOCATION="kube-aws.tar.gz" \
    HELM_VERSION="v2.6.0" \
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
  && wget https://github.com/kubernetes-incubator/kube-aws/releases/download/${KUBE_AWS_VERSION}/kube-aws-linux-amd64.tar.gz -O ${KUBE_AWS_DLD_TEMP_LOCATION} \
  && tar -zxvf ${KUBE_AWS_DLD_TEMP_LOCATION} \
  && mv linux-amd64/kube-aws /usr/local/bin \
  && rm -rf linux-amd64 \
  && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]
