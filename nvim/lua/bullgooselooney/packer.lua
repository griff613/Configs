-------------------------------------------------------------------------------
-- When you add a new plugin you have to do `:so` before running `:PackerSync'
--
-- The 'use' statements tell packer to download and manage these dependencies
-------------------------------------------------------------------------------

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)

	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Theme
	use ({ 
		'ellisonleao/gruvbox.nvim',
		as = 'gruvbox',
		config = function()
			vim.cmd('colorscheme gruvbox')
		end
	})

	-- Telescope
	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.6',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	-- you can translate `Plug` (another package manager)statements like this
	-- Old: Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
	use ( 'nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
	use ( 'mbbill/undotree' )
	use ( 'tpope/vim-fugitive' )
    use ( 'theprimeagen/harpoon')
    use ( 'airblade/vim-gitgutter' )

    -- Cool welcome screen
    use {
        'goolord/alpha-nvim',
        config = function ()
            require'alpha'.setup(require'alpha.themes.dashboard'.config)
        end
    }

    -- lua line
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

	-- LSP
	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},
			{'neovim/nvim-lspconfig'},
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'L3MON4D3/LuaSnip'},
		}
	}

    -- Comment with gcc
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require("nvim-autopairs").setup {}
        end
    }

end)
