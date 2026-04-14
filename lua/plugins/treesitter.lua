return {
    {
        'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        dependencies = {
            { "nvim-treesitter/nvim-treesitter-textobjects", branch = "main" },
        },
        build = ":TSUpdate",
        main = 'nvim-treesitter',
        opts = {},
        init = function()
            local max_filesize = 10 * 1024 * 1024 -- 10 MB

            vim.api.nvim_create_autocmd('FileType', {
                callback = function()
                    local buf = vim.api.nvim_get_current_buf()
                    local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(buf))
                    if ok and stats and stats.size > max_filesize then
                        return
                    end
                    pcall(vim.treesitter.start)
                    vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                end,
            })

            local ensured = {
                'bash', 'c', 'cmake', 'cpp', 'css', 'dockerfile', 'go',
                'html', 'java', 'javascript', 'json', 'lua', 'make',
                'markdown', 'markdown_inline', 'python', 'query', 'regex',
                'rst', 'ruby', 'rust', 'sql', 'toml', 'tsx', 'typescript',
                'vim', 'vimdoc', 'xml', 'yaml',
            }
            vim.defer_fn(function()
                local installed = require('nvim-treesitter.config').get_installed()
                local to_install = vim.iter(ensured)
                    :filter(function(p) return not vim.tbl_contains(installed, p) end)
                    :totable()
                if #to_install > 0 then
                    require('nvim-treesitter').install(to_install)
                end
            end, 100)
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter-textobjects',
        branch = 'main',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        config = function()
            require('nvim-treesitter-textobjects').setup {
                select = {
                    lookahead = true,
                    keymaps = {
                        ["af"] = "@function.outer",
                        ["if"] = "@function.inner",
                        ["ac"] = "@class.outer",
                        ["ic"] = { query = "@class.inner", desc = "Select inner part of a class region" },
                        ["as"] = { query = "@scope", query_group = "locals", desc = "Select language scope" },
                    },
                    selection_modes = {
                        ['@class.outer'] = '<c-v>',
                    },
                    include_surrounding_whitespace = false,
                },
                swap = {
                    swap_previous = {
                        ["<leader>A"] = "@parameter.inner",
                    },
                },
                move = {
                    set_jumps = true,
                    goto_next_start = {
                        ["]m"] = "@function.outer",
                        ["]]"] = { query = "@class.outer", desc = "Next class start" },
                        ["]o"] = "@loop.*",
                        ["]s"] = { query = "@scope", query_group = "locals", desc = "Next scope" },
                        ["]z"] = { query = "@fold", query_group = "folds", desc = "Next fold" },
                    },
                    goto_next_end = {
                        ["]M"] = "@function.outer",
                        ["]["] = "@class.outer",
                    },
                    goto_previous_start = {
                        ["[m"] = "@function.outer",
                        ["[["] = "@class.outer",
                    },
                    goto_previous_end = {
                        ["[M"] = "@function.outer",
                        ["[]"] = "@class.outer",
                    },
                    goto_next = {
                        ["]d"] = "@conditional.outer",
                    },
                    goto_previous = {
                        ["[d"] = "@conditional.outer",
                    },
                },
            }

        end,
    },
}
