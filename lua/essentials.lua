vim.g.mapleader = " "
vim.g.maplocalleader='\\'
-- Netrw gx映射
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 0
-- 检查是否支持 clipboard
if vim.fn.has('clipboard') then
    -- 检查是否支持 + 寄存器
    if vim.fn.has('unnamedplus') then
        -- 当支持 + 寄存器时，同时启用 * 和 + 寄存器
        vim.opt.clipboard:append({ 'unnamed', 'unnamedplus' })
    else
        -- 在 macOS 和 Windows 上，使用 * 寄存器
        vim.opt.clipboard:append('unnamed')
    end
end
vim.g.fileencodings = { "UCS-bom", "utf-8", "gb18030", "gbk", "latin1" }
vim.o.encoding = "utf-8"
vim.bo.fileencoding = "utf-8"
-- https://neovide.dev/configuration.html
-- 检查是否存在 g:neovide 变量
if vim.g.neovide then
    -- 在 macOS 上将 Alt 键映射为 Meta 键
    vim.g.neovide_input_macos_alt_is_meta = true
    -- 设置光标拖尾效果
    vim.g.neovide_cursor_vfx_mode = "railgun"
    -- 如果需要设置光标拖尾大小，可以取消下一行的注释并设置合适的值
    vim.g.neovide_cursor_trail_size = 0.1
end
vim.o.shell = "zsh"
vim.o.background = "dark"
vim.o.termguicolors = true
vim.o.timeout = true
vim.o.timeoutlen = 300
vim.o.exrc = true
vim.o.autoread = true
vim.o.swapfile = false
vim.o.backup = false
-- 禁用模式显示（Insert、Visual 模式等）
vim.o.showmode = false
vim.o.tabstop = 4        -- 制表符宽度
vim.o.shiftwidth = 4     -- 缩进宽度
vim.o.expandtab = true   -- 制表符转为空格
vim.o.shiftround = true  -- 缩进为倍数
vim.o.autoindent = true  -- 启用自动缩进
vim.o.smartindent = true -- 启用智能缩进
vim.o.number = true      -- 显示行号
-- vim.o.relativenumber = true -- 显示相对行号
-- 插入模式下显示绝对行号
vim.cmd([[
  augroup numbertoggle
    autocmd!
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu   | endif
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * if &nu                  | set nornu | endif
  augroup END
]])
vim.o.wildmenu = true                                         -- 命令行菜单
vim.o.ignorecase = true                                       -- 搜索不区分大小写
vim.o.smartcase = true                                        -- 搜索智能区分大小写
vim.o.signcolumn = "yes"                                      -- 显示签名列
vim.o.undofile = true                                         -- 启用撤销历史记录
vim.o.undodir = vim.fn.expand('$HOME/.local/share/nvim/undo') -- 撤销文件保存路径

-- https://neovim.io/doc/user/lua.html#lua
vim.o.mouse = "a"
-- 高亮所在行
vim.wo.cursorline = true
vim.opt.completeopt = { "menuone", "noselect" }
vim.opt.splitright = true
-- vim.o.guifont = "Hack Nerd Font Mono:h16"
vim.opt.guifont = { "Hack Nerd Font Mono", ":h16" }



vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<cr>", { silent = true, desc = "Buffer next" })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<cr>", { desc = "Buffer delete" })

vim.keymap.set({"n","v"}, "<leader>a|", "<cmd>Tabularize /|<CR>")
vim.keymap.set({"n","v"}, "<leader>a=", "<cmd>Tabularize /^[^=]*\\zs=<CR>")
vim.keymap.set({"n","v"}, "<leader>a:", "<cmd>Tabularize /:<CR>")
vim.keymap.set({"n","v"}, "<leader>a,", "<cmd>Tabularize /,\\zs/l0r1<CR>")
-- command 命令影响记录以分割窗显示
vim.o.inccommand = "split"
