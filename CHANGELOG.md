# Changelog

<!--
==============================================================================
CHANGELOG.md - Release history
==============================================================================
Description: Notable changes in each release, newest first
Author: Matt Barham
Created: 2026-09-27
Modified: 2026-10-24
Version: 1.1.2
==============================================================================
Document Type: Changelog
Audience: Operator, Module Developer
Status: Active (living document)
==============================================================================
-->

All notable changes to this project are documented here. The format follows
[Keep a Changelog 1.1.0](https://keepachangelog.com/en/1.1.0/), and versions
follow [Semantic Versioning 2.0.0](https://semver.org/spec/v2.0.0.html). What
counts as a breaking change for a Spoke module is defined in the Spoke hub's
ADR-029.

## [1.1.2] - 2026-10-24

### Fixed

- Read Last.fm credentials from Docker secrets (#17)

## [1.1.1] - 2026-10-17

### Fixed

- music: Run Picard 3.0.2 on PyQt6 wheels (#15)

## [1.1.0] - 2026-10-17

### Added

- music: Replace Picard 2 with a built Picard 3.0.2 image (#13)

## [1.0.1] - 2026-10-02

### Changed

- Maintenance only; no user-visible changes.

## [1.0.0] - 2026-09-27

### Baseline

- First versioned release (hub ADR-029). Earlier history is in the git log.
