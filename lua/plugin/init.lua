local plugin_modules = {
    "plugin.configs.packer_manage",
    "plugin.configs.anyjump",
    "plugin.configs.barbar",
    "plugin.configs.cheatsheet",
    "plugin.configs.code-action-menu",
    "plugin.configs.floaterm",
    "plugin.configs.format",
    "plugin.configs.gitsigns",
    "plugin.configs.hlslens",
    "plugin.configs.lightbulb",
    "plugin.configs.lsp-progress",
    "plugin.configs.lsp-servers",
    "plugin.configs.lsp-signature",
    "plugin.configs.lualine",
    "plugin.configs.markdown-preview",
    "plugin.configs.neogen",
    "plugin.configs.numb",
    "plugin.configs.nvim-cmp",
    "plugin.configs.nvim-colorizer",
    "plugin.configs.nvim-lastplace",
    "plugin.configs.nvim-treesitter",
    "plugin.configs.onedarkpro",
    "plugin.configs.pounce",
    "plugin.configs.quick-scope",
    "plugin.configs.telescope",
    "plugin.configs.trouble",
    "plugin.configs.vim-fswitch",
    "plugin.configs.wildfire",
}

local M = {}

function M.setup()
    for _, module in ipairs(plugin_modules) do
        require(module).setup()
    end
end

return M
