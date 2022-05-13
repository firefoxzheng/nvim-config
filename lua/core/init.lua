local core_modules = {
    "core.autocmd",
    "core.basic",
    "core.keybindings",
}

local M = {}

function M.setup()
    for _, module in ipairs(core_modules) do
        require(module).setup()
    end
end

return M
