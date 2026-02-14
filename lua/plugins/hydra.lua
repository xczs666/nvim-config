return {
    "nvimtools/hydra.nvim",
    config = function()
        local Hydra = require('hydra')

        -- ========================================
        -- 1. 滚动 Hydra
        -- ========================================
        Hydra({
            name = '滚动',
            mode = 'n',
            body = 'zs',
            hint = [[
━━━━━━━━━━━━━━━━━━━━━ 滚动模式 ━━━━━━━━━━━━━━━━━━━
 ↕ 垂直:  _j_: ↓行  _k_: ↑行  _d_: ↓半屏  _u_: ↑半屏
 ↔ 水平:  _h_: ←    _l_: →    _H_: ←半屏  _L_: →半屏
 ⊕ 定位:  _z_: 居中 _t_: 顶部 _b_: 底部
 📍 跳转:  _g_: 文首 _G_: 文尾 _m_: 中间
 
 _<Esc>_,_<C-c>_,_q_: 退出
]],
            config = {
                -- see `:h hydra-colors`
                -- 颜色     | 行为                        | 适用场景
                -- pink     | 允许任何键工作，不退出hydra | 单词跳转（推荐）
                -- red      | 只允许hydra键，其他键退出   | 需要专注的操作
                -- amaranth | 阻止非hydra键，必须ESC退出  | 防误操作
                -- teal     | 阻止非hydra键，hydra键退出  | 一次性操作
                -- blue     | hydra键会退出hydra          | 菜单选择
                color = 'pink',
                -- when true, summon the hydra after pressing only the `body` keys. Normally a head is required
                invoke_on_body = true,
                -- see :h hydra-hint-hint-configuration
                -- hint = { type = 'cmdline' },
                hint = {
                    type = 'window',
                    position = 'middle-right',
                    float_opts = {
                        border = 'rounded',
                    },
                },
                -- timeout after which the hydra is automatically disabled. Calling any head
                -- will refresh the timeout
                --   true: timeout set to value of 'timeoutlen' (:h 'timeoutlen')
                --   5000: set to desired number of milliseconds
                timeout = 5000, -- by default hydras wait forever
            },
            heads = {
                -- ========== 水平滚动 ==========
                { 'h', 'zh', { desc = '←' } },
                { 'l', 'zl', { desc = '→' } },
                { 'H', 'zH', { desc = '←半屏' } },
                { 'L', 'zL', { desc = '→半屏' } },

                -- ========== 垂直滚动 ==========
                -- 滚动一行（不移动光标）
                { 'j', '<C-e>', { desc = '↓一行' } },
                { 'k', '<C-y>', { desc = '↑一行' } },

                -- 滚动半屏
                { 'd', '<C-d>', { desc = '↓半屏' } },
                { 'u', '<C-u>', { desc = '↑半屏' } },

                -- ========== 屏幕定位 ==========
                { 'z', 'zz', { desc = '居中' } },
                { 't', 'zt', { desc = '顶部' } },
                { 'b', 'zb', { desc = '底部' } },

                -- ========== 快速跳转 ==========
                { 'g', 'gg', { desc = '文件开头' } },
                { 'G', 'G', { desc = '文件结尾' } },
                { 'm', 'M', { desc = '屏幕中间' } },

                -- 退出
                { '<Esc>', nil, { exit = true }, { desc = '退出' } },
                { '<C-c>', nil, { exit = true }, { desc = '退出' } },
                { 'q', nil, { exit = true }, { desc = '退出' } },
            }
        })

        -- ========================================
        -- 2. 窗口操作 Hydra
        -- ========================================
        Hydra({
            name = '窗口',
            mode = 'n',
            body = '<C-w>',
            hint = [[
 _+_:↑  _-_:↓  _>_:→  _<_:←  _=_:均
 _h_:←  _j_:↓  _k_:↑  _l_:→
 _s_:水平  _v_:垂直  _q_:关闭  _<Esc>_:退
]],
--             hint = [[
--  ┌─ 窗口操作 ──────────────────────────┐
--  │ 调整大小:                            │
--  │   _+_: ↑高  _-_: ↓高  _>_: →宽  _<_: ←宽 │
--  │   _=_: 平均分配                      │
--  │ 移动光标:                            │
--  │   _h_: ← _j_: ↓ _k_: ↑ _l_: →       │
--  │ 分割/关闭:                           │
--  │   _s_: 水平分割  _v_: 垂直分割       │
--  │   _q_: 关闭      _o_: 只保留当前     │
--  │ _<Esc>_: 退出                        │
--  └──────────────────────────────────────┘
-- ]],
            config = {
                color = 'pink',
                invoke_on_body = false,  -- 需要按 <C-w> + head
                hint = {
                    type = 'window',
                    position = 'middle',
                    float_opts = {
                        border = 'rounded',
                    },
                },
                timeout = 3000,
            },
            heads = {
                -- 调整大小
                { '+', '<C-w>+', { desc = '增加高度' } },
                { '-', '<C-w>-', { desc = '减少高度' } },
                { '>', '<C-w>>', { desc = '增加宽度' } },
                { '<', '<C-w><', { desc = '减少宽度' } },
                { '=', '<C-w>=', { desc = '平均分配', exit = true } },

                -- 移动光标
                { 'h', '<C-w>h', { desc = '← 窗口' } },
                { 'j', '<C-w>j', { desc = '↓ 窗口' } },
                { 'k', '<C-w>k', { desc = '↑ 窗口' } },
                { 'l', '<C-w>l', { desc = '→ 窗口' } },

                -- 分割窗口
                { 's', '<C-w>s', { desc = '水平分割', exit = true } },
                { 'v', '<C-w>v', { desc = '垂直分割', exit = true } },

                -- 关闭窗口
                { 'q', '<C-w>q', { desc = '关闭', exit = true } },
                { 'o', '<C-w>o', { desc = '只保留当前', exit = true } },

                -- 退出
                { '<Esc>', nil, { exit = true, nowait = true } },
            }
        })
    end
}
