return {
    "joshdick/onedark.vim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function()
        vim.cmd [[colorscheme onedark]]
    end
}


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
