local M = {}

function M.setup()
    require("neogen").setup {
        enabled = true, --if you want to disable Neogen
        input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
    }
end

return M
