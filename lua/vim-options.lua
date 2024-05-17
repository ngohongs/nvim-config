vim.cmd("language en_US")

-- Set <space> as the leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- If Nerd Font is installed for the terminal
vim.g.have_nerd_font = true

-- Enable break indent
vim.opt.breakindent = true

-- Replace tabs with 4 spaces
vim.opt.expandtab = true
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- Make line number default
-- Relative line number for relative jumps
vim.opt.number = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim
vim.opt.clipboard = "unnamedplus"

-- Sets how neovim will display certain whitespace chareacters in the editor.
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

-- Set hilglight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Save undo history
vim.opt.undofile = true

-- Preview substituions live, as you type
vim.opt.inccommand = "split"

-- Show which line your cursor is on
-- vim.opt.cursorline = true

-- Decrease update time
vim.opt.updatetime = 250

-- Decreate mapped sequence wait time
vim.opt.timeoutlen = 300

-- Enable mouse anywhere
vim.opt.mouse = "a"

-- Enable signcolumn
vim.opt.signcolumn = "yes"

-- Highlight when yanking text
vim.api.nvim_create_autocmd("TextYankPost", {
	desc = "Highlight when yanking text",
	group = vim.api.nvim_create_augroup("kickstart-highlight-yank", { clear = true }),
	callback = function()
		vim.highlight.on_yank()
	end,
})

--
--
--
-- KEYMAPS
--
--
--
-- Switch to normal mode using jj
vim.keymap.set("i", "jj", "<Esc>", { noremap = true, silent = true })

-- Exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set("n", "<C-h>", "<C-w><C-h>", { desc = "Move focus to the left window" })
vim.keymap.set("n", "<C-l>", "<C-w><C-l>", { desc = "Move focus to the right window" })
vim.keymap.set("n", "<C-j>", "<C-w><C-j>", { desc = "Move focus to the lower window" })
vim.keymap.set("n", "<C-k>", "<C-w><C-k>", { desc = "Move focus to the upper window" })

-- Closing window shortcut
vim.api.nvim_set_keymap("n", "<C-x>", ":close<CR>", { noremap = true })

-- Folding
vim.keymap.set("n", "zm", "<cmd>foldclose<CR>", { desc = "Close code fold" })
vim.keymap.set("n", "zr", "<cmd>foldopen<CR>", { desc = "Open code fold" })
