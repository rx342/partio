function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert \cN accept-autosuggestion
    bind -M default \cN accept-autosuggestion
    bind -M default U redo
    bind -M insert \cV edit_command_buffer
    bind -M default \cV edit_command_buffer

    bind -M insert \ef 'fish_tmux_sessionizer; commandline -f repaint'
    bind -M default \ef 'fish_tmux_sessionizer; commandline -f repaint'
    bind -M insert \ey 'fish_tmux_tmp_dir; commandline -f repaint'
    bind -M default \ey 'fish_tmux_tmp_dir; commandline -f repaint'
end
