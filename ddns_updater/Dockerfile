ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH=amd64
ARG DDNS_UPDATER_VERSION=2.9.0
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
       wget \
    \
    && mkdir /opt/ddns-updater \   
    && ARCH="${BUILD_ARCH}" \
    && if [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="armv7"; \
       elif [ "${BUILD_ARCH}" = "arm64" ]; then ARCH="arm64"; \
       elif [ "${BUILD_ARCH}" = "aarch64" ]; then ARCH="arm64"; \
       fi \
    && FILENAME="ddns-updater_${DDNS_UPDATER_VERSION}_linux_${ARCH}" \
    && wget -O /opt/ddns-updater/ddns-updater \
      "https://github.com/qdm12/ddns-updater/releases/download/v${DDNS_UPDATER_VERSION}/${FILENAME}" \
    && chmod a+x /opt/ddns-updater/ddns-updater


# Copy root filesystem
COPY rootfs /

WORKDIR /opt/ddns-updater    

HEALTHCHECK CMD curl --fail http://127.0.0.1:8000 || exit 1

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_DESCRIPTION
ARG BUILD_NAME
ARG BUILD_REF
ARG BUILD_REPOSITORY
ARG BUILD_VERSION

# Labels
LABEL \
    io.hass.name="${BUILD_NAME}" \
    io.hass.description="${BUILD_DESCRIPTION}" \
    io.hass.arch="${BUILD_ARCH}" \
    io.hass.type="addon" \
    io.hass.version=${BUILD_VERSION} \
    maintainer="chriss158 (https://github.com/chriss158)" \
    org.opencontainers.image.title="${BUILD_NAME}" \
    org.opencontainers.image.description="${BUILD_DESCRIPTION}" \
    org.opencontainers.image.vendor="Home Assistant Add-ons" \
    org.opencontainers.image.authors="chriss158 (https://github.com/chriss158)" \
    org.opencontainers.image.licenses="MIT" \
    org.opencontainers.image.url="https://github.com/chriss158" \
    org.opencontainers.image.source="https://github.com/${BUILD_REPOSITORY}" \
    org.opencontainers.image.documentation="https://github.com/${BUILD_REPOSITORY}/blob/main/README.md" \
    org.opencontainers.image.created=${BUILD_DATE} \
    org.opencontainers.image.revision=${BUILD_REF} \
    org.opencontainers.image.version=${BUILD_VERSION}
