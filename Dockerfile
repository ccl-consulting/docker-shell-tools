FROM buildpack-deps:bookworm-curl@sha256:f5c5d07ea24ee91272739fe451c280aa4b7fa5120b9278815db5fcd713d83772

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
