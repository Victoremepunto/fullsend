#!/usr/bin/env bash
# Single source of truth for the pinned OpenShell version.
#
# Source this script to set OPENSHELL_VERSION and OPENSHELL_SHA in the
# current shell. In GitHub Actions it also exports them to GITHUB_ENV
# for downstream steps.
#
# Usage:
#   source .github/scripts/openshell-version.sh

# renovate: datasource=github-tags depName=NVIDIA/OpenShell
OPENSHELL_VERSION=0.0.63
OPENSHELL_SHA=ec197a43ef349e36c3fff04e9aaea9599fb83b31
OPENSHELL_WHEEL_SHA=sha256:978eb29f8c155cf291aa89cac7cd62bf73998cc0623e35967182a08e88c69e04

export OPENSHELL_VERSION OPENSHELL_SHA OPENSHELL_WHEEL_SHA

if [[ -n "${GITHUB_ENV:-}" ]]; then
  {
    echo "OPENSHELL_VERSION=${OPENSHELL_VERSION}"
    echo "OPENSHELL_SHA=${OPENSHELL_SHA}"
    echo "OPENSHELL_WHEEL_SHA=${OPENSHELL_WHEEL_SHA}"
  } >> "${GITHUB_ENV}"
fi
