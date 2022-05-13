local global = vim.g

local M = {}

function M.setup() 
    global.any_jump_disable_default_keybindings = 1
    global.any_jump_list_numbers = 1
    global.any_jump_grouping_enabled = 1
    global.any_jump_search_prefered_engine = "ag"
    global.any_jump_results_ui_style = "filename_first"
    global.any_jump_window_width_ratio = 0.8
    global.any_jump_window_height_ratio = 0.9
    global.any_jump_max_search_results = 20
end

return M
