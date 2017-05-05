FROM alpine:3.4

ENV KUBECONFIG=/kubeconfig

COPY ./kubeconfig-template /
COPY ./docker-entrypoint.sh /

RUN apk --update add ca-certificates openssl \
  && wget https://storage.googleapis.com/kubernetes-helm/helm-v2.4.1-linux-amd64.tar.gz -O helm.tar.gz \
  && tar zxvf helm.tar.gz \
  && mv linux-amd64/helm /usr/local/bin/helm \
  && rm -rf linux-amd64 \
  && wget https://storage.googleapis.com/kubernetes-release/release/v1.5.5/bin/linux/amd64/kubectl \
  && chmod +x ./kubectl \ 
  && mv ./kubectl /usr/local/bin/kubectl \
  && chmod +x /docker-entrypoint.sh

ENTRYPOINT ["/docker-entrypoint.sh"]