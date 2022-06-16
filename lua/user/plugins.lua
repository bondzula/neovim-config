local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Autocommand that reloads neovim whenever you save the plugins.lua file
-- vim.api.nvim_create_autocmd({ "BufWritePost" }, {
--   callback = function ()
--     vim.cmd [[
--       plugins.lua source <afile>
--       PackerSync
--     ]]
--   end
-- })

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "famiu/bufdelete.nvim"
  use "lewis6991/impatient.nvim"
  use "goolord/alpha-nvim" -- Startup dashboard
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "editorconfig/editorconfig-vim"
  use "wellle/targets.vim"
  use { 'akinsho/bufferline.nvim', tag = "v2.*", requires = 'kyazdani42/nvim-web-devicons' }
  use 'stevearc/dressing.nvim'

  -- Improve navigation over camel or snake case words
  use { "chaoren/vim-wordmotion", config = function()
    vim.g.wordmotion_prefix = "<leader>"
  end }

  -- Tmux integration
  use 'waylonwalker/Telegraph.nvim'

  -- TODO: Use those plugins
  use "AndrewRadev/splitjoin.vim"
  use "ThePrimeagen/harpoon"

  -- surround
  use { "ur4ltz/surround.nvim", config = function()
    require("surround").setup({
      mapping_style = "sandwich"
    })
  end }

  -- Statusline
  use "nvim-lualine/lualine.nvim"

  -- Embed lualine into tmux status line
  use { "vimpostor/vim-tpipeline", config = function()
    vim.g.tpipeline_autoembed = 1
    vim.g.tpipeline_cursormoved = 1
  end }

  -- Notes
  use "mickael-menu/zk-nvim"

  -- Colorschemes
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- cmp plugins
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-nvim-lsp"
  use "petertriho/cmp-git"
  use "saadparwaiz1/cmp_luasnip"

  -- snippets
  use "L3MON4D3/LuaSnip"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"
  use "b0o/schemastore.nvim"

  -- Telescope
  use "nvim-telescope/telescope.nvim"
  use 'nvim-telescope/telescope-live-grep-args.nvim'
  use { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use "JoosepAlviste/nvim-ts-context-commentstring"
  use 'nvim-treesitter/playground'

  -- Treesitter powerd auto closing
  use "windwp/nvim-autopairs"
  use "windwp/nvim-ts-autotag"

  -- Treesitter powerd anotations
  use "danymat/neogen"

  -- Show a color of hexadecimal value
  use "norcalli/nvim-colorizer.lua"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "pwntester/octo.nvim"
  use 'ruifm/gitlinker.nvim'
  use "ThePrimeagen/git-worktree.nvim"
  use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' } }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
