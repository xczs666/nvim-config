return {
    'williamboman/nvim-lsp-installer',
    -- event = "VeryLazy",
    config = function()
        require("nvim-lsp-installer").setup{}
    end,
    opts = {
        -- add any options here
    },
}
