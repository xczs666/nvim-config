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
        -- i<space>,a(, a), a',af, a?,af
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
            vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
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
                if secondLine ~= nil and curWidth == 0 then
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
        event = { "CmdlineEnter" },
        main = "search-replace",
        keys = {
            { "<leader>rs", "<CMD>SearchReplaceSingleBufferSelections<CR>", mode = "n", desc = "[R]eplace [S]elections" },
            { "<leader>ro", "<CMD>SearchReplaceWithinVisualSelection<CR>",  mode = "v", desc = "[R]eplace [O]pen" },
            { "<leader>ro", "<CMD>SearchReplaceSingleBufferOpen<CR>",       mode = "n", desc = "[R]eplace [O]pen" },
        },
        opts = {
            -- optionally override defaults
            default_replace_single_buffer_options = "gcI",
            default_replace_multi_buffer_options = "egcI",
        }
    },

    {
        -- 根据光标位置自动决定要选中什么textobject
        -- vm：根据光标位置，智能选择
        -- v,：选中上一次选中的范围
        -- v;：选中容器外围
        -- vi;：选中容器内
        "RRethy/nvim-treesitter-textsubjects",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        event = "VeryLazy",
        config = function()
            require("nvim-treesitter.configs").setup({
                textsubjects = {
                    enable = true,
                    prev_selection = "M",
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
        -- | textobject             | description                                                                                | inner / outer                                                                 | forward-seeking                      | default keymaps  | filetypes (for default keymaps) |
        -- | :------                | :-----                                                                                     | :----                                                                         | :----                                | :----            | :----                           |
        -- | indentation            | surrounding lines with same or higher indentation                                          | see overview from vim-indent-object                                           | -                                    | ii, ai, aI, (iI) | all                             |
        -- | restOfIndentation      | lines down with same or higher indentation                                                 | -                                                                             | -                                    | R                | all                             |
        -- | greedyOuterIndentation | outer indentation, expanded to blank lines; useful to get functions with annotations       | outer includes a blank, like ap/ip                                            | -                                    | ag/ig            | all                             |
        -- | subword                | like iw, but treating -, _, and . as word delimiters and only part of camelCase            | outer includes trailing _,-, or space                                         | -                                    | iS/aS            | all                             |
        -- | toNextClosingBracket   | from cursor to next closing ], ), or }                                                     | -                                                                             | small                                | C                | all                             |
        -- | toNextQuotationMark    | from cursor to next unescaped1 ", ', or `                                                  | -                                                                             | small                                | Q                | all                             |
        -- | anyQuote               | between any unescaped1 ", ', or ` in a line                                                | outer includes the quotation marks                                            | small                                | iq/aq            | all                             |
        -- | anyBracket             | between any (), [], or {} in a line                                                        | outer includes the brackets                                                   | small                                | io/ao            | all                             |
        -- | restOfParagraph        | like }, but linewise                                                                       | -                                                                             | -                                    | r                | all                             |
        -- | multiCommentedLines    | consecutive, fully commented lines                                                         | -                                                                             | big                                  | gc               | all                             |
        -- | entireBuffer           | entire buffer as one text object                                                           | -                                                                             | -                                    | gG               | all                             |
        -- | nearEoL                | from cursor position to end of line, minus one character                                   | -                                                                             | -                                    | n                | all                             |
        -- | lineCharacterwise      | current line, but characterwise                                                            | outer includes indentation and trailing spaces                                | -                                    | i_/a_            | all                             |
        -- | column                 | column down until indent or shorter line. Accepts {count} for multiple columns.            | -                                                                             | -                                    | |                | all                             |
        -- | value                  | value of key-value pair, or right side of a assignment, excl. trailing comment (in a line) | outer includes trailing commas or semicolons                                  | small                                | iv/av            | all                             |
        -- | key                    | key of key-value pair, or left side of a assignment                                        | outer includes the = or :                                                     | small                                | ik/ak            | all                             |
        -- | url                    | works with http[s] or any other protocol                                                   | -                                                                             | big                                  | L                | all                             |
        -- | number                 | numbers, similar to <C-a>                                                                  | inner: only pure digits, outer: number including minus sign and decimal point | small                                | in/an            | all                             |
        -- | diagnostic             | LSP diagnostic (requires built-in LSP)                                                     | -                                                                             | big                                  | !                | all                             |
        -- | closedFold             | closed fold                                                                                | outer includes one line after the last folded line                            | big                                  | iz/az            | all                             |
        -- | chainMember            | field with the full call, like .encode(param)                                              | outer includes the leading . (or :)                                           | small                                | im/am            | all                             |
        -- | visibleInWindow        | all lines visible in the current window                                                    | -                                                                             | -                                    | gw               | all                             |
        -- | restOfWindow           | from the cursorline to the last line in the window                                         | -                                                                             | -                                    | gW               | all                             |
        -- | lastChange             | Last non-deletion-change, yank, or paste.2                                                 | -                                                                             | -                                    | g;               | all                             |
        -- | mdlink                 | markdown link like [title](url)                                                            | inner is only the link title (between the [])                                 | small                                | il/al            | markdown, toml                  |
        -- | mdEmphasis             | markdown text enclosed by *, **, _, __, ~~, or ==                                          | inner is only the emphasis content                                            | small                                | ie/ae            | markdown                        |
        -- | mdFencedCodeBlock      | markdown fenced code (enclosed by three backticks)                                         | outer includes the enclosing backticks                                        | big                                  | iC/aC            | markdown                        |
        -- | cssSelector            | class in CSS like .my-class                                                                | outer includes trailing comma and space                                       | small                                | ic/ac            | css, scss                       |
        -- | cssColor               | color in CSS (hex, rgb, or hsl)                                                            | inner includes only the color value                                           | small                                | i#/a#            | css, scss                       |
        -- | htmlAttribute          | attribute in html/xml like href="foobar.com"                                               | inner is only the value inside the quotes trailing comma and space            | small                                | ix/ax            | html, xml, css, scss, vue       |
        -- | doubleSquareBrackets   | text enclosed by [[]]                                                                      | outer includes the four square brackets                                       | small                                | iD/aD            | lua, shell, neorg, markdown     |
        -- | shellPipe              | segment until a pipe character (|)                                                         | outer includes the pipe to the right                                          | small                                | iP/aP            | bash, zsh, fish, sh             |
        -- | pyTripleQuotes         | python strings surrounded by three quotes (regular or f-string)                            | inner excludes the """ or '''                                                 | -                                    | iy/ay            | python                          |
        -- | notebookCell           | cell delimited by double percent comment, such as # %%                                     | outer includes the bottom cell border                                         | -                                    | iN/aN            | all                             |
        "chrisgrieser/nvim-various-textobjs",
        event = "VeryLazy",
        config = function ()
            -- gx 不需要光标位于链接即可打开，当当前不在链接所在行搜索全部链接
            local function openURL(url)
                local opener
                if vim.fn.has("macunix") == 1 then
                    opener = "open"
                elseif vim.fn.has("linux") == 1 then
                    opener = "xdg-open"
                elseif vim.fn.has("win64") == 1 or vim.fn.has("win32") == 1 then
                    opener = "start"
                end
                local openCommand = string.format("%s '%s' >/dev/null 2>&1", opener, url)
                vim.fn.system(openCommand)
            end

            vim.keymap.set("n", "gx", function()
                require("various-textobjs").url()
                local foundURL = vim.fn.mode():find("v")
                if foundURL then
                    -- retrieve URL with the z-register as intermediary
                    vim.cmd.normal { '"zy', bang = true }
                    local url = vim.fn.getreg("z")
                    openURL(url)
                else
                    -- find all URLs in buffer
                    local urlPattern = require("various-textobjs.charwise-textobjs").urlPattern
                    local bufText = table.concat(vim.api.nvim_buf_get_lines(0, 0, -1, false), "\n")
                    local urls = {}
                    for url in bufText:gmatch(urlPattern) do
                        table.insert(urls, url)
                    end
                    if #urls == 0 then return end

                    -- select one, use a plugin like dressing.nvim for nicer UI for
                    -- `vim.ui.select`
                    vim.ui.select(urls, { prompt = "Select URL:" }, function(choice)
                        if choice then openURL(choice) end
                    end)
                end
            end, { desc = "URL Opener" })

            vim.keymap.set( { "o", "x" }, "gcm", "<cmd>lua require('various-textobjs').multiCommentedLines()<CR>", { desc = "multi code line" })

            -- 有config情况下 opts无效
            require("various-textobjs").setup({
                keymaps = {
                    useDefaults = true,
                    disabledDefaults = {'n','in','an', '|', 'gc'},
                }
            })

        end
    },

    {
        -- also see: https://github.com/chaoren/vim-wordmotion
        -- also see: "https://github.com/bkad/CamelCaseMotion",
        "bkad/CamelCaseMotion",
    --     "chrisgrieser/nvim-spider",
    --     keys = {
    --         { "<leader>wj", "<cmd>lua WordJumpToggle()<CR>", mode = "n", desc = "[W]ord [J]ump" },
    --     },
    --     config = function()
    --         -- 检查是否存在已经映射的键
    --         local function is_key_mapped(key)
    --             local mappings = vim.api.nvim_get_keymap('n')
    --             for _, mapping in ipairs(mappings) do
    --                 if mapping.lhs == key then
    --                     return true
    --                 end
    --             end
    --             return false
    --         end
    --
    --         -- 设置映射或删除映射
    --         local function set_mapping(key, plug)
    --             if is_key_mapped(key) then
    --                 vim.keymap.del({ "n", "o", "x" }, key)
    --                 vim.notify("Disable", vim.log.levels.INFO,
    --                     { title = "驼峰跳转", timeout = 100, icon = "", style = "Information",
    --                     })
    --             else
    --                 vim.keymap.set({ "n", "o", "x" }, key, plug, { noremap = true, silent = true })
    --                 vim.notify("Enable", vim.log.levels.INFO,
    --                     { title = "驼峰跳转", timeout = 100, icon = "", style = "Information",
    --                     })
    --             end
    --         end
    --
    --         -- 设置 w,e,b 映射
    --         function WordJumpToggle()
    --             -- set_mapping('w', '<Plug>CamelCaseMotion_w')
    --             -- set_mapping('e', '<Plug>CamelCaseMotion_e')
    --             -- set_mapping('b', '<Plug>CamelCaseMotion_b')
    --             -- set_mapping('ge', '<Plug>CamelCaseMotion_ge')
    --             set_mapping('w', "<cmd>lua require('spider').motion('w')<CR>")
    --             set_mapping('e', "<cmd>lua require('spider').motion('e')<CR>")
    --             set_mapping('b', "<cmd>lua require('spider').motion('b')<CR>")
    --             set_mapping('ge', "<cmd>lua require('spider').motion('ge')<CR>")
    --         end
    --     end
    },

    {
        "LunarVim/bigfile.nvim",
        event = { "FileReadPre", "BufReadPre", "User FileOpened" },
        config = function ()
            require("bigfile").setup({
                filesize = 10, -- size of the file in MiB, the plugin round file sizes to the closest MiB
                pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
                features = { -- features to disable
                    "indent_blankline",
                    "illuminate",
                    "lsp",
                    "treesitter",
                    -- "syntax", -- `:syntax off` for the buffer
                    "matchparen",
                    -- "vimopts", -- `swapfile = false` `foldmethod = "manual"` `undolevels = -1` `undoreload = 0` `list = false` for the buffer
                    "filetype", -- `filetype = ""` for the buffer
                    {
                        name = "vimconfig", -- vimopts
                        disable = function()
                            vim.opt_local.swapfile = false
                            vim.opt_local.foldmethod = "indent"
                            vim.opt_local.undolevels = 10
                            vim.opt_local.undoreload = 0
                            vim.opt_local.list = false
                            vim.g.lazyredraw = true -- 优化宏,替换等批量动作
                        end,
                    },
                    {
                        name = "disableAutoSave", -- 907th/vim-auto-save
                        disable = function()
                            vim.g.auto_save = 0
                        end,
                    }
                },
            })
        end
    },

}
