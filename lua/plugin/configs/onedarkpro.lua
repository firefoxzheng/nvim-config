local M = {}

function M.setup()
    local onedarkpro = require("onedarkpro")

    onedarkpro.setup {
        theme = function()
            if vim.o.background == "dark" then
                return "onedark_vivid"
            else
                return "onelight"
            end
        end,
        colors = {
            bg = "#222B39",
        }, -- Override default colors. Can specify colors for "onelight" or "onedark" themes
        hlgroups = {
            Search = { fg = "#050505", bg = "#b9db21" },
            IncrSearch = { link = "Search" },
            CursorLine = { style = "underline" },
            HlSearchNear = { link = "IncSearch" },
            HlSearchLens = { link = "WildMenu" },
            HlSearchLensNear = { link = "IncSearch" },
            HlSearchFloat = { link = "IncSearch" },
        }, -- Override default highlight groups
        styles = {
            --strings = "NONE", -- Style that is applied to strings
            --comments = "NONE", -- Style that is applied to comments
            --keywords = "NONE", -- Style that is applied to keywords
            functions = "bold", -- Style that is applied to functions
            --variables = "NONE", -- Style that is applied to variables
        },
        options = {
            bold = true, -- Use the themes opinionated bold styles?
            italic = true, -- Use the themes opinionated italic styles?
            underline = true, -- Use the themes opinionated underline styles?
            undercurl = true, -- Use the themes opinionated undercurl styles?
            cursorline = false, -- Use cursorline highlighting?
            transparency = false, -- Use a transparent background?
        },
    }

    onedarkpro.load()
end

return M
