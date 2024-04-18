return {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
        -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
        "MunifTanjim/nui.nvim",
        -- OPTIONAL:
        --   `nvim-notify` is only needed, if you want to use the notification view.
        --   If not available, we use `mini` as the fallback
        {
            "rcarriga/nvim-notify",
            -- lazy = true,
            -- event = "VeryLazy",
            main = "notify",
            opts = {
                -- :h notify.setup()
                -- "fade", "slide", "fade_in_slide_out", "static"
                stages = "slide",
                on_open = nil,
                on_close = nil,
                timeout = 1000,
                -- fps = 1,
                render = "default",
                background_colour = "Normal",
                max_width = math.floor(vim.api.nvim_win_get_width(0) / 3),
                max_height = math.floor(vim.api.nvim_win_get_height(0) / 4),
                -- minimum_width = 50,
                -- ERROR > WARN > INFO > DEBUG > TRACE
                level = "INFO",
            },
        },
    },
    config = function()
        require("noice").setup({
            cmdline = {
                format = {
                    search_down = { kind = "search", pattern = "^/", icon = "🔎 ", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = "🔍 ", lang = "regex" },
                },
            },
            messages = {
                -- NOTE: If you enable messages, then the cmdline is enabled automatically.
                -- This is a current Neovim limitation.
                enabled = false, -- enables the Noice messages UI
            },
            views = {
                notify = {
                    -- 信息提示不会重复出现而是覆盖
                    replace = true
                }
            },
            lsp = {
                -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                override = {
                    ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                    ["vim.lsp.util.stylize_markdown"] = true,
                    ["cmp.entry.get_documentation"] = true,
                },
            },
            -- you can enable a preset for easier configuration
            presets = {
                bottom_search = false,       -- use a classic bottom cmdline for search
                command_palette = true,     -- position the cmdline and popupmenu together
                long_message_to_split = true, -- long messages will be sent to a split
                inc_rename = false,         -- enables an input dialog for inc-rename.nvim
                lsp_doc_border = false,     -- add a border to hover docs and signature help
            },
        })
    end
}
