return require("packer").startup(function(use)
    -- Packer can manage itself
    use("wbthomason/packer.nvim")

    -- treesitter
    use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })

    -- telescope
    use("nvim-lua/popup.nvim")
    use("nvim-lua/plenary.nvim")
    use({ "nvim-telescope/telescope.nvim", requires = { { "nvim-lua/plenary.nvim" } } })
    use({ "nvim-telescope/telescope-fzf-native.nvim", run = "make" })
    use({
        "sudormrfbin/cheatsheet.nvim",
        requires = { { "nvim-telescope/telescope.nvim" }, { "nvim-lua/popup.nvim" }, { "nvim-lua/plenary.nvim" } },
    })

    -- barbar tabline
    use({ "romgrk/barbar.nvim", requires = "kyazdani42/nvim-web-devicons" })

    -- lualine
    use({ "nvim-lualine/lualine.nvim", requires = "kyazdani42/nvim-web-devicons" })

    -- SmiteshP/nvim-gps
    use({ "SmiteshP/nvim-gps", requires = "nvim-treesitter/nvim-treesitter" })

    -- numb.nvim
    use("nacro90/numb.nvim")

    -- nvim-coloizer
    use("norcalli/nvim-colorizer.lua")

    -- onedarkpro
    use("olimorris/onedarkpro.nvim")

    -- vim-fswitch
    use("derekwyatt/vim-fswitch")

    -- nerdcommenter
    use("scrooloose/nerdcommenter")

    -- wildfire
    use("gcmt/wildfire.vim")

    -- hlslens
    use("kevinhwang91/nvim-hlslens")

    -- search-pulse
    use("inside/vim-search-pulse")

    -- rainbow
    use("p00f/nvim-ts-rainbow")

    -- quickscope
    use("unblevable/quick-scope")

    -- comfortable-motion
    use("yuttie/comfortable-motion.vim")

    -- auto-pairs-gentle
    use("vim-scripts/auto-pairs-gentle")

    -- vim-floaterm
    use("voldikss/vim-floaterm")

    -- nvim-miniyank
    use("bfredl/nvim-miniyank")

    -- vim-translator
    use("voldikss/vim-translator")

    -- format, 不再往后更新, 作者发布2.0 breaking change
    use({ "lukas-reineke/format.nvim", commit = "29a7dccbdee6d657380104958b4b8e81d316803d" })

    -- any-jump
    use("pechorin/any-jump.vim")

    -- preview-markdown
    use({ "skanehira/preview-markdown.vim", ft = { "markdown" } })

    -- gitsigns
    use({ "lewis6991/gitsigns.nvim", requires = "nvim-lua/plenary.nvim" })

    -- vim-fugitive
    use("tpope/vim-fugitive")

    -- lspconfig
    use("neovim/nvim-lspconfig")
    use("williamboman/nvim-lsp-installer")

    -- nvim-cmp
    use("hrsh7th/cmp-nvim-lsp")
    use("hrsh7th/cmp-buffer")
    use("hrsh7th/cmp-path")
    use("hrsh7th/cmp-cmdline")
    use({ "hrsh7th/nvim-cmp", requires = "onsails/lspkind-nvim" })
    use("hrsh7th/cmp-vsnip")
    use("hrsh7th/cmp-nvim-lua")

    -- vsnip
    use("hrsh7th/vim-vsnip")
    use("rafamadriz/friendly-snippets")

    -- trouble
    use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

    -- lsp_signature
    use("ray-x/lsp_signature.nvim")

    -- nvim-lastplace
    use("ethanholz/nvim-lastplace")

    -- neogen
    use({ "danymat/neogen", requires = "nvim-treesitter/nvim-treesitter" })

    -- code-action-menu
    use({ "weilbith/nvim-code-action-menu", cmd = "CodeActionMenu" })

    -- lightbulb
    use({ "kosayoda/nvim-lightbulb" })

    -- lsp-progress
    use({ "j-hui/fidget.nvim" })
end)
