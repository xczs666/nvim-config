return {
    'neovim/nvim-lspconfig',
    -- event = "VeryLazy",
    config = function()
        require'lspconfig'.pyright.setup{}
    end,
    opts = {
        -- add any options here
    },
}
