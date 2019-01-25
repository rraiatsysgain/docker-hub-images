FROM alpine:latest

ENV TERRAFORM_VERSION=0.11.3
ENV TERRAFORM_SHA256SUM=6b8a7b83954597d36bbed23913dd51bc253906c612a070a21db373eab71b277b
ENV ORACLE_BARE_METAL_CLOUD=2.0.7

RUN apk add --update git curl openssh && \
    curl https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip > terraform_${TERRAFORM_VERSION}_linux_amd64.zip && \
    echo "${TERRAFORM_SHA256SUM}  terraform_${TERRAFORM_VERSION}_linux_amd64.zip" > terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    sha256sum -cs terraform_${TERRAFORM_VERSION}_SHA256SUMS && \
    unzip terraform_${TERRAFORM_VERSION}_linux_amd64.zip -d /bin && \
    rm -f terraform_${TERRAFORM_VERSION}_linux_amd64.zip

RUN apk add bash openssl && \
      wget https://github.com/oracle/terraform-provider-oci/releases/download/${ORACLE_BARE_METAL_CLOUD}/linux.tar.gz && \
      mkdir /usr/local/oracle && \
      tar -C /usr/local/oracle -xzf linux.tar.gz && \
      mkdir -p ~/.terraform.d/plugins/ && \
      cp -r /usr/local/oracle/linux_amd64 ~/.terraform.d/plugins/ && \
      rm -rf /usr/local/linux.tar.gz

COPY install.sh /home/install.sh

COPY init.sh /home/init.sh

WORKDIR /home

CMD ["sh", "-c", "sleep 18000"]
