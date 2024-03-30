return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = { "jdtls", "java_language_server",
                "pyright", "lua_ls", "rust_analyzer", "clangd",
                "bashls", "cmake", "marksman", "sqlls" },
        }
        local lspconfig = require('lspconfig')

        require("mason-lspconfig").setup_handlers({
            function(server_name)
                require("lspconfig")[server_name].setup {}
            end,
            -- Next, you can provide targeted overrides for specific servers.
            -- ["lua_ls"] = function ()
            --     lspconfig.lua_ls.setup {
            --         settings = {
            --             Lua = {
            --                 diagnostics = {
            --                     globals = { "vim" }
            --                 }
            --             }
            --         }
            --     }
            -- end,
            ["clangd"] = function()
                lspconfig.clangd.setup {
                    cmd = {
                        "clangd",
                        "--header-insertion=never",
                        "--query-driver=/opt/homebrew/opt/llvm/bin/clang",
                        "--all-scopes-completion",
                        "--completion-style=detailed",
                    }
                }
            end
        })
    end,
}
