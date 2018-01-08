FROM alpine:latest

ENV TERRAFORM_VERSION=0.11.1
ENV TERRAFORM_SHA256SUM=4e3d5e4c6a267e31e9f95d4c1b00f5a7be5a319698f0370825b459cb786e2f35
ENV ORACLE_BARE_METAL_CLOUD=2.0.4

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

CMD ["sh", "-c", "sleep 900"]
