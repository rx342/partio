set socket_name "ssh-agent"

switch (uname)
    case Darwin
        set temp_dir (getconf DARWIN_USER_TEMP_DIR)
        set socketPath "$temp_dir/$socket_name"
    case '*'
        set socketPath "$XDG_RUNTIME_DIR/$socket_name"
end

if test -z "$SSH_AUTH_SOCK"
    set -x SSH_AUTH_SOCK $socketPath
end
