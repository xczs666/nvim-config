return {
    'neovim/nvim-lspconfig',
    dependencies = { "folke/neoconf.nvim", 'folke/neodev.nvim', { "j-hui/fidget.nvim", tag = "legacy", } },
    config = function()
        require("neoconf").setup()
        require("neodev").setup()
        require("fidget").setup()
        -- Setup language servers.
        -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
        -- local lspconfig = require('lspconfig')
        -- lspconfig.pyright.setup {}
        -- lspconfig.tsserver.setup {}
        -- lspconfig.bashls.setup {}
        -- lspconfig.lua_ls.setup ({
        --     settings = {
        --         Lua = {
        --             diagnostics = {
        --                 globals = { "vim" }
        --             }
        --         }
        --     }
        -- })
        -- lspconfig.sqls.setup ({})
        -- -- lspconfig.sqlls.setup ({})
        -- lspconfig.rust_analyzer.setup {
        --     -- Server-specific settings. See `:help lspconfig-setup`
        --     settings = {
        --         ['rust-analyzer'] = {},
        --     },
        -- }


        -- Global mappings.
        -- See `:help vim.diagnostic.*` for documentation on any of the below functions
        -- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float)
        vim.keymap.set('n', '[e', vim.diagnostic.goto_prev, { desc = "Goto prev [E]rror" })
        vim.keymap.set('n', ']e', vim.diagnostic.goto_next, { desc = "Goto next [E]rror" })
        vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = "Set local error list" })

        -- Use LspAttach autocommand to only map the following keys
        -- after the language server attaches to the current buffer
        vim.api.nvim_create_autocmd('LspAttach', {
            group = vim.api.nvim_create_augroup('UserLspConfig', {}),
            callback = function(ev)
                -- Enable completion triggered by <c-x><c-o>
                vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

                -- Buffer local mappings.
                -- See `:help vim.lsp.*` for documentation on any of the below functions
                local local_opts = { buffer = ev.buf, desc = nil }
                local_opts.desc = "Declaration"
                vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, local_opts)
                local_opts.desc = "Definition"
                vim.keymap.set('n', 'gd', vim.lsp.buf.definition, local_opts)
                local_opts.desc = "Hover"
                vim.keymap.set('n', 'K', vim.lsp.buf.hover, local_opts)
                local_opts.desc = "Implementation"
                vim.keymap.set('n', 'gI', vim.lsp.buf.implementation, local_opts)
                local_opts.desc = "Signature"
                vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, local_opts)
                local_opts.desc = "Add Workdspace Folder"
                vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, local_opts)
                local_opts.desc = "Remove Workdspace Folder"
                vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, local_opts)
                local_opts.desc = "List Workdspace Folders"
                vim.keymap.set('n', '<leader>wl', function()
                    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
                end, local_opts)
                local_opts.desc = "Type Definition"
                vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, local_opts)
                local_opts.desc = "Rename"
                vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, local_opts)
                local_opts.desc = "Code Action"
                vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, local_opts)
                -- vim.keymap.set('n', 'gr', vim.lsp.buf.references, { buffer = ev.buf, desc = "References" })
                local_opts.desc = "Format"
                vim.keymap.set('n', '<leader>fe', function() vim.lsp.buf.format { async = true } end, local_opts)
            end,
        })
    end,
    opts = {
        -- add any options here
    },
}
