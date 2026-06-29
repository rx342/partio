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
