return {
    'williamboman/mason-lspconfig.nvim',
    dependencies = { 'williamboman/mason.nvim', },
    enabled = not vim.g.vscode,
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup {
            ensure_installed = { "jdtls",
                "pyright", "lua_ls", "rust_analyzer", "clangd",
                "bashls", "cmake", "marksman", "sqlls" },
            automatic_enable = {
                exclude = { "jdtls" },
            },
        }
    end,
}
