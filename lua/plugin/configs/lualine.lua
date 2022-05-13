local colors = {
    yellow = "#ECBE7B",
    cyan = "#008080",
    darkblue = "#081633",
    green = "#98be65",
    orange = "#FF8800",
    violet = "#a9a1e1",
    magenta = "#c678dd",
    blue = "#51afef",
    red = "#ec5f67",
}

local M = {}

function M.setup()
    local gps = require("nvim-gps")
    gps.setup {
        icons = {
            ["class-name"] = " ", -- Classes and class-like objects
            ["function-name"] = " ", -- Functions
            ["method-name"] = " ", -- Methods (functions inside class-like objects)
            ["container-name"] = " ", -- Containers (example: lua tables)
            ["tag-name"] = "炙", -- Tags (example: html tags)
        },
        separator = " ",
        depth = 2,
        depth_limit_indicator = " ",
    }

    require("lualine").setup {
        options = {
            icons_enabled = true,
            theme = "modus-vivendi",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
            always_divide_middle = true,
        },
        sections = {
            lualine_a = { "mode" },
            lualine_b = {
                "branch",
                {
                    "diff",
                    colored = true,
                    diff_color = {
                        added = { fg = "#98c379", bg = "#434343" },
                        modified = { fg = "#e5c07b", bg = "#434343" },
                        removed = { fg = "#e06c75", bg = "#434343" },
                    },
                },
                { "diagnostics", sources = { "nvim_diagnostic" } },
            },
            lualine_c = {
                { "filename", path = 1 },
            },
            lualine_x = {
                { gps.get_location, cond = gps.is_available, color = { fg = "#bff745" } },
                {
                    function()
                        local msg = "No Active Lsp"
                        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
                        local clients = vim.lsp.get_active_clients()
                        if next(clients) == nil then
                            return msg
                        end
                        for _, client in ipairs(clients) do
                            local filetypes = client.config.filetypes
                            if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
                                return client.name
                            end
                        end
                        return msg
                    end,
                    icon = "",
                    color = { fg = colors.blue, gui = "bold" },
                },
                "encoding",
                "filetype",
            },
            lualine_y = { "progress" },
            lualine_z = { "location" },
        },
        inactive_sections = {
            lualine_a = {},
            lualine_b = {},
            lualine_c = { { "filename", path = 1 } },
            lualine_x = { "location" },
            lualine_y = {},
            lualine_z = {},
        },
        tabline = {},
        extensions = {},
    }
end

return M
