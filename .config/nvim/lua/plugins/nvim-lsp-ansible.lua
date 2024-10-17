return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        ansiblels = {
          settings = {
            -- Disable ansible-lint
            ansible = {
              validation = {
                lint = {
                  enabled = false,
                },
              },
            },
          },
          filetypes = {
            "ansible",
          },
        },
        tsserver = {
          settings = {
            typescript = {
              preferences = {
                importModuleSpecifier = "non-relative", -- or any other value you prefer
              },
            },
          },
        },
      },
    },
  },
}
