local options = {
  background = "dark",                     -- Prefer dark background
  shell = "zsh",                           -- Set default shell
  hidden = true,
  lazyredra = true,                        -- Don't update screen while macro or command is executing
  autoread = true,                         -- Automatically read changes made outside vim
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  completeopt = { "menuone", "noselect" }, -- mostly just for cmp
  conceallevel = 0,                        -- so that `` is visible in markdown files
  fileencoding = "utf-8",                  -- the encoding written to a file
  hlsearch = true,                         -- highlight all matches on previous search pattern
  ignorecase = true,                       -- ignore case in search patterns
  mouse = "a",                             -- allow the mouse to be used in neovim
  pumheight = 10,                          -- pop up menu height
  showmode = false,                        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 0,                         -- always show tabs
  smartcase = true,                        -- smart case
  smartindent = true,                      -- make indenting smarter again
  spellsuggest = { "best", 9 },
  splitbelow = true,                       -- force all horizontal splits to go below current window
  splitright = true,                       -- force all vertical splits to go to the right of current window
  swapfile = false,                        -- creates a swapfile
  termguicolors = true,                    -- set term gui colors (most terminals support this)
  -- timeoutlen = 100,                        -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,                         -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,                     -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,                          -- the number of spaces inserted for each indentation
  tabstop = 2,                             -- insert 2 spaces for a tab
  cursorline = true,                       -- highlight the current line
  number = false,                           -- set numbered lines
  relativenumber = false,                  -- set relative numbered lines
  numberwidth = 2,                         -- set number column width to 2 {default 4}
  signcolumn = "yes",                      -- always show the sign column, otherwise it would shift the text each time
  wrap = false,                            -- display lines as one long line
  scrolloff = 8,                           -- is one of my fav
  sidescrolloff = 8,

  inccommand = "nosplit",

  foldlevel = 20,
  foldmethod = 'expr',
  foldexpr = 'nvim_treesitter#foldexpr()',

  laststatus = 3, -- Global statusline
  cmdheight = 0, -- By defauilt hide command line
}

for k, v in pairs(options) do
  vim.opt[k] = v
end

-- Use ripgrep as the grep program, if available
if (fn.executable("rg") == 1) then
  vim.opt.grepprg = "rg --vimgrep --no-heading --smart-case"
end

-- Appends
vim.opt.shortmess:append "c"
vim.opt.whichwrap:append "<,>,[,],h,l"
vim.opt.iskeyword:append "-"
