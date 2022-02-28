#!/bin/sh

tailscaled --state=/var/lib/tailscale/tailscaled.state --socket=/var/run/tailscale/tailscaled.sock &
until tailscale up --authkey=${TAILSCALE_AUTH_KEY} --hostname=flydb
do
    sleep 0.1
done
