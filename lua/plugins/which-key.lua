return {
    'folke/which-key.nvim',
    event = "VeryLazy",
    init = function()
        vim.o.timeout = true
        vim.o.timeoutlen = 300
    end,
    config = function()
        local wk = require("which-key")
        wk.register({
            -- ["<leader>"] = {
            --     f = {
            --         name = "+file",
            --         f = { "<cmd>Telescope find_files<cr>", "Find File" },
            --         r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
            --         n = { "<cmd>enew<cr>", "New File" },
            --     },
            -- },
            ["<leader>f"] = {
                name = "+file",                                                             -- optional group name
                f = { "<cmd>Telescope find_files<cr>", "Find File" },                       -- create a binding with label
                r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false }, -- additional options for creating the keymap
                i = { "<cmd>Telescope git_files<cr>", "Git File", noremap = false },        -- additional options for creating the keymap
                e = { "Format File" },                                                      -- same as above
                g = { "<cmd>Telescope live_string<cr>", "Grep File" },
                l = { "<cmd>Telescope command_history<cr>", "Command History" },
                b = { "<cmd>Telescope buffers<cr>", "Buffers" },
                j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
                w = { "Browser File" },
                h = { "<cmd>Telescope help_tags<cr>", "Help File" },
                -- ["1"] = "which_key_ignore", -- special label to hide it in the popup
                -- b = { function() print("bar") end, "Foobar" }                               -- you can also pass functions!
            },
        })
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- key_labels = {["<space>"] = "SPC"}
    }
};
