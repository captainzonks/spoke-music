# =============================================================================
# Picard 3.0.2 - locally-built image
# =============================================================================
# Base: jlesage/baseimage-gui (Ubuntu 24.04, noVNC + Xvnc + s6 service manager)
# Source: https://github.com/metabrainz/picard
# =============================================================================
# Build (normally done by `make rebuild MODULE=music SERVICE=picard`):
#   docker build -t spoke/picard:3.0.2 \
#       --build-arg PICARD_REF=release-3.0.2 \
#       dockerfiles/picard/
# =============================================================================

ARG BASE_IMAGE=jlesage/baseimage-gui:ubuntu-24.04-v4
FROM ${BASE_IMAGE}

ARG PICARD_REF=release-3.0.2

# -----------------------------------------------------------------------------
# Install Picard 3.x runtime and build dependencies
# -----------------------------------------------------------------------------
# Notes:
#   - PyQt6 is provided by the system (python3-pyqt6 package).
#   - --system-site-packages venv lets Picard import system PyQt6 without
#     forcing a 200MB pip wheel install.
#   - libdiscid + chromaprint give Picard CD/AcoustID lookup support.
#   - python3-tomlkit satisfies the tomlkit>=0.12.4 requirement added after
#     3.0.0b4. Other pure-Python requirements (Markdown, PyJWT, pygit2,
#     charset-normalizer) are fetched from PyPI by pip, so the build needs
#     network access.
# -----------------------------------------------------------------------------
RUN add-pkg --virtual build-deps \
        git build-essential python3-dev gettext \
    && add-pkg \
        python3 python3-pip python3-venv \
        python3-pyqt6 python3-pyqt6.qtsvg \
        python3-mutagen python3-dateutil python3-tomlkit \
        python3-libdiscid python3-yaml \
        libdiscid0 libchromaprint-tools \
        fonts-dejavu \
    && python3 -m venv --system-site-packages /opt/picard \
    && cd /tmp \
    && git clone --depth 1 --branch "${PICARD_REF}" \
        https://github.com/metabrainz/picard.git picard-src \
    && cd picard-src \
    && /opt/picard/bin/pip install --no-cache-dir . \
    && cd / && rm -rf /tmp/picard-src \
    && del-pkg build-deps \
    && rm -rf /var/lib/apt/lists/* /root/.cache

# -----------------------------------------------------------------------------
# baseimage-gui app launch hook
# -----------------------------------------------------------------------------
COPY --chmod=755 startapp.sh /startapp.sh

ENV APP_NAME="MusicBrainz Picard 3"
