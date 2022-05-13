local M = {}

function M.setup()
    require("nvim-treesitter.install").compilers = { "clang", "gcc" }

    require("nvim-treesitter.configs").setup {
        ensure_installed = "all",
        ignore_install = { "swift" },
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        rainbow = {
            enable = true,
            extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
            max_file_lines = nil, -- Do not enable for files with more than n lines, int
            colors = { "IndianRed1", "LightGoldenrod1", "Aquamarine1", "DeepSkyBlue1" },
            -- termcolors = {'DeepSkyBlue1', 'IndianRed1', 'LightGoldenrod1', 'Aquamarine1'}
        },
    }
end

return M
