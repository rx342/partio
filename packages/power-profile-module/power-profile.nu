#!/usr/bin/env nu

def get_mode [ current_mode: string] {
    if ($current_mode == "performance") {
        print ({"text": " perf", class: "perf"} | to json --raw)
    } else if ($current_mode == "balanced") {
        print ({"text": "󰖐 base", class: "balanced"} | to json --raw)
    } else {
        print ({"text": "󰌪 save", class: "save"} | to json --raw)
    }
}

def set_mode [ current_mode: string ] {
    if ($current_mode == "performance") {
        powerprofilesctl set balanced
    } else if ($current_mode == "balanced") {
        powerprofilesctl set power-saver
    } else {
        powerprofilesctl set performance
    }
}

def main [
    --get (-g), # get current power profile
    --switch (-s) # switch to next power profile
] {
    let current_mode = powerprofilesctl get

    if $get {
        get_mode $current_mode
    } else {
        set_mode $current_mode
    }
}
