return {
  {
    "ThePrimeagen/harpoon",
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    branch = "harpoon2",
    config = function()
      local harpoon = require("harpoon")
      harpoon:setup()
      vim.keymap.set("n", "<leader>hx", function()
        harpoon:list():add()
      end)
      vim.keymap.set("n", "<C-e>", function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)
      vim.keymap.set("n", "<Leader>hn", function()
        harpoon:list():next()
      end)
      vim.keymap.set("n", "<Leader>hp", function()
        harpoon:list():prev()
      end)
      vim.keymap.set("n", "<Leader>h1", function()
        harpoon:list():select(1)
      end)
      vim.keymap.set("n", "<Leader>h2", function()
        harpoon:list():select(2)
      end)
      vim.keymap.set("n", "<Leader>h3", function()
        harpoon:list():select(3)
      end)
      vim.keymap.set("n", "<Leader>h4", function()
        harpoon:list():select(4)
      end)
    end,
  },
}
