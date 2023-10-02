return {
    {
        "akinsho/bufferline.nvim",
        config = true,
    },
    {
        -- 'nathanaelkane/vim-indent-guides',
        "lukas-reineke/indent-blankline.nvim",
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
