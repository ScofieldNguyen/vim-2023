-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local remap = { remap = true }

-- Increment/decrement
keymap.set("n", "+", "<C-a>")
keymap.set("n", "-", "<C-x>")
--

-- Delete a word backwards
keymap.set("n", "dw", "wb_d")

-- Select all
keymap.set("n", "<C-a>", "gg<S-v>G")

-- Jumplist
keymap.set("n", "<C-m>", "<C-i>", opts)

-- buffers
keymap.set("n", "<tab>", ":BufferLineCycleNext<Return>", opts)
keymap.set("n", "<S-tab>", ":BufferLineCyclePrev<Return>", opts)
keymap.set("n", "<C-w>", ":bd<Return>", opts) -- delete others buffer

-- Split windows
keymap.set("n", "<C-x>", ":split<Return>", opts)
keymap.set("n", "<C-v>", ":vsplit<Return>", opts)

-- Dianostics
keymap.set("n", "]c", function()
  vim.diagnostic.goto_next()
end, opts)

keymap.set("n", "[c", function()
  vim.diagnostic.goto_prev()
end, opts)

-- Code action
keymap.set("n", "<leader>n", "<leader>ca", remap)

-- Source action
keymap.set("n", "<leader>N", "<leader>cA", remap)

-- Rename
keymap.set("n", "<leader>rn", "<leader>cr", remap)

-- Find files
keymap.set("n", "<C-p>", "<leader><space>", remap)

-- Search global
keymap.set("n", "<C-S-f>", "<leader>/", remap)

-- Recent files
keymap.set("n", "<C-e>", "<leader>fr", remap)

-- Surround
keymap.set("v", "S", "gsa", remap)
keymap.set("n", "dS", "gsd", remap)
keymap.set("n", "rS", "gsd", remap)

-- open tree
keymap.set("n", "<C-n>", "<space>e", remap)
