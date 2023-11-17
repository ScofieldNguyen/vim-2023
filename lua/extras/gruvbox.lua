vim.o.background = "dark"
vim.cmd([[
colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE
]])
require("gruvbox").setup({
  transparent_mode = true,
})
