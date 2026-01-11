ARG BUILD_FROM
FROM $BUILD_FROM

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH=amd64
ARG GOTIFY_VERSION=2.8.0
RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
       unzip \
       wget \
    \
    && mkdir /opt/gotify \   
    && ARCH="${BUILD_ARCH}" \
    && if [ "${BUILD_ARCH}" = "i386" ]; then ARCH="386"; \
       elif [ "${BUILD_ARCH}" = "armv7" ]; then ARCH="arm-7"; \
       elif [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm64"; \
       elif [ "${BUILD_ARCH}" = "armhf" ]; then ARCH="arm64"; \
       fi \
    && FILENAME_WO_EXT="gotify-linux-${ARCH}" \
    && wget -O gotify.zip \
      "https://github.com/gotify/server/releases/download/v${GOTIFY_VERSION}/${FILENAME_WO_EXT}.zip" \
    && unzip -op gotify.zip "${FILENAME_WO_EXT}" > /opt/gotify/gotify \
    && rm gotify.zip \
    && chmod a+x /opt/gotify/gotify

# Copy root filesystem
COPY rootfs /

WORKDIR /opt/gotify    

ENV GOTIFY_SERVER_PORT="80"
HEALTHCHECK --interval=5s --timeout=5s --start-period=5s CMD curl --fail http://localhost:$GOTIFY_SERVER_PORT/health || exit 1


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
