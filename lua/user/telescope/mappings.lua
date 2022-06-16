local status_ok, telescope = pcall(require, 'telescope.builtin')

if not status_ok then
  return
end

local M = {}
local map = vim.keymap.set
local themes = require('telescope.themes')

function M.dropdown(path)
  return themes.get_dropdown({
    previewer = false,
    shorten_path = true,
    cwd = path,
  })
end

function M.diagnostis()
  return themes.get_dropdown({
    previewer = false,
    shorten_path = true,
    bufnr = 0,
  })
end

function M.cursor()
  return themes.get_cursor({
    previewer = false,
  })
end

-- Open Files from important directories
map("n", "<leader>on", function() telescope.find_files(M.dropdown("$HOME/Documents/Notes")) end)
map("n", "<leader>of", function() telescope.find_files(M.dropdown(vim.fn.stdpath("config"))) end)

-- LSP and Code Integrations
map("n", "<leader>lr", function () telescope.lsp_references(M.cursor()) end)
map("n", "<leader>ls", function () telescope.lsp_document_symbols(M.cursor()) end)
map("n", "<leader>lS", function () telescope.lsp_workspace_symbols(M.cursor()) end)
map("n", "<leader>ld", function () telescope.diagnostics(M.diagnostis()) end)
-- map("n", "<leader>lD", function () telescope.diagnostics(M.diagnostis()) end)

-- Find files
map("n", "<C-p>", telescope.find_files)

-- Search
map("n", "<A-/>", telescope.current_buffer_fuzzy_find)
map("n", "<leader>sp", require('telescope').extensions.live_grep_args.live_grep_args)

