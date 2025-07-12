#!/usr/bin/env nu

let window_id = niri msg --json pick-window | jq .id
niri msg action set-dynamic-cast-window --id $window_id
