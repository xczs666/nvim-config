return {
    -- { 'mhinz/vim-signify' },
    {
        'lewis6991/gitsigns.nvim',
        event = "VeryLazy",
        config = function()
            require('gitsigns').setup {
                signs                        = {
                    add          = { text = '+' },
                    change       = { text = '!' },
                    delete       = { text = '_' },
                    topdelete    = { text = '‾' },
                    changedelete = { text = '~' },
                    untracked    = { text = '┆' },
                },
                signcolumn                   = true,  -- Toggle with `:Gitsigns toggle_signs`
                numhl                        = false, -- Toggle with `:Gitsigns toggle_numhl`
                linehl                       = false, -- Toggle with `:Gitsigns toggle_linehl`
                word_diff                    = false, -- Toggle with `:Gitsigns toggle_word_diff`
                watch_gitdir                 = {
                    follow_files = true
                },
                attach_to_untracked          = true,
                current_line_blame           = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
                current_line_blame_opts      = {
                    virt_text = true,
                    virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                    delay = 0,
                    ignore_whitespace = true,
                },
                current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
                sign_priority                = 6,
                update_debounce              = 100,
                status_formatter             = nil,   -- Use default
                max_file_length              = 40000, -- Disable if file is longer than this (in lines)
                preview_config               = {
                    -- Options passed to nvim_open_win
                    border = 'single',
                    style = 'minimal',
                    relative = 'cursor',
                    row = 0,
                    col = 1
                },
                yadm                         = {
                    enable = false
                },
                on_attach                    = function(bufnr)
                    local gs = package.loaded.gitsigns

                    local function map(mode, l, r, opts)
                        opts = opts or {}
                        opts.buffer = bufnr
                        vim.keymap.set(mode, l, r, opts)
                    end

                    -- Navigation
                    map('n', ']c', function()
                        if vim.wo.diff then return ']c' end
                        vim.schedule(function() gs.next_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, desc ="Git Next Hunk" })

                    map('n', '[c', function()
                        if vim.wo.diff then return '[c' end
                        vim.schedule(function() gs.prev_hunk() end)
                        return '<Ignore>'
                    end, {expr=true, desc = "Git Prev Hunk"})

                    -- Actions
                    map('n', '<leader>hs', gs.stage_hunk, {desc = "[S]tage [H]unk-Accept"})
                    map('n', '<leader>hr', gs.reset_hunk, {desc = "[R]eset [H]unk-Reset"} )
                    map('v', '<leader>hs', function() gs.stage_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "[S]tage [H]unk-Accept"})
                    map('v', '<leader>hr', function() gs.reset_hunk {vim.fn.line('.'), vim.fn.line('v')} end, {desc = "[R]eset [H]unk-Reset"} )
                    -- map('n', '<leader>hS', gs.stage_buffer)
                    map('n', '<leader>hu', gs.undo_stage_hunk, {desc = "[U]ndo Stage [H]unk-Undo Accept"})
                    map('n', '<leader>hR', gs.reset_buffer, {desc = "[R]eset [H]unk-Reset All"})
                    map('n', '<leader>hp', gs.preview_hunk, {desc = "[P]review [H]unk-Preview"})
                    map('n', '<leader>hb', function() gs.blame_line{full=true} end, {desc = "[B]lame Current Line"})
                    map('n', '<leader>tb', gs.toggle_current_line_blame, {desc = "[T]oggle [B]lame"})
                    map('n', '<leader>hd', gs.diffthis, {desc = "[D]iff This File"})
                    map('n', '<leader>hD', function() gs.diffthis('~') end, {desc = "[D]iff HEAD~ This File"})
                    map('n', '<leader>td', gs.toggle_deleted, {desc = "Toggle [D]eleted"})

                    -- Text object
                    map({'o', 'x'}, 'ih', ':<C-U>Gitsigns select_hunk<CR>', {desc = "Select Hunk"})
                end
            }
        end
    }
}
