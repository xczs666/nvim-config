return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.3',
    dependencies = { 'nvim-lua/plenary.nvim',
        "nvim-telescope/telescope-file-browser.nvim",
        {
            'nvim-telescope/telescope-fzf-native.nvim',
            build = 'make',
            -- 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
        },
        {
            "nvim-telescope/telescope-frecency.nvim",
            dependencies = { "kkharji/sqlite.lua" },
        },
        "LinArcX/telescope-command-palette.nvim",
    },
    event = "VeryLazy",
    config = function()
        require('telescope').setup({
            extensions = {
                fzf = {
                    fuzzy = true,                   -- false will only do exact matching
                    override_generic_sorter = true, -- override the generic sorter
                    override_file_sorter = true,    -- override the file sorter
                    case_mode = "smart_case",       -- or "ignore_case" or "respect_case" the default case_mode is "smart_case"
                },
                frecency = {
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
