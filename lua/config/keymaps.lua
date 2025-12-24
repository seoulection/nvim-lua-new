-- set leader to <space>
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- show line numbers
vim.opt.number = true

-- sync clipboard between OS and nvim
vim.opt.clipboard = "unnamedplus"

-- enable break indent
vim.opt.breakindent = true

-- save undo history
vim.opt.undofile = true

-- case-insensitive search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- decrease update time
vim.opt.updatetime = 250

-- display which-key sooner
vim.opt.timeoutlen = 300

-- how new splits are opened
vim.opt.splitright = false
vim.opt.splitbelow = true

-- format whitespaces
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- tabs (safety net)
vim.opt.autoindent = true
vim.opt.expandtab = true
vim.opt.smartindent = false
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.softtabstop = 2

-- show which line your cursor is on
vim.opt.cursorline = true

-- minimal number of screen lines to keep above and below the cursor
vim.opt.scrolloff = 10

-- set highlight on search, but clear on pressing <esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- no arrow keys in normal mode
vim.keymap.set("n", "<left>", '<cmd>echo "I can\'t let you do that"<CR>')
vim.keymap.set("n", "<right>", '<cmd>echo "I can\'t let you do that"<CR>')
vim.keymap.set("n", "<up>", '<cmd>echo "I can\'t let you do that"<CR>')
vim.keymap.set("n", "<down>", '<cmd>echo "I can\'t let you do that"<CR>')

-- keybinds to make split navigation easier
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- diagnostics
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })

-- no mouse
vim.opt.mouse = ""
