return {
    "mfussenegger/nvim-jdtls",
    ft = "java",
    enabled = not vim.g.vscode,
    dependencies = {
        "williamboman/mason.nvim",
    },
}
