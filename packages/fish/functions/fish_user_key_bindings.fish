function fish_user_key_bindings
    fish_vi_key_bindings
    bind -M insert \cN accept-autosuggestion
    bind -M default \cN accept-autosuggestion
    bind -M default U redo
    bind -M insert \cV edit_command_buffer
    bind -M default \cV edit_command_buffer

    bind -M insert \ef 'cdi; commandline -f repaint'
    bind -M default \ef 'cdi; commandline -f repaint'
    bind -M insert \eo 'cd -; commandline -f repaint'
    bind -M default \eo 'cd -; commandline -f repaint'
end
