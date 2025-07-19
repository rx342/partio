#!/usr/bin/env nu

def get_mode [ current_mode: string, num_notifications: int ] {
    if ($current_mode == "true") {
        let icon_base = ""
        let icon = if $num_notifications > 0 {
            $"($icon_base) ($num_notifications)"
        } else {
            $icon_base
        }

        print ({"text": $icon, class: "busy"} | to json --raw)
    } else {
        let icon_base = ""
        let icon = if $num_notifications > 0 {
            $"($icon_base) ($num_notifications)"
        } else {
            $icon_base
        }

        print ({"text": $icon, class: "available"} | to json --raw)
    }
}

def toggle_mode [ current_mode: string ] {
    swaync-client --toggle-dnd
}

def main [
    --get (-g), # get current mode
    --toggle (-t) # toggle mode
] {
    let current_mode = swaync-client --get-dnd
    let num_notifications = swaync-client --count | into int

    if $get {
        get_mode $current_mode $num_notifications
    } else {
        toggle_mode $current_mode
    }
}
