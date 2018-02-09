FROM alpine:latest

ENV TERRAFORM_VERSION=0.10.5
ENV TERRAFORM_SHA256SUM=acec7133ffa00da385ca97ab015b281c6e90e99a41076ede7025a4c78425e09f
ENV ORACLE_BARE_METAL_CLOUD=2.0.0

RUN apk add --update git curl openssh && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN apk add bash openssl && \
      wget https://github.com/oracle/terraform-provider-baremetal/releases/download/v${ORACLE_BARE_METAL_CLOUD}/linux.tar.gz && \
      mkdir /usr/local/oracle && \
      tar -C /usr/local/oracle -xzf linux.tar.gz && \
      mkdir -p ~/.terraform.d/plugins/ && \
      cp -r /usr/local/oracle/linux_amd64 ~/.terraform.d/plugins/ && \
      rm -rf /usr/local/linux.tar.gz

COPY install.sh /home/install.sh

WORKDIR /home

CMD ["sh", "-c", "sleep 18000"]
