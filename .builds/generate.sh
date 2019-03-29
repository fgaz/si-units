#!/usr/bin/env bash

for v in 822 844 864; do
  nix eval -f generate.nix 'buildfile' --json --argstr version "${v}" > "${v}.yml"
done

