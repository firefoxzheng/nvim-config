local M = {}

function M.setup()
    vim.g.wildfire_objects = { "i'", 'i"', "i)", "i]", "i}", "i>", "i`", "ip", "it" }
end

return M
