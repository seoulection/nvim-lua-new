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
      -- Initial Setup
      require("mason").setup()
      require("mason-lspconfig").setup({
        ensure_installed = { "vtsls", "lua_ls" }, -- Auto-install these
      })

      -- MODERN API: Inject blink.cmp capabilities into ALL servers automatically
      -- This fixes the "no completion" issue globally.
      vim.lsp.config("*", {
        capabilities = require("blink.cmp").get_lsp_capabilities(),
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

      -- MODERN API: Enable the servers
      vim.lsp.enable({ "vtsls", "lua_ls" })
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
