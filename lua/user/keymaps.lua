local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- Normal --
-- Better window navigation
keymap("n", "<C-h>", "<C-w>h", opts)
keymap("n", "<C-j>", "<C-w>j", opts)
keymap("n", "<C-k>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Save buffer (:up only saves the buffer if there are changes)
keymap("n", "<C-s>", "<cmd>w<cr>", opts)

-- Navigate buffers
keymap("n", "]b", "<cmd>bnext<cr>", opts)
keymap("n", "[b", "<cmd>bprevious<cr>", opts)

-- Toggle quick-fix list
keymap("n", "<C-q>", "<cmd>copen<cr>", opts)

-- Navigate quick-fix list
keymap("n", "]q", "<cmd>cnext<cr>", opts)
keymap("n", "[q", "<cmd>cprev<cr>", opts)

-- Find files
keymap("n", "<C-p>", "<cmd>Telescope find_files<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Visual Block --
-- Move text up and down
-- keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
-- keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
-- keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)
