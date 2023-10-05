return {
    "hrsh7th/nvim-cmp",
    dependencies = {
        "hrsh7th/cmp-path",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-cmdline",
        {
            "saadparwaiz1/cmp_luasnip",
            dependencies = {
                "L3MON4D3/LuaSnip",
                dependencies = {
                    "rafamadriz/friendly-snippets",
                },
                opts = { history = true, updateevents = "TextChanged,TextChangedI" },
                config = function(_, opts)
                    require("luasnip").config.set_config(opts)

                    -- vscode format
                    require("luasnip.loaders.from_vscode").lazy_load()
                    require("luasnip.loaders.from_vscode").lazy_load { paths = vim.g.vscode_snippets_path or "" }

                    -- snipmate format
                    require("luasnip.loaders.from_snipmate").load()
                    require("luasnip.loaders.from_snipmate").lazy_load { paths = vim.g.snipmate_snippets_path or "" }

                    -- lua format
                    require("luasnip.loaders.from_lua").load()
                    require("luasnip.loaders.from_lua").lazy_load { paths = vim.g.lua_snippets_path or "" }

                    vim.api.nvim_create_autocmd("InsertLeave", {
                        callback = function()
                            if
                                require("luasnip").session.current_nodes[vim.api.nvim_get_current_buf()]
                                and not require("luasnip").session.jump_active
                            then
                                require("luasnip").unlink_current()
                            end
                        end,
                    })
                end,
            },
        },
        -- autopairing of (){}[] etc
        {
            "windwp/nvim-autopairs",
            opts = {
                fast_wrap = {},
                disable_filetype = { "TelescopePrompt", "vim" },
            },
            config = function(_, opts)
                require("nvim-autopairs").setup(opts)

                -- setup cmp for autopairs
                local cmp_autopairs = require "nvim-autopairs.completion.cmp"
                require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
            end,
        },

    },
    event = "InsertEnter",
    config = function()
        local has_words_before = function()
            unpack = unpack or table.unpack
            local line, col = unpack(vim.api.nvim_win_get_cursor(0))
            return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
        end
        require("luasnip.loaders.from_vscode").lazy_load()
        local luasnip = require("luasnip")
        local cmp = require('cmp')
        cmp.setup({
            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
                end,
            },
            sources = cmp.config.sources {
                { name = 'nvim_lsp' },
                { name = 'path' },
                { name = 'luasnip' },
                { name = "buffer" },
            },
            mapping = cmp.mapping.preset.insert {
                ["<Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                        -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                        -- they way you will only jump inside the snippet region
                    elseif luasnip.expand_or_jumpable() then
                        luasnip.expand_or_jump()
                    elseif has_words_before() then
                        cmp.complete()
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ["<S-Tab>"] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { "i", "s" }),

                ['<C-b>'] = cmp.mapping.scroll_docs(-4),
                ['<C-f>'] = cmp.mapping.scroll_docs(4),
                -- ['<C-Space>'] = cmp.mapping.complete(),
                ['<C-e>'] = cmp.mapping.abort(),
                ['<CR>'] = cmp.mapping.confirm({
                    behavior = cmp.ConfirmBehavior.Insert,
                    select = false
                }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
            },
            experimental = {
                ghost_text = true,
            }
        })

        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
                { name = 'buffer' },
            }
        })

        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            sources = cmp.config.sources({
                { name = 'path' }
            }, {
                { name = 'cmdline' }
            })
        })
    end,
}
