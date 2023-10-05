return {
    -- https://www.nerdfonts.com/cheat-sheet
    -- https://github.com/simrat39/symbols-outline.nvim
    -- 使滚动更加平滑。
    -- https://github.com/karb94/neoscroll.nvim

    {
        -- j/k 按住不动加速
        "rhysd/accelerated-jk",
        keys = {
            { "j", "<Plug>(accelerated_jk_gj)", mode = { "n" } },
            { "k", "<Plug>(accelerated_jk_gk)", mode = { "n" } },
        },
    },
    {
        -- 记录退出时光标位置
        "ethanholz/nvim-lastplace",
        config = true,
    },
    {
        "echasnovski/mini.ai",
        event = "VeryLazy",
        config = true,
    },
    {
        -- gcc/gc 注释
        "echasnovski/mini.comment",
        event = "VeryLazy",
        version = false,
        config = true,
    },
    {
        -- https://github.com/nathom/filetype.nvim
        -- filetype.nvim对neovim的filetype进行了优化，可以使打开文件时识别文件类型的速度更快。
        "nathom/filetype.nvim",
        lazy = true,
        event = { "BufRead", "BufNewFile" },
        config = function()
            require("filetype").setup({
                overrides = {
                    extensions = {
                        h = "cpp",
                        md = "markdown",
                    },
                }
            })
        end
    },
    -- {
    --     "https://gitlab.com/HiPhish/rainbow-delimiters.nvim", 存在性能问题!!!!!
    --     -- Bracket pair rainbow colorize
    --     config = function()
    --         local rainbow_delimiters = require 'rainbow-delimiters'
    --
    --         vim.g.rainbow_delimiters = {
    --             strategy = {
    --                 [''] = rainbow_delimiters.strategy['global'],
    --                 vim = rainbow_delimiters.strategy['local'],
    --             },
    --             query = {
    --                 [''] = 'rainbow-delimiters',
    --                 lua = 'rainbow-blocks',
    --             },
    --             highlight = {
    --                 'RainbowDelimiterRed',
    --                 'RainbowDelimiterYellow',
    --                 'RainbowDelimiterBlue',
    --                 'RainbowDelimiterOrange',
    --                 'RainbowDelimiterGreen',
    --                 'RainbowDelimiterViolet',
    --                 'RainbowDelimiterCyan',
    --             },
    --         }
    --     end
    -- },
    {
        -- 基于nvim-treesitter的上文文固定插件。 它可以将当前函数的函数头固定在neovim界面的前几行，让你知道当前在编辑的是什么类、函数或方法。
        "https://github.com/nvim-treesitter/nvim-treesitter-context",
        cmd = { "TSContextToggle" },
        keys = {
            { "<leader>sf", "<cmd>TSContextToggle<cr>", mode = "n", desc = "[S]how [F]unction Message" },
        },
        config = function()
            require("treesitter-context").setup({
                enable = false,
            })
        end,
    },

    -- {
    --     -- 收藏夹
    --     'https://github.com/crusj/bookmarks.nvim',
    --     keys = {
    --         { "<tab><tab>", mode = { "n" } },
    --     },
    --     branch = 'main',
    --     dependencies = { 'nvim-web-devicons' },
    --     config = function()
    --         require("bookmarks").setup({
    --             storage_dir = "", -- Default path: vim.fn.stdpath("data").."/bookmarks,  if not the default directory, should be absolute path",
    --             mappings_enabled = true, -- If the value is false, only valid for global keymaps: toggle、add、delete_on_virt、show_desc
    --             keymap = {
    --                 toggle = "<tab><tab>", -- Toggle bookmarks(global keymap)
    --                 add = "\\z", -- Add bookmarks(global keymap)
    --                 jump = "<CR>", -- Jump from bookmarks(buf keymap)
    --                 delete = "dd", -- Delete bookmarks(buf keymap)
    --                 order = "<space><space>", -- Order bookmarks by frequency or updated_time(buf keymap)
    --                 delete_on_virt = "\\dd", -- Delete bookmark at virt text line(global keymap)
    --                 show_desc = "\\sd", -- show bookmark desc(global keymap)
    --             },
    --             width = 0.8, -- Bookmarks window width:  (0, 1]
    --             height = 0.6, -- Bookmarks window height: (0, 1]
    --             preview_ratio = 0.4, -- Bookmarks preview window ratio (0, 1]
    --             preview_ext_enable = false, -- If true, preview buf will add file ext, preview window may be highlighed(treesitter), but may be slower.
    --             fix_enable = false, -- If true, when saving the current file, if the bookmark line number of the current file changes, try to fix it.
    --
    --             virt_text = "🔖", -- Show virt text at the end of bookmarked lines
    --             virt_pattern = { "*.go", "*.lua", "*.sh", "*.php", "*.rs" }, -- Show virt text only on matched pattern
    --             border_style = "single", -- border style: "single", "double", "rounded"
    --             hl = {
    --                 border = "TelescopeBorder", -- border highlight
    --                 cursorline = "guibg=Gray guifg=White", -- cursorline highlight
    --             }
    --         })
    --         require("telescope").load_extension("bookmarks")
    --     end
    -- },

    {
        "https://github.com/ThePrimeagen/harpoon",
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        keys = {
            { "<leader>oh",  mode = "n",                                               desc = "+Harpoon" },
            { "<leader>ohh", "<cmd>Telescope harpoon marks<cr>",                       mode = "n",       desc = "Telescope Harpoon" },
            { "<leader>oht", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", mode = "n",       desc = "Toggle Menu" },
            { "<leader>ohf", "<cmd>lua require('harpoon.mark').add_file()<cr>",        mode = "n",       desc = "Add File" },
            { "<leader>ohd", "<cmd>lua require('harpoon.mark').rm_file()<cr>",         mode = "n",       desc = "Remove File" },
            { "<leader>ohn", "<cmd>lua require('harpoon.ui').nav_next()<cr>",          mode = "n",       desc = "Next" },
            { "<leader>ohp", "<cmd>lua require('harpoon.ui').nav_prev()<cr>",          mode = "n",       desc = "Prev" },
        },
        config = function()
            require("harpoon").setup()
            require("telescope").load_extension('harpoon')
        end
    },

    {
        "https://github.com/tom-anders/telescope-vim-bookmarks.nvim",
        keys = {
            { "<leader>bk", "<cmd>Telescope vim_bookmarks all<cr>",          mode = "n", desc = "Bookmark All" },
            { "<leader>ba", "<cmd>Telescope vim_bookmarks current_file<cr>", mode = "n", desc = "Bookmark Current File" },
        },
        dependencies = {
            -- Action                                        | Shortcut   | Command
            -- Add/remove bookmark at current line           | mm         | :BookmarkToggle
            -- Add/edit/remove annotation at current line    | mi         | :BookmarkAnnotate <TEXT>
            -- Jump to next bookmark in buffer               | mn         | :BookmarkNext
            -- Jump to previous bookmark in buffer           | mp         | :BookmarkPrev
            -- Show all bookmarks (toggle)                   | ma         | :BookmarkShowAll
            -- Clear bookmarks in current buffer only        | mc         | :BookmarkClear
            -- Clear bookmarks in all buffers                | mx         | :BookmarkClearAll
            -- Move up bookmark at current line              | [count]mkk | :BookmarkMoveUp [<COUNT>]
            -- Move down bookmark at current line            | [count]mjj | :BookmarkMoveDown [<COUNT>]
            -- Move bookmark at current line to another line | [count]mg  | :BookmarkMoveToLine <LINE>
            -- Save all bookmarks to a file                  |            | :BookmarkSave <FILE_PATH>
            -- Load bookmarks from a file                    |            | :BookmarkLoad <FILE_PATH>
            "https://github.com/MattesGroeger/vim-bookmarks",
        },
        config = function()
            require('telescope').load_extension('vim_bookmarks')
        end,
    },

    {
        -- 启用neovim的折叠功能，在左侧栏显示可折叠的项目，并能够自定义折叠显示的内容
        "kevinhwang91/nvim-ufo",
        cmd = { "UfoDisable", "UfoEnable" },
        dependencies = {
            "kevinhwang91/promise-async",
        },
        config = function()
            vim.o.foldcolumn = "1" -- '0' is not bad
            vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
            vim.o.foldlevelstart = 99
            vim.o.foldenable = true


            vim.cmd([[highlight AdCustomFold guifg=#bf8040]])
            local handler = function(virtText, lnum, endLnum, width, truncate)
                local newVirtText = {}
                local suffix = ("  %d "):format(endLnum - lnum)
                local sufWidth = vim.fn.strdisplaywidth(suffix)
                local targetWidth = width - sufWidth
                local curWidth = 0

                for _, chunk in ipairs(virtText) do
                    local chunkText = chunk[1]
                    local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    if targetWidth > curWidth + chunkWidth then
                        table.insert(newVirtText, chunk)
                    else
                        chunkText = truncate(chunkText, targetWidth - curWidth)
                        local hlGroup = chunk[2]
                        table.insert(newVirtText, { chunkText, hlGroup })
                        chunkWidth = vim.fn.strdisplaywidth(chunkText)
                        -- str width returned from truncate() may less than 2nd argument, need padding
                        if curWidth + chunkWidth < targetWidth then
                            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                        end
                        break
                    end
                    curWidth = curWidth + chunkWidth
                end

                -- Second line
                local lines = vim.api.nvim_buf_get_lines(0, lnum, lnum + 1, false)
                local secondLine = nil
                if #lines == 1 then
                    secondLine = lines[1]
                elseif #lines > 1 then
                    secondLine = lines[2]
                end
                if secondLine ~= nil then
                    table.insert(newVirtText, { secondLine, "AdCustomFold" })
                end

                table.insert(newVirtText, { suffix, "MoreMsg" })

                return newVirtText
            end

            require("ufo").setup({
                provider_selector = function(bufnr, filetype, buftype)
                    return { "treesitter", "indent" }
                end,
                fold_virt_text_handler = handler,
            })
        end,
    },

    {
        "https://github.com/roobert/search-replace.nvim",
        event = "VeryLazy",
        config = function()
            require("search-replace").setup({
                -- optionally override defaults
                default_replace_single_buffer_options = "gcI",
                default_replace_multi_buffer_options = "egcI",
            })
        end,
    },

    {
        -- 根据光标位置自动决定要选中什么textobject
        -- vm：根据光标位置，智能选择
        -- v,：选中上一次选中的范围
        -- v;：选中容器外围
        -- vi;：选中容器内
        "RRethy/nvim-treesitter-textsubjects",
        after = "nvim-treesitter",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                textsubjects = {
                    enable = true,
                    prev_selection = ",",
                    keymaps = {
                        ["m"] = "textsubjects-smart",
                        -- 和f/t重复执行冲突
                        -- [";"] = "textsubjects-container-outer",
                        -- ["i;"] = "textsubjects-container-inner",
                    },
                },
            })
        end,
    },

    {
        -- https://github.com/chrisgrieser/nvim-various-textobjs
        -- textobj                | description                                                                          | inner / outer                                                                 | forward-seeking | default keymaps  | filetypes (for default keymaps)
        -- indentation            | surrounding lines with same or higher indentation                                    | see overview from vim-indent-object                                           | -               | ii, ai, aI, (iI) | all
        -- restOfIndentation      | lines down with same or higher indentation                                           | -                                                                             | -               | R                | all
        -- greedyOuterIndentation | outer indentation, expanded to blank lines; useful to get functions with annotations | outer includes a blank, like ap/ip                                            | -               | ag/ig            | all
        -- subword                | like iw, but treating -, _, and . as word delimiters and only part of camelCase      | outer includes trailing _,-, or space                                         | -               | iS, aS           | all
        -- toNextClosingBracket   | from cursor to next closing ], ), or }                                               | -                                                                             | -               | C                | all
        -- toNextQuotationMark    | from cursor to next unescaped1 ", ', or `                                            | -                                                                             | -               | Q                | all
        -- restOfParagraph        | like }, but linewise                                                                 | -                                                                             | -               | r                | all
        -- entireBuffer           | entire buffer as one text object                                                     | -                                                                             | -               | gG               | all
        -- nearEoL                | from cursor position to end of line, minus one character                             | -                                                                             | -               | n                | all
        -- lineCharacterwise      | current line, but characterwise                                                      | outer includes indentation and trailing spaces                                | -               | i_, a_           | all
        -- column                 | column down until indent or shorter line. Accepts {count} for multiple columns.      | -                                                                             | -               |                  |                                 | all
        -- value                  | value of key-value pair, or right side of a variable assignment (inside one line)    | outer includes trailing commas or semicolons                                  | small           | iv, av           | all
        -- key                    | key of key-value pair, or left side of a variable assignment                         | outer includes the = or :                                                     | small           | ik, ak           | all
        -- url                    | link beginning with "http"                                                           | -                                                                             | big             | L                | all
        -- number                 | numbers, similar to <C-a>                                                            | inner: only pure digits, outer: number including minus sign and decimal point | small           | in, an           | all
        -- diagnostic             | LSP diagnostic (requires built-in LSP)                                               | -                                                                             | big             | !                | all
        -- closedFold             | closed fold                                                                          | outer includes one line after the last folded line                            | big             | iz, az           | all
        -- chainMember            | field with the full call, like .encode(param)                                        | outer includes the leading . (or :)                                           | small           | im, am           | all
        -- visibleInWindow        | all lines visible in the current window                                              | -                                                                             | -               | gw               | all
        -- restOfWindow           | from the cursorline to the last line in the window                                   | -                                                                             | -               | gW               | all
        -- mdlink                 | markdown link like [title](url)                                                      | inner is only the link title (between the [])                                 | small           | il, al           | markdown, toml
        -- mdFencedCodeBlock      | markdown fenced code (enclosed by three backticks)                                   | outer includes the enclosing backticks                                        | big             | iC, aC           | markdown
        -- cssSelector            | class in CSS like .my-class                                                          | outer includes trailing comma and space                                       | small           | ic, ac           | css, scss
        -- htmlAttribute          | attribute in html/xml like href="foobar.com"                                         | inner is only the value inside the quotes trailing comma and space            | small           | ix, ax           | html, xml, css, scss, vue
        -- doubleSquareBrackets   | text enclosed by [[]]                                                                | outer includes the four square brackets                                       | small           | iD, aD           | lua, shell, neorg, markdown
        -- shellPipe              | command stdout is piped to                                                           | outer includes the front pipe character                                       | small           | iP,aP            | bash, zsh, fish, sh
        "chrisgrieser/nvim-various-textobjs",
        event = "VeryLazy",
        opts = { useDefaultKeymaps = true },
    },

}
