FROM buildpack-deps:bookworm-scm@sha256:9c9da38cd41e7bf8db601c6dc3dc5759131af3a81997330c4df0966e4bcaab3b

# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VERSION=v4.44.2

RUN \
  mkdir -p /usr/local/bin && \
  curl -fsSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq
