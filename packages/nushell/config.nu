$env.config.color_config = {
  binary: '#bb9af7'
  block: '#7aa2f7'
  cell-path: '#a9b1d6'
  closure: '#7dcfff'
  custom: '#c0caf5'
  duration: '#e0af68'
  float: '#f7768e'
  glob: '#c0caf5'
  int: '#bb9af7'
  list: '#7dcfff'
  nothing: '#f7768e'
  range: '#e0af68'
  record: '#7dcfff'
  string: '#9ece6a'

  bool: {|| if $in { '#7dcfff' } else { '#e0af68' } }

  datetime: {|| (date now) - $in |
      if $in < 1hr {
          { fg: '#f7768e' attr: 'b' }
      } else if $in < 6hr {
          '#f7768e'
      } else if $in < 1day {
          '#e0af68'
      } else if $in < 3day {
          '#9ece6a'
      } else if $in < 1wk {
          { fg: '#9ece6a' attr: 'b' }
      } else if $in < 6wk {
          '#7dcfff'
      } else if $in < 52wk {
          '#7aa2f7'
      } else { 'dark_gray' }
  }

  filesize: {|e|
      if $e == 0b {
          '#a9b1d6'
      } else if $e < 1mb {
          '#7dcfff'
      } else {{ fg: '#7aa2f7' }}
  }

  shape_and: { fg: '#bb9af7' attr: 'b' }
  shape_binary: { fg: '#bb9af7' attr: 'b' }
  shape_block: { fg: '#7aa2f7' attr: 'b' }
  shape_bool: '#7dcfff'
  shape_closure: { fg: '#7dcfff' attr: 'b' }
  shape_custom: '#9ece6a'
  shape_datetime: { fg: '#7dcfff' attr: 'b' }
  shape_directory: '#7dcfff'
  shape_external: '#7dcfff'
  shape_external_resolved: '#7dcfff'
  shape_externalarg: { fg: '#9ece6a' attr: 'b' }
  shape_filepath: '#7dcfff'
  shape_flag: { fg: '#7aa2f7' attr: 'b' }
  shape_float: { fg: '#f7768e' attr: 'b' }
  shape_garbage: { fg: '#FFFFFF' bg: '#FF0000' attr: 'b' }
  shape_glob_interpolation: { fg: '#7dcfff' attr: 'b' }
  shape_globpattern: { fg: '#7dcfff' attr: 'b' }
  shape_int: { fg: '#bb9af7' attr: 'b' }
  shape_internalcall: { fg: '#7dcfff' attr: 'b' }
  shape_keyword: { fg: '#bb9af7' attr: 'b' }
  shape_list: { fg: '#7dcfff' attr: 'b' }
  shape_literal: '#7aa2f7'
  shape_match_pattern: '#9ece6a'
  shape_matching_brackets: { attr: 'u' }
  shape_nothing: '#f7768e'
  shape_operator: '#e0af68'
  shape_or: { fg: '#bb9af7' attr: 'b' }
  shape_pipe: { fg: '#bb9af7' attr: 'b' }
  shape_range: { fg: '#e0af68' attr: 'b' }
  shape_raw_string: { fg: '#c0caf5' attr: 'b' }
  shape_record: { fg: '#7dcfff' attr: 'b' }
  shape_redirection: { fg: '#bb9af7' attr: 'b' }
  shape_signature: { fg: '#9ece6a' attr: 'b' }
  shape_string: '#9ece6a'
  shape_string_interpolation: { fg: '#7dcfff' attr: 'b' }
  shape_table: { fg: '#7aa2f7' attr: 'b' }
  shape_vardecl: { fg: '#7aa2f7' attr: 'u' }
  shape_variable: '#bb9af7'

  foreground: '#c0caf5'
  background: '#1a1b26'
  cursor: '#c0caf5'

  empty: '#7aa2f7'
  header: { fg: '#9ece6a' attr: 'b' }
  hints: '#414868'
  leading_trailing_space_bg: { attr: 'n' }
  row_index: { fg: '#9ece6a' attr: 'b' }
  search_result: { fg: '#f7768e' bg: '#a9b1d6' }
  separator: '#a9b1d6'
}

$env.config.show_banner = false
$env.config.buffer_editor = "nvim"
$env.config.edit_mode = "vi"

$env.FZF_CTRL_T_COMMAND = "fd --type file --follow --hidden --exclude .git"
$env.FZF_DEFAULT_COMMAND = "fd --type file --follow --hidden --exclude .git"
$env.FZF_DEFAULT_OPTS = "--ansi --color bg:#16161e,bg+:#1a1b26,fg:#787c99,fg+:#cbccd1,header:#7aa2f7,hl:#7aa2f7,hl+:#7aa2f7,info:#e0af68,marker:#7dcfff,pointer:#7dcfff,prompt:#e0af68,spinner:#7dcfff"
$env.MANPAGER = "nvim +Man!"

$env.config.abbreviations = {
  _: "sudo",

  ..: "cd ..",
  ...: "cd ../..",
  ....: "cd ../../..",
  .....: "cd ../../../..",
  ......: "cd ../../../../..",
  b: "bat",
  cp: "cp -i",
  du: "du -h",
  e: "nvim",
  se: "sudoedit",
  g: "git",
  h: "tldr",
  l: "ls",
  la: "ls -a",
  ll: "ls -l",
  lla: "eza -la",
  m: "man",
  md: "mkdir",
  mv: "mv -i",
  n: "yazi",
  ns: "nix-shell",
  nb: "nom-build",
  ne: "nix-instantiate --eval",
  rm: "rm -i",
  rs: "rsync --archive --hard-links --verbose --info=progress2",
  s: "ssh",
  t: "tmux",
  v: "nvim -R",
  view: "nvim -R",
  vimdiff: "nvim -d",
  yt: "yt-dlp",
  zn: "zk new --title",
  zo: "zk edit --interactive"
}

$env.config.keybindings ++= [
  {
    name: tab_history_completion
    modifier: control
    keycode: char_n
    mode: [ vi_insert, vi_normal ]
    event: {
      until: [
        { send: historyhintcomplete }
        { send: menuright }
        { send: right }
      ]
    }
  }
  {
    name: change_dir
    modifier: alt
    keycode: char_f
    mode: [ vi_insert, vi_normal ]
    event: [
      { edit: Clear }
      {
        edit: InsertString,
        value: "zi"
      }
      { send: Enter }
    ]
  },
  {
    name: prev_dir
    modifier: alt
    keycode: char_o
    mode: [ vi_insert, vi_normal ]
    event: [
      { edit: Clear }
      {
        edit: InsertString,
        value: "cd -"
      }
      { send: Enter }
    ]
  },
]

if (which starship | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
}

if (which zoxide | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  zoxide init nushell | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
}

$env.config.hooks.pre_prompt = [{
  if (which direnv | is-not-empty) {
    direnv export json | from json | default {} | load-env
  }
}]

if (which nix-your-shell | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  nix-your-shell --nom nu | save -f ($nu.data-dir | path join "vendor/autoload/nix-your-shell.nu")
}

if (which fzf | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  fzf --nushell | save -f ($nu.data-dir | path join "vendor/autoload/fzf.nu")
}
