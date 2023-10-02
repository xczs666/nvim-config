vim.loader.enable()
vim.o.shell = "zsh"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.exrc = true

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
        colorscheme = {"onedark"}
    }
})


-- https://neovim.io/doc/user/lua.html#lua
vim.o.mouse = "a"
-- 高亮所在行
vim.wo.cursorline = true
vim.opt.wildmenu = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.autoread = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.splitright = true
vim.b.fileencoding = "utf-8"
vim.g.mapleader = " "

require("essentials")
