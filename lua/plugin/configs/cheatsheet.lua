local M = {}

function M.setup()
    require("cheatsheet").setup {
        bundled_cheatsheets = true,
        bundled_plugin_cheatsheets = true,
        include_only_installed_plugins = true,
    }
end

return M
