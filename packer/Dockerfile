FROM alpine:latest

ENV PACKER_VERSION=1.3.3
ENV PACKER_SHA256SUM=2e3ea8f366d676d6572ead7e0c773158dfea0aed9c6a740c669d447bcb48d65f


RUN apk add --update git curl bash openssl openssh && \
    curl https://releases.hashicorp.com/packer/${PACKER_VERSION}/packer_${PACKER_VERSION}_linux_amd64.zip > packer_${PACKER_VERSION}_linux_amd64.zip && \
    echo "${PACKER_SHA256SUM}  packer_${PACKER_VERSION}_linux_amd64.zip" > packer_${PACKER_VERSION}_SHA256SUMS && \
    sha256sum -cs packer_${PACKER_VERSION}_SHA256SUMS && \
    unzip packer_${PACKER_VERSION}_linux_amd64.zip -d /bin && \
    rm -f packer_${PACKER_VERSION}_linux_amd64.zip


COPY install.sh /home/install.sh

WORKDIR /home

CMD ["sh", "-c", "sleep 18000"]
