return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "nvim-tree/nvim-web-devicons",
            "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            vim.cmd[[colorscheme tokyonight-storm]]
            require('lualine').setup({
                options = {
                    theme = 'tokyonight'
                },
            })
            require('barbecue').setup {
                theme = 'tokyonight',
            }
        end
    },
}

-- return {
--     "joshdick/onedark.vim",
--     lazy = false,
--     priority = 1000,
--     opts = {},
--     config = function()
--         vim.cmd [[colorscheme onedark]]
--     end
-- }


-- return {
--     'navarasu/onedark.nvim',
--     config = function()
--         require('onedark').setup {
--             -- style = 'darker'
--             style = 'dark'
--         }
--         require('onedark').load()
--     end,
--     opts = {
--     },
-- }
