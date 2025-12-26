return {
  'nvim-telescope/telescope.nvim',
  tag = 'v0.2.0',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<leader>f', builtin.find_files, { desc = 'Telescope [f]ind files' })
    vim.keymap.set('n', '<leader>g', builtin.live_grep, { desc = 'Telescope live [g]rep' })
    vim.keymap.set('n', '<leader>b', builtin.buffers, { desc = 'Telescope [b]uffers' })
    vim.keymap.set('n', '<leader>th', builtin.help_tags, { desc = 'Telescope help tags' })
    vim.keymap.set('n', '<leader>i', builtin.grep_string, { desc = 'Telescope search current word' })
    -- go to definition in vertical split
    vim.keymap.set("n", "<leader>o", function()
      builtin.lsp_definitions({ jump_type = "vsplit" })
    end, { desc = 'Telescope goto definition in vertical split' })
  end
}
