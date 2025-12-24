return {
  {
    "nvim-mini/mini.comment",
    version = false,
    config = function()
      require('mini.comment').setup()
    end
  },
  -- {
  --   "nvim-mini/mini.pairs",
  --   version = false,
  --   config = function()
  --     require('mini.pairs').setup()
  --   end
  -- },
  {
    "nvim-mini/mini.surround",
    version = false,
    config = function()
      require('mini.surround').setup()
    end
  },
}
