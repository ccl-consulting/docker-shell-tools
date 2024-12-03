FROM buildpack-deps:bookworm-curl@sha256:60fa59330635bb3360b021ffa0f96b1fbd61b19cf522290bf966f3bde25a9ca1

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
