FROM alpine:latest

ENV TERRAFORM_VERSION=0.11.8
ENV TERRAFORM_SHA256SUM=84ccfb8e13b5fce63051294f787885b76a1fedef6bdbecf51c5e586c9e20c9b7

RUN apk add --update \
    python \
    python-dev \
    py-pip \
    build-base \
  && pip install virtualenv \
  && rm -rf /var/cache/apk/*
  
RUN apk add --update git curl openssh && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

COPY install.sh /home/install.sh
COPY init.sh /home/init.sh

WORKDIR /home

CMD ["sh", "-c", "sleep 18000"]
