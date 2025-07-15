#!/usr/bin/env nu

def main [ ] {
    let laptop = {id: "eDP-1", resolution: {width: 1920, height: 1080}}
    let external = {id: "HDMI-2", resolution: {width: 1920, height: 1080}}
    let home = {id: "HDMI-2", resolution: {width: 2560, height: 1440}}

    let selection = ([
        "Laptop"
        "External"
        "Home"
        "Projector"
    ] | str join "\n" | rofi -dmenu -i -p "Monitor setup")

    match $selection {
        "Laptop" => {
            xrandr --output $laptop.id --off
            xrandr --output $external.id --off
            xrandr --output $home.id --off
            xrandr --output $laptop.id --auto --mode $"($laptop.resolution.width)x($laptop.resolution.height)" --primary
        }
        "External" => {
            xrandr --output $laptop.id --off
            xrandr --output $external.id --off
            xrandr --output $home.id --off
            xrandr --output $external.id --auto --mode $"($external.resolution.width)x($external.resolution.height)" --primary
        }
        "Home" => {
            xrandr --output eDP-1 --off
            xrandr --output HDMI-2 --off
            xrandr --output HDMI-2 --auto --mode 2560x1440
        }
        "Projector" => {
            xrandr --output eDP-1 --off
            xrandr --output HDMI-2 --off
            xrandr --output HDMI-2 --auto --mode 1920x1080
            xrandr --output eDP-1 --auto --same-as HDMI-2
        }
        _ => {
            print "No valid selection made"
        }
    }
}
