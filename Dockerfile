FROM buildpack-deps:bookworm-curl@sha256:c63e1f47b008e42150a551f51443fd5007d737e9951661bd18b0a808db56abbe

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		git \
	&& \
	rm -rf /var/lib/apt/lists/*

# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VERSION=v4.53.2

RUN \
  mkdir -p /usr/local/bin && \
  curl -fsSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq
