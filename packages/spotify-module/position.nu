#!/usr/bin/env nu

def convert_to_duration [dur: string] {
    let dur_split = $dur | split row ':' | each {|x| $x | into int}
    let min = $dur_split | first | into duration --unit min
    let sec = $dur_split | last | into duration --unit sec
    return ($min + $sec)
}

def main [icon: string = ""] {
    let position = (spotifycli --position) | parse "({current}/{total})" | first
    let current = convert_to_duration $position.current
    let total = convert_to_duration $position.total

    if ($current >= ($total / 2) or $current >= 4min) {
        print $"($icon) ($position.current)/($position.total)"
    } else {
        print $"($position.current)/($position.total)"
    }
}
