return {
  {
    "neovim/nvim-lspconfig",
    version = "*",
    opts = {
      servers = {
        tsserver = {
          settings = {
            typescript = {
              references = {
                importmodulespecifierpreference = "non-relative",
              },
            },
            javascript = {
              references = {
                importmodulespecifierpreference = "non-relative",
              },
            },
          },
        },
      },
    },
  },
}
