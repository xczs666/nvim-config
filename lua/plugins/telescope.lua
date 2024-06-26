return {
    'nvim-telescope/telescope.nvim',
    -- tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-file-browser.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            -- 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        {
            "nvim-telescope/telescope-frecency.nvim",
            -- dependencies = { "kkharji/sqlite.lua" },
            config = function()
                require("telescope").load_extension "frecency"
            end,
        },
        "LinArcX/telescope-command-palette.nvim",
    },
    event = "VeryLazy",
    config = function()
        local actions = require("telescope.actions")

        -- local open_with_trouble = function(...)
        --     return require("trouble.providers.telescope").open_with_trouble(...)
        -- end
        -- local open_selected_with_trouble = function(...)
        --     return require("trouble.providers.telescope").open_selected_with_trouble(...)
        -- end
        -- local find_files_no_ignore = function()
        --     local action_state = require("telescope.actions.state")
        --     local line = action_state.get_current_line()
        --     Util.telescope("find_files", { no_ignore = true, default_text = line })()
        -- end
        -- local find_files_with_hidden = function()
        --     local action_state = require("telescope.actions.state")
        --     local line = action_state.get_current_line()
        --     Util.telescope("find_files", { hidden = true, default_text = line })()
        -- end

        require('telescope').setup({
            defaults = {
                mappings = {
                    i = {
                        -- ["<c-t>"] = open_with_trouble,
                        -- ["<a-t>"] = open_selected_with_trouble,
                        -- ["<a-i>"] = find_files_no_ignore,
                        -- ["<a-h>"] = find_files_with_hidden,
                        ["<C-Down>"] = actions.cycle_history_next,
                        ["<C-Up>"] = actions.cycle_history_prev,
                        ["<C-b>"] = actions.results_scrolling_up,
                        ["<C-f>"] = actions.results_scrolling_down,
                    },
                    n = {
                        ["q"] = actions.close,
                    },
                }
            },
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                },
                frecency = {
                    db_safe_mode = false,
                    use_sqlite = false,
                },
                file_browser = {
                    -- theme = "ivy",
                    -- disables netrw and use telescope-file-browser in its place
                    hijack_netrw = true,
                },
                command_palette = {
                    { "File",
                        { "entire selection (C-a)",  ':call feedkeys("GVgg")' },
                        { "save current file (C-s)", ':w' },
                        { "save all files (C-A-s)",  ':wa' },
                        { "quit (C-q)",              ':qa' },
                        { "file browser (C-i)",      ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
                        { "search word (A-w)",       ":lua require('telescope.builtin').live_grep()",                  1 },
                        { "git files (A-f)",         ":lua require('telescope.builtin').git_files()",                  1 },
                        { "files (C-f)",             ":lua require('telescope.builtin').find_files()",                 1 },
                    },
                    { "Help",
                        { "tips",            ":help tips" },
                        { "cheatsheet",      ":help index" },
                        { "tutorial",        ":help tutor" },
                        { "summary",         ":help summary" },
                        { "quick reference", ":help quickref" },
                        { "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
                    },
                    { "Vim",
                        { "reload vimrc",              ":source $MYVIMRC" },
                        { 'check health',              ":checkhealth" },
                        { "jumps (Alt-j)",             ":lua require('telescope.builtin').jumplist()" },
                        { "commands",                  ":lua require('telescope.builtin').commands()" },
                        { "command history",           ":lua require('telescope.builtin').command_history()" },
                        { "registers (A-e)",           ":lua require('telescope.builtin').registers()" },
                        { "colorshceme",               ":lua require('telescope.builtin').colorscheme()",    1 },
                        { "vim options",               ":lua require('telescope.builtin').vim_options()" },
                        { "keymaps",                   ":lua require('telescope.builtin').keymaps()" },
                        { "buffers",                   ":Telescope buffers" },
                        { "search history (C-h)",      ":lua require('telescope.builtin').search_history()" },
                        { "paste mode",                ':set paste!' },
                        { 'cursor line',               ':set cursorline!' },
                        { 'cursor column',             ':set cursorcolumn!' },
                        { "spell checker",             ':set spell!' },
                        { "relative number",           ':set relativenumber!' },
                        { "search highlighting (F12)", ':set hlsearch!' },
                    }
                },
            }
        })
        require('telescope').load_extension('fzf')
        require("telescope").load_extension("file_browser")
        require("telescope").load_extension("frecency")
        require('telescope').load_extension('command_palette')
    end
}
