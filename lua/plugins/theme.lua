return {
    {
        "folke/tokyonight.nvim",
        dependencies = {
            "nvim-lualine/lualine.nvim",
            "meuter/lualine-so-fancy.nvim",
            "nvim-tree/nvim-web-devicons",
            -- 基于LSP显示光标所在代码层级
            -- "utilyre/barbecue.nvim",
            "SmiteshP/nvim-navic",
        },
        config = function()
            vim.cmd [[colorscheme tokyonight-storm]]
            require('lualine').setup({
                options = {
                    theme = 'tokyonight',
                    -- theme = "seoul256",
                    component_separators = { left = "|", right = "|" },
                    section_separators = { left = "", right = "" },
                    globalstatus = true,
                    refresh = {
                        statusline = 100,
                    },
                },
                sections = {
                    lualine_a = {
                        { "fancy_mode", width = 3 }
                    },
                    lualine_b = {
                        { "fancy_branch" },
                        { "fancy_diff" },
                    },
                    lualine_c = {
                        { "fancy_cwd", substitute_home = true }
                    },
                    lualine_x = {
                        { "fancy_macro" },
                        { "fancy_diagnostics" },
                        { "fancy_searchcount" },
                        { "fancy_location" },
                    },
                    lualine_y = {
                        { "fancy_filetype", ts_icon = "" },
                    },
                    lualine_z = {
                        { 'fileformat' },
                        { "fancy_lsp_servers" },
                    },
                }
            })
            -- require('barbecue').setup {
            --     theme = 'tokyonight',
            -- }
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
