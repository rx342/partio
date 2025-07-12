function rx_load_plugin
  if test (count $argv) -lt 1
    echo Failed to load plugin, incorrect number of arguments
    return 1
  end
  set -l __plugin_dir $argv[1]/share/fish
  if test -d $__plugin_dir/vendor_functions.d
    set -p fish_function_path $__plugin_dir/vendor_functions.d
  end
  if test -d $__plugin_dir/vendor_completions.d
    set -p fish_complete_path $__plugin_dir/vendor_completions.d
  end
  if test -d $__plugin_dir/vendor_conf.d
    for f in $__plugin_dir/vendor_conf.d/*.fish
      source $f
    end
  end
end
