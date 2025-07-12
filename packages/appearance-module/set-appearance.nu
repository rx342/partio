#!/usr/bin/env nu

let current_mode = gsettings get org.gnome.desktop.interface color-scheme

if ($current_mode == "'prefer-dark'") {
    gsettings set org.gnome.desktop.interface color-scheme 'default'
} else {
    gsettings set org.gnome.desktop.interface color-scheme 'prefer-dark'
}
