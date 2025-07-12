#!/usr/bin/env nu

let current_mode = gsettings get org.gnome.desktop.interface color-scheme

if ($current_mode == "'prefer-dark'") {
    print " dark"
} else {
    print "󰫢 light"
}
