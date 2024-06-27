FROM buildpack-deps:bookworm-scm@sha256:26f797741018701856083d5936027cf8433ec952fac9be25a45097c1ed5661d3

# renovate: datasource=github-releases depName=mikefarah/yq
ARG YQ_VERSION=v4.44.2

RUN \
  mkdir -p /usr/local/bin && \
  curl -fsSL https://github.com/mikefarah/yq/releases/download/${YQ_VERSION}/yq_linux_amd64 -o /usr/local/bin/yq && \
  chmod +x /usr/local/bin/yq
