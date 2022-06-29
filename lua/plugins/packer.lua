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

vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost packer.lua source <afile> | PackerSync
  augroup end
]]

-- Install your plugins here
return packer.startup(function(use)
  -- My plugins here
  use "wbthomason/packer.nvim"

  -- Keep this at the start
  use {
    "lewis6991/impatient.nvim",
    config = function() require("impatient") end,
  }

  use "kyazdani42/nvim-web-devicons"
  use "famiu/bufdelete.nvim"
  use "editorconfig/editorconfig-vim"
  use "wellle/targets.vim"

  use {
    'is0n/fm-nvim',
    config = function() require("plugins.fm") end
  }

  use {
    "SmiteshP/nvim-navic",
    config = function() require("plugins.navic") end,
  }

  -- better quickfix list
  use {
    "https://gitlab.com/yorickpeterse/nvim-pqf.git",
    config = function() require("pqf").setup() end,
  }

  use {
    "goolord/alpha-nvim",
    config = function() require("plugins.alpha") end
  }

  use {
    'stevearc/dressing.nvim',
    config = function() require("plugins.dressing") end,
  }

  -- Improve navigation over camel or snake case words
  use { "chaoren/vim-wordmotion", config = function()
    vim.g.wordmotion_prefix = "<leader>"
  end }

  -- Pretty fold
  use {
    'kevinhwang91/nvim-ufo',
    config = function() require("plugins.ufo") end,
    requires = 'kevinhwang91/promise-async',
  }

  --
  use {
    "numToStr/Comment.nvim",
    config = function() require("plugins.comment")  end,
  }

  -- Tmux integration
  use {
    'waylonwalker/Telegraph.nvim',
    config = function() require("plugins.telegraph") end,
  }

  -- TODO: Use those plugins
  use {
    "AndrewRadev/splitjoin.vim",
  }

  -- surround
  use { "ur4ltz/surround.nvim", config = function()
   require("surround").setup({
      mapping_style = "sandwich"
    })
  end }

  -- Statusline
  use {
    "nvim-lualine/lualine.nvim",
    config = function() require("plugins.lualine") end,
  }

  -- Embed lualine into tmux status line
  use { "vimpostor/vim-tpipeline", config = function()
    vim.g.tpipeline_autoembed = 1
    vim.g.tpipeline_cursormoved = 1
  end }

  -- Notes
  use {
    "mickael-menu/zk-nvim",
    config = function() require("plugins.zk-nvim") end,
  }

  -- Colorschemes
  use { "catppuccin/nvim", as = "catppuccin" }

  -- cmp plugins
  use {
    "hrsh7th/nvim-cmp",
    config = function() require("plugins.cmp") end,
    requires = {
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "petertriho/cmp-git",
      "saadparwaiz1/cmp_luasnip",
    }
  }

  -- snippets
  use {
    "L3MON4D3/LuaSnip",
    config = function() require("plugins.luasnip") end,
  }

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"
  use "b0o/schemastore.nvim"

  -- Telescope
  use {
    "nvim-telescope/telescope.nvim",
    config = function () require("plugins.telescope") end,
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
      { 'nvim-telescope/telescope-fzf-native.nvim', run = 'make' }
    }
  }

  --
  use {
    "ThePrimeagen/harpoon",
    config = function() require("plugins.harpoon") end,
  }


  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function () require("plugins.treesitter") end,
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
      "JoosepAlviste/nvim-ts-context-commentstring",
      "nvim-treesitter/playground",
    }
  }

  -- Treesitter powerd auto closing
  use {
    "windwp/nvim-autopairs",
    config = function() require("plugins.autopairs") end
  }

  use "windwp/nvim-ts-autotag"

  -- Treesitter powerd anotations
  use {
    "danymat/neogen",
    config = function() require("plugins.neogen") end,
  }

  -- Show a color of hexadecimal value
  use {
    "norcalli/nvim-colorizer.lua",
    config = function() require("plugins.colorizer") end,
  }

  -- Git worktree
  use {
    "ThePrimeagen/git-worktree.nvim",
    config = function() require("plugins.git-worktree") end,
  }

  -- Git signgs
  use {
    "lewis6991/gitsigns.nvim",
    config = function() require("plugins.gitsigns") end,
  }

  -- Git linker
  use {
    'ruifm/gitlinker.nvim',
    config = function() require("plugins.gitlinker") end,
  }

  -- Git
  use {
    "pwntester/octo.nvim",
    config = function() require("plugins.octo") end
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
