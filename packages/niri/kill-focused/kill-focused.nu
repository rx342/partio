#!/usr/bin/env nu

let pid = niri msg focused-window | lines |  split column ':' | find PID | get column1 | first | into int
kill --force $pid
