return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  branch = 'main',
  lazy = false,
  dependencies = {
    "windwp/nvim-ts-autotag",
    "windwp/nvim-autopairs"
  },
  config = function()
    -- intialize autopairs
    local autopairs = require('nvim-autopairs')
    local Rule = require('nvim-autopairs.rule')

    autopairs.setup({
      check_ts = true,
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
      },
    })

    autopairs.add_rules({
      Rule(">", "<", { "typescriptreact", "javascriptreact", "html" })
          :with_pair(function(opts)
            -- Only expand if we are between ><
            return opts.char == "<"
          end)
      -- This move tells nvim-autopairs to handle the CR (Enter)
      -- logic automatically for this pair
          :replace_map_cr(function() return "<Plug>(nvim-autopairs-CR)" end)
    })

    -- initialize autotagger
    require('nvim-ts-autotag').setup({
      opts = {
        -- Defaults
        enable_close = true,           -- Auto close tags
        enable_rename = true,          -- Auto rename pairs of tags
        enable_close_on_slash = false, -- Auto close on trailing </
      },
    })

    -- initialize treesitter
    local ts = require('nvim-treesitter')

    ts.install({
      'javascript',
      'lua',
      'typescript',
      'tsx'
    })

    vim.api.nvim_create_autocmd('FileType', {
      pattern = {
        'javascript',
        'javascriptreact',
        'typescript',
        'typescriptreact'
      },
      callback = function()
        -- only start if a parser exists for this filetype
        if pcall(vim.treesitter.start) then
          vim.treesitter.start()
          -- enable treesitter indentation
          vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
        end
      end
    })
  end
}
