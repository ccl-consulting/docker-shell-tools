FROM buildpack-deps:bookworm-curl@sha256:ee8ecede43f60d8d06264aca7b049be5b6930a03b810560f05a163269e307ae8

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
