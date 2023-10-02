return {
    -- "vim-airline/vim-airline",
    "nvim-lualine/lualine.nvim",
    dependencies = {
        { "utilyre/barbecue.nvim", dependencies = { "SmiteshP/nvim-navic" } }
    },
    config = function()
        require('barbecue').setup({
            theme = 'onedark'
        })
        require("lualine").setup({
            options = {
                theme = 'onedark'
            },
        })
    end
}
