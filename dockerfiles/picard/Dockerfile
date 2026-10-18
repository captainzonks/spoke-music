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
#   - Picard 3.0.2 needs Qt >= 6.5 (Qt.ColorScheme), but Ubuntu 24.04 ships
#     Qt 6.4. PyQt6 therefore comes from PyPI wheels (bundled Qt), pinned
#     below. python3-pyqt6 stays installed only to pull in the Qt runtime
#     library dependencies; the venv copy shadows it.
#   - --system-site-packages venv still lets Picard use the system mutagen,
#     dateutil, yaml, libdiscid and tomlkit packages.
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
        libgl1 libegl1 libxkbcommon-x11-0 libxcb-cursor0 libxcb-icccm4 \
        libxcb-image0 libxcb-keysyms1 libxcb-randr0 libxcb-render-util0 \
        libxcb-shape0 libxcb-xinerama0 libxcb-xkb1 \
    && python3 -m venv --system-site-packages /opt/picard \
    && /opt/picard/bin/pip install --no-cache-dir --ignore-installed \
        PyQt6==6.11.0 PyQt6-Qt6==6.11.2 PyQt6-sip==13.13.0 \
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
