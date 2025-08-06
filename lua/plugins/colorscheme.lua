return {
  "maxmx03/solarized.nvim",
  lazy = false,
  priority = 1000,
  opts = {},
  config = function(_, opts)
    vim.o.termguicolors = true

    -- Custom colorscheme matching Alacritty blue theme
    local colors = {
      bg = "#010080", -- Classic blue background
      fg = "#FFFFFF", -- White foreground
      black = "#000000",
      red = "#AA0000",
      green = "#00AA00",
      yellow = "#AAAA00",
      blue = "#0000AA",
      magenta = "#AA00AA",
      cyan = "#00AAAA",
      white = "#AAAAAA",
      bright_black = "#555555",
      bright_red = "#FF5555",
      bright_green = "#55FF55",
      bright_yellow = "#FFFF55",
      bright_blue = "#5555FF",
      bright_magenta = "#FF55FF",
      bright_cyan = "#55FFFF",
      bright_white = "#FFFFFF",
    }

    -- Set global background first
    vim.cmd("highlight clear")
    vim.o.background = "dark"

    -- Set highlight groups
    local highlights = {
      Normal = { fg = colors.fg, bg = "NONE" },
      NormalFloat = { fg = colors.fg, bg = "NONE" },
      NormalNC = { fg = colors.fg, bg = "NONE" },
      EndOfBuffer = { fg = colors.bg, bg = "NONE" },
      SignColumn = { bg = "NONE" },
      FoldColumn = { bg = "NONE" },
      Comment = { fg = colors.bright_black, italic = true },
      Constant = { fg = colors.bright_cyan },
      String = { fg = colors.bright_green },
      Character = { fg = colors.bright_green },
      Number = { fg = colors.bright_magenta },
      Boolean = { fg = colors.bright_magenta },
      Float = { fg = colors.bright_magenta },
      Identifier = { fg = colors.bright_white },
      Function = { fg = colors.bright_yellow },
      Statement = { fg = colors.bright_cyan },
      Conditional = { fg = colors.bright_cyan },
      Repeat = { fg = colors.bright_cyan },
      Label = { fg = colors.bright_cyan },
      Operator = { fg = colors.bright_white },
      Keyword = { fg = colors.bright_cyan },
      Exception = { fg = colors.bright_red },
      PreProc = { fg = colors.bright_cyan },
      Include = { fg = colors.bright_cyan },
      Define = { fg = colors.bright_cyan },
      Macro = { fg = colors.bright_cyan },
      PreCondit = { fg = colors.bright_cyan },
      Type = { fg = colors.bright_yellow },
      StorageClass = { fg = colors.bright_yellow },
      Structure = { fg = colors.bright_yellow },
      Typedef = { fg = colors.bright_yellow },
      Special = { fg = colors.bright_red },
      SpecialChar = { fg = colors.bright_red },
      Tag = { fg = colors.bright_red },
      Delimiter = { fg = colors.bright_white },
      SpecialComment = { fg = colors.bright_cyan },
      Debug = { fg = colors.bright_red },
      Underlined = { fg = colors.bright_cyan, underline = true },
      Ignore = { fg = colors.bright_black },
      Error = { fg = colors.bright_red, bg = "NONE" },
      Todo = { fg = colors.bright_yellow, bg = "NONE", bold = true },

      -- UI elements
      LineNr = { fg = colors.bright_black },
      CursorLineNr = { fg = colors.bright_white, bold = true },
      CursorLine = { bg = "#000099" },
      Visual = { bg = "#FFD700", fg = "#000000" },
      VisualNOS = { bg = "#FFD700", fg = "#000000" },
      Search = { fg = "#000000", bg = "#FFFF00" },
      IncSearch = { fg = "#FFFFFF", bg = "#FF0000" },
      StatusLine = { fg = colors.bright_white, bg = "#000077" },
      StatusLineNC = { fg = colors.bright_black, bg = "#000044" },
      VertSplit = { fg = colors.bright_black },
      Pmenu = { fg = colors.fg, bg = "#000077" },
      PmenuSel = { fg = colors.bg, bg = colors.bright_white },
      PmenuSbar = { bg = colors.bright_black },
      PmenuThumb = { bg = colors.bright_white },

      -- Git signs
      GitSignsAdd = { fg = colors.bright_green },
      GitSignsChange = { fg = colors.bright_yellow },
      GitSignsDelete = { fg = colors.bright_red },

      -- Telescope
      TelescopeNormal = { fg = colors.fg, bg = "NONE" },
      TelescopeBorder = { fg = colors.bright_blue, bg = "NONE" },
      TelescopePromptNormal = { fg = colors.fg, bg = "NONE" },
      TelescopePromptBorder = { fg = colors.bright_blue, bg = "NONE" },
      TelescopePromptTitle = { fg = colors.bright_white, bg = colors.bright_blue },
      TelescopePreviewTitle = { fg = colors.bright_white, bg = colors.bright_green },
      TelescopeResultsTitle = { fg = colors.bright_white, bg = colors.bright_red },

      -- Neo-tree
      NeoTreeNormal = { fg = colors.fg, bg = "NONE" },
      NeoTreeNormalNC = { fg = colors.fg, bg = "NONE" },
      NeoTreeEndOfBuffer = { fg = colors.bg, bg = "NONE" },
      NeoTreeWinSeparator = { fg = colors.bright_black, bg = "NONE" },
      NeoTreeRootName = { fg = colors.bright_white, bold = true },
      NeoTreeDirectoryName = { fg = colors.bright_white, bold = true },
      NeoTreeDirectoryIcon = { fg = colors.bright_cyan },
      NeoTreeFileName = { fg = colors.fg },
      NeoTreeFileIcon = { fg = colors.bright_cyan },
      NeoTreeIndentMarker = { fg = colors.bright_black },
      NeoTreeExpander = { fg = colors.bright_black },
      NeoTreeDotfile = { fg = colors.bright_black },
      NeoTreeHiddenByName = { fg = colors.bright_black },
      NeoTreeGitAdded = { fg = colors.bright_green },
      NeoTreeGitConflict = { fg = colors.bright_red },
      NeoTreeGitDeleted = { fg = colors.bright_red },
      NeoTreeGitIgnored = { fg = colors.bright_black },
      NeoTreeGitModified = { fg = colors.bright_yellow },
      NeoTreeGitUnstaged = { fg = colors.bright_red },
      NeoTreeGitUntracked = { fg = colors.bright_green },
      NeoTreeGitStaged = { fg = colors.bright_green },
    }

    -- Apply highlights
    for group, opts in pairs(highlights) do
      vim.api.nvim_set_hl(0, group, opts)
    end

    -- Set colorscheme name
    vim.g.colors_name = "alacritty_blue"

    -- Force transparent background for all windows
    vim.cmd("highlight Normal guifg=#FFFFFF guibg=NONE")
    vim.cmd("highlight NormalNC guifg=#FFFFFF guibg=NONE")
    vim.cmd("highlight NormalFloat guifg=#FFFFFF guibg=NONE")

    -- Clear any plugin-specific backgrounds that might override
    vim.api.nvim_create_autocmd("ColorScheme", {
      pattern = "*",
      callback = function()
        vim.cmd("highlight Normal guifg=#FFFFFF guibg=NONE")
        vim.cmd("highlight NormalNC guifg=#FFFFFF guibg=NONE")
      end,
    })
  end,
}
