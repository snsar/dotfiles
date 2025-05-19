return {
    {
        "catppuccin/nvim",
        lazy = false,
        priority = 1000,
        config = function()
            vim.cmd("colorscheme catppuccin")
        end
    },

    { "nvim-lualine/lualine.nvim", opts = { options = { theme = "tokyonight" } } },

    { "akinsho/bufferline.nvim",   dependencies = "nvim-tree/nvim-web-devicons", opts = {} },

    {
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            "rcarriga/nvim-notify",
        },
        config = true
    },

    { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {} },

    {
        "goolord/alpha-nvim",
        config = function()
            require("alpha").setup(require("alpha.themes.dashboard").config)
        end
    },
}
