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
