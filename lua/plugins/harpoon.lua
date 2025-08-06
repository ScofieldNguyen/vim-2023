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
      vim.keymap.set("n", "<Leader>ch", function()
        -- build up harpoon file list
        local harpoon_files = {}
        local harpoon_list = harpoon:list()
        for i = 1, harpoon_list:length() do
          local item = harpoon_list:get(i)
          if item and item.value then
            local full_path = vim.fn.fnamemodify(item.value, ":p")
            harpoon_files[full_path] = true
          end
        end

        -- build up buffer to delete lists
        local buffers_to_delete = {}
        local buffers = vim.api.nvim_list_bufs()
        for _, buf in ipairs(buffers) do
          if vim.api.nvim_buf_is_loaded(buf) and vim.api.nvim_buf_get_name(buf) ~= "" then
            local buf_path = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(buf), ":p")
            if not harpoon_files[buf_path] then
              table.insert(buffers_to_delete, buf)
            end
          end
        end

        -- build up displaying buffers
        local displayed_buffers = {}
        for _, win in ipairs(vim.api.nvim_list_wins()) do
          local buf = vim.api.nvim_win_get_buf(win)
          displayed_buffers[buf] = true
        end

        for _, buf in ipairs(buffers_to_delete) do
          local windows = vim.fn.win_findbuf(buf)

          for _, win in ipairs(windows) do
            vim.api.nvim_win_call(win, function()
              local switched = false
              -- try to find an undisplayed harpoon buffer
              for i = 1, harpoon_list:length() do
                local item = harpoon_list:get(i)
                if item and item.value then
                  local harpoon_buf = vim.fn.bufnr(item.value)

                  -- if not display yet
                  if harpoon_buf ~= -1 and vim.fn.buflisted(harpoon_buf) and not displayed_buffers[harpoon_buf] then
                    vim.cmd("buffer " .. harpoon_buf)
                    displayed_buffers[harpoon_buf] = true -- mark as displayed
                    switched = true
                    break
                  end
                end
              end

              -- fallback: create new empty buffer if no harpoon buffer available
              if not switched then
                vim.cmd("enew")
              end
            end)
          end

          -- now safe to delete the buffer
          vim.api.nvim_buf_delete(buf, { force = false })
        end
      end)
    end,
  },
}
