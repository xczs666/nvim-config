return {
    -- 'tpope/vim-fugitive'
    -- 插入模式下快捷键
    { 'tpope/vim-rsi',                   event = "VeryLazy", },
    -- gr 匹配替换
    { 'vim-scripts/ReplaceWithRegister', event = "VeryLazy", },
    -- sa sd sr
    -- i,I
    { 'machakann/vim-sandwich',          event = "VeryLazy" },
    -- 快捷交换 cx cxc cxx X
    { 'tommcdo/vim-exchange',            event = "VeryLazy", },
    { 'vim-scripts/DrawIt',              keys = { { "<localleader>di", mode = "n", "<Plug>DrawItStart", desc = "DrawItStart" },
                                                  { "<localleader>ds", mode = "n", "<Plug>DrawItStop",  desc = "DrawItStop"  }, } },
    -- f F t T 快捷移动提示
    { 'unblevable/quick-scope',          event = "VeryLazy", },
    -- 'jiangmiao/auto-pairs',
    -- <C-n> Ctrl-Down/Up Shift-Arrows n/N [/] q Q
    { 'mg979/vim-visual-multi',          branch = 'master',      event = "VeryLazy", },
    -- i a I A   n l   aa ia in an? il al
    'wellle/targets.vim',
    -- { 'Lokaltog/powerline',     rtp = '/powerline/bindings/vim' },
    -- 'bling/vim-bufferline',
    -- 'flazz/vim-colorschemes',
    { 'mbbill/undotree',                 cmd = "UndotreeToggle", config = function () vim.g.undotree_SetFocusWhenToggle = 1 end },
    -- crm MixedCase
    -- crc camelCase
    -- crs snake_case
    -- cru UPPER_CASE
    -- cr- dash-case
    -- cr. dot.case
    -- cr space case
    -- crt Title Case
    -- :h abolish
    -- :Abolish
    -- :%S/facilit{y, ies}/building{,s}/g
    { 'tpope/vim-abolish', },
    -- <ENTER> <BS>
    -- 'gcmt/wildfire.vim',
    -- 'voldikss/vim-floaterm',
    -- Files GFiles GFiles? Buffers History History: History/ Helptags Filetypes Maps
    -- 'junegunn/fzf.vim',
    -- ii ai aI
    { 'michaeljsmith/vim-indent-object', event = "VeryLazy", },
    -- 'sindrets/diffview.nvim',
    { 'christoomey/vim-tmux-navigator',  event = "VeryLazy" },
    -- gitsigns 替代
    -- 'airblade/vim-gitgutter',
    { 'osyo-manga/vim-over',             event = "VeryLazy" },
    { 'godlygeek/tabular',               cmd = "Tabularize",             dependencies = { 'quentindecock/vim-cucumber-align-pipes' } },
    { 'junegunn/vim-easy-align',         cmd = "EasyAlign" },
    -- <leader>tm,<leader>tr,<leader>tt,<leader>tfa,<leader>tfe,i|,a|,[|,]|,{|,}|,<leader>T,<leader>tdd,<leader>tdc,<leader>tic,Sum(1:-1),Average(1,2:5,2)/$5,1
    { 'dhruvasagar/vim-table-mode' },
    -- { 'luochen1990/rainbow',                  event = "VeryLazy", },
    { 'SidOfc/mkdx',                     ft = "markdown",                dependencies = { 'junegunn/fzf', } },
    { 'kristijanhusak/vim-dadbod-ui',    cmd = { "DBUI", "DBUIToggle" }, dependencies = { 'tpope/vim-dadbod', 'kristijanhusak/vim-dadbod-completion', } },
    '907th/vim-auto-save',
    'ybian/smartim',
    -- statusline
    -- 'vim-airline/vim-airline-themes',
    -- 快捷键gs,<c-a>,<c-x> https://github.com/AndrewRadev/switch.vim?tab=readme-ov-file
    { 'AndrewRadev/switch.vim',          dependencies = { 'tpope/vim-speeddating' }, config = function () vim.cmd[[ call SwitchConfig()]] end },
}
