-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.1',
-- or                            , branch = '0.1.x',
  requires = { {'nvim-lua/plenary.nvim'} }
}

use { "ellisonleao/gruvbox.nvim" }

use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

use { "mbbill/undotree" }

use {
  'VonHeikemen/lsp-zero.nvim',
  branch = 'v1.x',
  requires = {
    -- LSP Support
    {'neovim/nvim-lspconfig'},             -- Required
    {'williamboman/mason.nvim'},           -- Optional
    {'williamboman/mason-lspconfig.nvim'}, -- Optional

    -- Autocompletion
    {'hrsh7th/nvim-cmp'},         -- Required
    {'hrsh7th/cmp-nvim-lsp'},     -- Required
    {'hrsh7th/cmp-buffer'},       -- Optional
    {'hrsh7th/cmp-path'},         -- Optional
    {'saadparwaiz1/cmp_luasnip'}, -- Optional
    {'hrsh7th/cmp-nvim-lua'},     -- Optional

    -- Snippets
    {'L3MON4D3/LuaSnip'},             -- Required
    {'rafamadriz/friendly-snippets'}, -- Optional
  }
}

use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons', -- optional, for file icons
  },
}

use { "christoomey/vim-tmux-navigator" }

use { "szw/vim-maximizer" }

use { "numToStr/Comment.nvim"}

use {"nvim-lua/plenary.nvim"}

use {"nvim-lualine/lualine.nvim"}

use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
        require("lspsaga").setup({})
    end,
    requires = { {"nvim-tree/nvim-web-devicons"} }
})
use {"onsails/lspkind.nvim"}

use {"jose-elias-alvarez/null-ls.nvim"}
use {"jay-babu/mason-null-ls.nvim"}

use {"folke/neodev.nvim"}

use {"windwp/nvim-autopairs"}

use {"JoosepAlviste/nvim-ts-context-commentstring"}

use {'lewis6991/gitsigns.nvim'}

use {
  "folke/which-key.nvim",
  config = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
    require("which-key").setup {
    }
  end
}

use {'akinsho/bufferline.nvim', tag = "v3.*", requires = 'nvim-tree/nvim-web-devicons'}

use {'mfussenegger/nvim-dap'}

use {'rcarriga/nvim-dap-ui'}

use {
    'goolord/alpha-nvim',
    requires = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
        require'alpha'.setup(require'alpha.themes.startify'.config)
    end
}

use {"b0o/schemastore.nvim"}

use {"rrethy/vim-illuminate"}

use {"lukas-reineke/indent-blankline.nvim"}

end)
