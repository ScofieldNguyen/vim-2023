return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      enable_git_status = false,
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = {
          enabled = true,
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_hidden = false,
        },
      },
      buffers = {
        follow_current_file = {
          enabled = false, -- This will find and focus the file in the active buffer every time
          --              -- the current file is changed while the tree is open.
          leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
        },
      },
      window = {
        mappings = {
          ["/"] = "none",
        },
      },
    },
  },
}
