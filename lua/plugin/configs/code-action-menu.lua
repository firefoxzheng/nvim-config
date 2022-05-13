local global = vim.g

local M = {}

function M.setup()
    global.code_action_menu_window_border = "single"
    global.code_action_menu_show_details = false
end

return M
