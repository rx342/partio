#!/usr/bin/env nu

let session_names = tmux list-sessions -F "#{session_name}"
let selected_session = $session_names | lines | input list --fuzzy "Session"
if ($selected_session | is-not-empty) {
    tmux switch -t $selected_session
}
