FROM buildpack-deps:bookworm-curl@sha256:349348cbeae7042be1742a29baec50234c95e7861f52cd0b14d1e52c6209a27b

RUN \
	apt-get update && \
	apt-get install -y --no-install-recommends \
		git \
	&& \
	rm -rf /var/lib/apt/lists/*

# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VERSION=v4.44.5

RUN \
  mkdir -p /usr/local/bin && \
  curl -fsSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq
