local M = {}

function M.setup()
    require("format").setup {
        ["*"] = {
            { cmd = { "sed -i 's/[ \t]*$//'" } }, -- remove trailing whitespace
        },
        vim = {
            {
                cmd = {
                    function(file)
                        return string.format("lua-format -i %s", file)
                    end,
                },
                start_pattern = "^lua << EOF$",
                end_pattern = "^EOF$",
            },
        },
        vimwiki = {
            {
                cmd = { "prettier -w --parser babel" },
                start_pattern = "^{{{javascript$",
                end_pattern = "^}}}$",
            },
        },
        lua = {
            {
                cmd = {
                    function(file)
                        return string.format("stylua --config-path=/data/xine/stylua.toml %s", file)
                    end,
                },
            },
        },
        go = {
            {
                cmd = { "golines -m 120 -w" },
                tempfile_postfix = ".tmp",
            },
        },
        markdown = {
            { cmd = { "prettier -w" } },
            {
                cmd = { "black" },
                start_pattern = "^```python$",
                end_pattern = "^```$",
                target = "current",
            },
        },
        cpp = {
            {
                cmd = {
                    function(file)
                        return string.format("clang-format -i %s", file)
                    end,
                },
            },
        },
        c = {
            {
                cmd = {
                    function(file)
                        return string.format("clang-format -i %s", file)
                    end,
                },
            },
        },
        proto = {
            {
                cmd = {
                    function(file)
                        return string.format("clang-format -i %s", file)
                    end,
                },
            },
        },
    }
end

return M
