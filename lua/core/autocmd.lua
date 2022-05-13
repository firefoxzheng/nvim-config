local cmd = vim.cmd
local M = {}

function M.setup()
    -- c, c++缩进变为2个空格
    cmd([[
        augroup indentgroup
            autocmd!
            au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c set tabstop=2
            au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c set shiftwidth=2
            au BufEnter *.h,*.hpp,*.cpp,*.cc,*.c set softtabstop=2
        augroup END
    ]])

    -- nvim true color
    cmd([[
        let $NVIM_TUI_ENABLE_TRUE_COLOR=1
    ]])

    -- highlight on yank
    cmd([[
        au TextYankPost * silent! lua vim.highlight.on_yank {timeout=300}
    ]])

    -- lightbulb
    cmd([[
        autocmd CursorHold,CursorHoldI * lua require'nvim-lightbulb'.update_lightbulb()
    ]])
end

return M
