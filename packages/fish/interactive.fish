set --universal pure_color_current_directory blue
set --universal pure_color_info blue
set --universal pure_color_git_dirty blue
set --universal pure_color_git_stash blue

zoxide init fish --cmd cd | source
direnv hook fish | source
