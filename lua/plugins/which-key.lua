return {
    'folke/which-key.nvim',
    event = "VeryLazy",
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
                name = "+file",                                                              -- optional group name
                f = { "<cmd>Telescope find_files<cr>", "Find File" },                        -- create a binding with label
                h = { "<cmd>Telescope oldfiles<cr>", "Open Recent File", noremap = false },  -- additional options for creating the keymap
                r = { "<cmd>Telescope frecency<cr>", "Frecency/MRU File", noremap = false }, -- additional options for creating the keymap
                i = { "<cmd>Telescope git_files<cr>", "Git File", noremap = false },         -- additional options for creating the keymap
                g = { "<cmd>Telescope live_grep<cr>", "Grep File" },
                m = { "<cmd>Telescope marks<cr>", "Jump bookmarks" },
                e = { "Format File" }, -- same as above
                l = { "<cmd>Telescope command_history<cr>", "Command History" },
                b = { "<cmd>Telescope buffers<cr>", "Buffers" },
                j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
                w = { "<cmd>Telescope file_browser<cr>", "Browser File" },
                p = { "<cmd>Telescope help_tags<cr>", "Help File" },
                -- ["1"] = "which_key_ignore", -- special label to hide it in the popup
                -- b = { function() print("bar") end, "Foobar" }                               -- you can also pass functions!
            },
            ["<leader>sl"] = { "<cmd>SessionManager load_session<cr>", "Session List" },
            ["]c"] = "Git next_hunk",
            ["[c"] = "Git prev_hunk",
        })
    end,
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        -- key_labels = {["<space>"] = "SPC"}
    }
};
