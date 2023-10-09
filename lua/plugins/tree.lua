return {
    'nvim-tree/nvim-tree.lua',
    cmd = { "NvimTreeToggle" },
    keys = {
        { "<leader>e", "<cmd>NvimTreeToggle<cr>", desc = "Open the neo-tree", mode = { "n" } },
    },
    config = true
}
