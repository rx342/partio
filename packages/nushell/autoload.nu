if (which starship | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")
}

if (which zoxide | is-not-empty) {
  mkdir ($nu.data-dir | path join "vendor/autoload")
  zoxide init nushell --cmd cd | save -f ($nu.data-dir | path join "vendor/autoload/zoxide.nu")
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
