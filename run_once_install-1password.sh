#!/bin/sh
curl -Lo /tmp/1password.zip  "https://cache.agilebits.com/dist/1P/op/pkg/v1.10.3/op_linux_amd64_v1.10.3.zip"
unzip -o /tmp/1password.zip op -d ~/.local/bin
rm /tmp/1password.zip
