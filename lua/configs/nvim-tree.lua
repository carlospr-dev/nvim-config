local opts = {
  update_focused_file = {
    enable = true,
  },
  filters = {
    dotfiles = false,
  },
  actions = {
    open_file = {
      quit_on_open = true,
    },
  },
}

return opts
