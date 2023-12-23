#!/bin/bash
source lib.sh

setOutputVar \
  arch \
  "$(toFlagsArray arch-name "$arch")"
setOutputVar \
  package \
  "$(toFlagsArray package-name "$package")"
setOutputVar \
  hook \
  "$(toFlagsArray hook "$hook")"
