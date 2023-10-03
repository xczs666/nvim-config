return {
    "folke/flash.nvim",
    ---@type Flash.Config
    opts = {
        search = {
            -- * exact: exact match
            -- * search: regular search
            -- * fuzzy: fuzzy search
            -- * fun(str): custom function that returns a pattern
            --   For example, to only match at the beginning of a word:
            --   mode = function(str)
            --     return "\\<" .. str
            --   end,
            node = "fuzzy"
        },
        jump = {
            -- automatically jump when there is only one match
            autojump = true,
        },
        label = {
            uppercase = false,
        },
        modes = {
            search = {
                -- when `true`, flash will be activated during regular search by default.
                -- You can always toggle when searching with `require("flash").toggle()`
                enabled = false,
            },
            char = {
                enabled = false,
                multi_line = false,
                autohide = false
            }
        },
    },

    -- stylua: ignore
    keys = {
        { "<c-s>", mode = { "n", "o", "x" }, function() require("flash").jump() end,              desc = "Flash" },
        { "S",     mode = { "n", "o", "x" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        -- { "o",     mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",     mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>", mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        {
            "<leader>jl",
            mode = { "n", "o", "x" },
            function()
                require("flash").jump({
                    search = { mode = "search", max_length = 0 },
                    label = { uppercase = true, after = { 0, 0 } },
                    pattern = "^[ \t]*",
                    jump = { pos = "end" },
                })
            end,
            desc = "[J]ump [L]ine"
        },
        {
            "<leader>jw",
            mode = { "n", "o", "x" },
            function()
                require("flash").jump({
                    pattern = ".", -- initialize pattern with any char
                    search = {
                        mode = function(pattern)
                            -- remove leading dot
                            if pattern:sub(1, 1) == "." then
                                pattern = pattern:sub(2)
                            end
                            -- return word pattern and proper skip pattern
                            return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                        end,
                    },
                    jump = {
                        ---@type "start" | "end" | "range"
                        pos = "start"
                    },
                })
            end,
            desc = "[J]ump [W]ord"
        },
        {
            "<leader>jW",
            mode = { "n", "o" },
            function()
                require("flash").jump({
                    pattern = ".", -- initialize pattern with any char
                    search = {
                        mode = function(pattern)
                            -- remove leading dot
                            if pattern:sub(1, 1) == "." then
                                pattern = pattern:sub(2)
                            end
                            -- return word pattern and proper skip pattern
                            return ([[\<%s\w*\>]]):format(pattern), ([[\<%s]]):format(pattern)
                        end,
                    },
                    jump = {
                        ---@type "start" | "end" | "range"
                        pos = "range"
                    },
                })
            end,
            desc = "[J]ump [W]ord and select"
        },
    },
}
