#!/usr/bin/env nu

def list_all_working_dirs [ ] {
    let sessions = tmux list-sessions -F "#S" | lines
    let all_working_dirs = $sessions | each {|s| tmux list-panes -s -t $s -F "#{pane_current_path}"} | str join "\n" | lines

    return $all_working_dirs
}

def select_dir [ additional_roots: list<path> = [] ] {
    const cwd = path self .
    let all_working_dirs = list_all_working_dirs
    let additional_paths = $additional_roots | each { |root| ls $root | where type == dir | get name | path expand } | flatten
    let searching_dirs = ($all_working_dirs ++ $additional_paths) | uniq | sort

    let selected = $searching_dirs | input list --fuzzy "Session directory"
    return $selected
}

def main [ root?: path ] {
    let root_exist = $root | is-not-empty
    let additional_roots = [
        ~/Documents
        ~/Documents/reports/generation
        ~/personal
        ~/personal/notes
        ~/personal/advent-of-code
        ~/work
        ~/work/vision/projects
        ~/work/tensorflow-models/research
        ~
        /persist/home
        /backup/home
    ] | path expand | where {|x| $x | path exists}
    let selected = if $root_exist { $root } else { select_dir $additional_roots}
    if $selected == null {
        exit 0
    }

    let selected_filtered = $selected | path basename | str replace . _
    let selected_hash = $selected | hash sha256 | str substring 0..4
    let selected_name = $"($selected_filtered)-($selected_hash)"

    let in_tmux = "TMUX" in $env
    let tmux_running = ps | where name =~ "tmux" | is-not-empty
    if (not $in_tmux) {
        if $tmux_running {
            let session_exist = (tmux has-session -t=$"($selected_name)" | complete | $in.exit_code) == 0
            if $session_exist {
                tmux attach -d -t $selected_name
            } else {
                tmux new-session -s $selected_name -c $selected
                exit 0
            }
        } else {
            tmux new-session -s $selected_name -c $selected
            exit 0
        }
    }

    let session_exist = (tmux has-session -t=$"($selected_name)" | complete | $in.exit_code) == 0
    if not $session_exist {
        tmux new-session -ds $selected_name -c $selected
    }

    tmux switch-client -t $selected_name
}
