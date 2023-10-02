return {
    {
        "akinsho/bufferline.nvim",
        event = "VeryLazy",
        config = true,
    },
    {
        -- 'nathanaelkane/vim-indent-guides',
        "lukas-reineke/indent-blankline.nvim",
        event = "VeryLazy",
        main = "ibl",
        opts = {},
        config = true,
    },
    {
        "goolord/alpha-nvim",
        config = function()
            --require('alpha').setup(require('alpha.themes.startify').config)
            require('alpha').setup(require('alpha.themes.dashboard').config)
        end
    },
    {
        -- "RRethy/vim-illuminate",
        -- config = function()
        --     require('illuminate').configure()
        -- end
    },
}
