# spoke-music

<!--
==============================================================================
README.md - spoke-music module documentation
==============================================================================
Description: Music streaming and library management Spoke module
Author: Matt Barham
Created: 2026-02-13
Modified: 2026-04-21
Version: 1.0.1
==============================================================================
Document Type: Reference
Audience: Developer
Status: Final
==============================================================================
-->

[![ko-fi](https://ko-fi.com/img/githubbutton_sm.svg)](https://ko-fi.com/E1E21U3S1R)

Spoke module for music streaming and library management.

## Services

| Service   | Description              | Port | Network |
|-----------|--------------------------|------|---------|
| navidrome | Music streaming server   | 4533 | troxy   |
| picard    | MusicBrainz Picard tagger| 5800 | troxy   |

## Prerequisites

- Spoke hub deployed with `troxy` network
- Traefik available as a hub service
- Music library accessible on the host

## Quick Start

```bash
cp .env.example .env
# Edit .env — set music path and API keys
docker compose up -d
```

## Module Environment Variables

| Variable          | Default                          | Description              |
|-------------------|----------------------------------|--------------------------|
| `NAVIDROME_IMAGE` | `deluan/navidrome:0.61.2`        | Navidrome container image|
| `PICARD_IMAGE`    | `mikenye/picard:2.13.3`          | Picard container image   |
| `NAVIDROME_IP`    | `192.168.35.85`                  | Navidrome static IP      |
| `NAVIDROME_PORT`  | `4533`                           | Navidrome web port       |
| `PICARD_IP`       | `192.168.35.86`                  | Picard static IP         |
| `PICARD_PORT`     | `5300`                           | Picard web port          |
| `MUSIC_DIR`       | `/mnt/storage/media/Music`       | Music library path       |
| `SPOTIFY_ID`      | (empty)                          | Spotify API client ID    |
| `SPOTIFY_SECRET`  | (empty)                          | Spotify API secret       |
| `LASTFM_APIKEY`   | (empty)                          | Last.fm API key          |
| `LASTFM_SECRET`   | (empty)                          | Last.fm shared secret    |

## References

- [Navidrome](https://www.navidrome.org/docs/)
- [MusicBrainz Picard](https://picard-docs.musicbrainz.org/)
