local global = vim.g

local M = {}

function M.setup()
    global.floaterm_rootmarkers = { ".git", ".gitignore" }
    global.floaterm_width = 0.8
    global.floaterm_height = 0.8
end

return M
