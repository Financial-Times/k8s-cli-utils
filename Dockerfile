FROM alpine:3.4

ENV KUBECONFIG=/k8s-aws-delivery-poc/kubeconfig

RUN apk --update add git ca-certificates openssl \
  && wget https://kubernetes-helm.storage.googleapis.com/helm-v2.2.2-linux-amd64.tar.gz \
  && tar zxvf helm-v2.2.2-linux-amd64.tar.gz \
  && mv linux-amd64/helm /usr/local/bin/helm \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.5.5/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \ 
  && mv ./kubectl /usr/local/bin/kubectl \
  && git clone https://github.com/Financial-Times/k8s-aws-delivery-poc.git \
  && sed -i 's,credentials,/credentials,g' $KUBECONFIG \
