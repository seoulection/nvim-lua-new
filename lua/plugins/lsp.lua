-- ~/.config/nvim/lua/plugins/lsp.lua
return {
  -- 1. Language Server Configurations & Bridge
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "Saghen/blink.cmp",
    },
    config = function()
      local lsps = {
        "eslint",
        "lua_ls",
        "vtsls"
      }
      -- Initial Setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        -- autoinstall lsps
        ensure_installed = lsps
      })

      -- MODERN API: Inject blink.cmp capabilities into ALL servers automatically
      -- This fixes the "no completion" issue globally.
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
      })

      vim.lsp.config("eslint", {
        -- This helps the LSP find your config in monorepos or subfolders
        root_markers = {
          '.eslintrc',
          '.eslintrc.js',
          '.eslintrc.json',
          'eslint.config.js',
          'package.json',
          '.git'
        },
        settings = {
          workingDirectory = { mode = 'auto' },
          format = true, -- Enable if you want to use LSP for formatting
        }
      })

      -- MODERN API: Configure specific TS settings for vtsls
      -- This extends the default data from nvim-lspconfig
      vim.lsp.config("vtsls", {
        settings = {
          typescript = {
            updateImportsOnFileMove = { enabled = "always" },
            inlayHints = {
              parameterNames = { enabled = "all" },
              variableTypes = { enabled = true },
            },
          },
        },
      })

      -- enable lsps
      vim.lsp.enable(lsps)
    end,
  },

  -- 2. Completion Engine (blink.cmp)
  {
    "Saghen/blink.cmp",
    version = "*", -- Use the latest stable release
    opts = {
      keymap = { preset = "default" },
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },
    },
  },
}
