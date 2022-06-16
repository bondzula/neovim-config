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
  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "windwp/nvim-ts-autotag" -- Autotags
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "famiu/bufdelete.nvim"
  use "nvim-lualine/lualine.nvim"
  use "akinsho/toggleterm.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use "AndrewRadev/splitjoin.vim"
  use "editorconfig/editorconfig-vim"
  use "wellle/targets.vim"
  use { 'michaelb/sniprun', run = 'bash ./install.sh'}

  -- Improve navigation over camel or snake case words
  use { "chaoren/vim-wordmotion", config = function()
    vim.g.wordmotion_prefix = "<leader>"
  end }

  -- Notes
  use "mickael-menu/zk-nvim"

  use "ThePrimeagen/harpoon"

  -- surround
  use { "ur4ltz/surround.nvim", config = function()
    require("surround").setup({
      mapping_style = "sandwich"
    })
  end }

  -- Colorschemes
  use({ "catppuccin/nvim", as = "catppuccin" })

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-nvim-lsp"
  -- use "hrsh7th/cmp-copilot"
  use "petertriho/cmp-git"
  use "saadparwaiz1/cmp_luasnip" -- snippet completions

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  use "neovim/nvim-lspconfig" -- enable LSP
  use "williamboman/nvim-lsp-installer" -- simple to use language server installer
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
  use "b0o/schemastore.nvim"

  -- AI completion
  use 'github/copilot.vim'

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
        { 'nvim-telescope/telescope-live-grep-args.nvim' }
    }
  }

  use {'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use "JoosepAlviste/nvim-ts-context-commentstring"

  use 'nvim-treesitter/playground'
  -- Treesitter powerd anotations
  use "danymat/neogen"

  -- Run predefined tasks
  use 'jedrzejboczar/toggletasks.nvim'

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "pwntester/octo.nvim"
  use 'ruifm/gitlinker.nvim'
  use "ThePrimeagen/git-worktree.nvim"
  use { 'TimUntersberger/neogit', requires = { 'nvim-lua/plenary.nvim', 'sindrets/diffview.nvim' }}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
