return {
    {
        "rhysd/accelerated-jk",
        config = function()
            vim.keymap.set("n", "j", "<Plug>(accelerated_jk_gj)")
            vim.keymap.set("n", "k", "<Plug>(accelerated_jk_gk)")
        end,
    },
    {
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "echasnovski/mini.ai",
        config = true,
    },
    {
        "echasnovski/mini.comment",
        version = false,
        config = true,
    }

}