vim.g.mapleader = " "
vim.g.maplocalleader = '\\'
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
    -- vim.g.neovide_input_macos_alt_is_meta = true
    -- Possible values are `both`, `only_left`, `only_right`, `none`. Set to `none` by default.
    -- see https://neovide.dev/configuration.html
    vim.g.neovide_input_macos_option_key_is_meta = 'both'
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
vim.o.softtabstop = 4    -- Let backspace delete indent
vim.o.expandtab = true   -- 制表符转为空格
vim.o.shiftround = true  -- 缩进为倍数
vim.o.autoindent = true  -- 启用自动缩进
vim.o.smartindent = true -- 启用智能缩进
vim.o.number = true      -- 显示行号
vim.g.joinspaces = false -- false: Vim 在执行操作时将会保留单词之间的空格，不进行合并
vim.o.conceallevel = 2
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

vim.g.lazyredraw = true -- 优化宏,替换等批量动作


-- vim.keymap.set('i', '<D-v>', '<C-r><C-o>+')                                     -- paste (insert)
-- vim.keymap.set('n', '<D-v>', 'i<C-r><C-o>+<ESC>l')                              -- paste (normal)
-- vim.keymap.set('x', '<D-v>', '"+P')                                             -- paste (visual)
-- vim.keymap.set('c', '<D-v>', '<C-r>+')                                          -- paste (command)

vim.keymap.set("n", "<A-Tab>", "<cmd>bNext<cr>", { silent = true, desc = "Buffer next" })
vim.keymap.set("n", "<leader>bc", "<cmd>bd<cr>", { desc = "Buffer delete" })
vim.keymap.set("n", "<F3>", "<cmd>bnext<cr>", { silent = true, desc = "Buffer next" })
vim.keymap.set("n", "<F2>", "<cmd>bprevious<cr>", { silent = true, desc = "Buffer previous" })
vim.keymap.set("n", "<F1>", "<cmd>Telescope buffers<cr>", { silent = true, desc = "Buffers" })
vim.keymap.set("n", "<leader>ce", "<cmd>let @/=\"\"<cr>", { silent = true, desc = "[C]lean s[e]arch" })
vim.keymap.set('v', '<leader>|', [[:lua MoveVisualCursor()<CR>]], { noremap = true, silent = true })
vim.keymap.set('n', '<D-CR>', "o<ESC>", { noremap = true, silent = true })


vim.keymap.set({ "n", "v" }, "<leader>a|", "<cmd>Tabularize /|<CR>")
vim.keymap.set({ "n", "v" }, "<leader>a=", "<cmd>Tabularize /^[^=]*\\zs=<CR>")
vim.keymap.set({ "n", "v" }, "<leader>a:", "<cmd>Tabularize /:<CR>")
vim.keymap.set({ "n", "v" }, "<leader>a,", "<cmd>Tabularize /,\\zs/l0r1<CR>")

-- tmux不支持<C-;>
vim.keymap.set({ "n", "v" }, "<C-;>", ":", { noremap = true })
-- command 命令影响记录以分割窗显示
-- vim.o.inccommand = "split"

-- 设置键盘映射以触发 increase_height 函数
-- vim.api.nvim_set_keymap('n', '<C-+>', "<cmd>resize +" .. vim.fn.v:count1, { noremap = true, silent = true })

-- vim.keymap.set('n', "<C-+>", "<cmd>resize +" .. vim.v.count1 .. '<cr>', { noremap = true, expr = true })

vim.cmd [[nnoremap <expr> <C-+> ':resize +' . v:count1 . '<CR>']]
vim.cmd [[nnoremap <expr> <C-_> ':resize -' . v:count1 . '<CR>']]


function MoveVisualCursor()
    local start_line = vim.fn.line("'<")
    local start_col = vim.fn.col("'<")
    local end_line = vim.fn.line("'>")
    -- local end_col = vim.fn.col("'>")
    local current_win = vim.api.nvim_get_current_win()
    -- vim.fn.confirm(start_col)
    vim.api.nvim_win_set_cursor(current_win, { start_line, start_col - 1 })
    vim.cmd("normal! " .. end_line - start_line .. "j")
end
