vim.loader.enable()

require("essentials")

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- vim.fn.input("lazypath: " .. lazypath)
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup("plugins", {
    install = {
        missing = true,
        colorscheme = {"tokyonight-storm"}
    }
})

