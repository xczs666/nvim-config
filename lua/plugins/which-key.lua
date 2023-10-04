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
                c = { "<cmd>Telescope command_history<cr>", "Command History" },
                b = { "<cmd>Telescope buffers<cr>", "Buffers" },
                j = { "<cmd>Telescope jumplist<cr>", "Jump List" },
                w = { "<cmd>Telescope file_browser<cr>", "Browser File" },
                p = { "<cmd>Telescope help_tags<cr>", "Help File" },
                -- ["1"] = "which_key_ignore", -- special label to hide it in the popup
                -- b = { function() print("bar") end, "Foobar" }                               -- you can also pass functions!
            },
            ["<leader>sl"] = { "<cmd>sessionManager load_session<cr>", "Session List" },
            ["cr"] = {
                name = "+coercion",
                m = { "[M]ixeCase", noremap = true },
                c = { "[c]amelCase", noremap = true },
                s = { "[s]nake_case", noremap = true },
                u = { "[U]PPER_CASE", noremap = true },
                t = { "[T]itle Case", noremap = true },
                ["-"] = { "dash[-]case", noremap = true },
                ["."] = { "dot[.]case", noremap = true },
                [" "] = { "space[ ]case", noremap = true },
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
