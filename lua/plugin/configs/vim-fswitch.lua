local M = {}

function M.setup()
    vim.cmd([[
        au! BufEnter *.cpp let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'
        au! BufEnter *.cc let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'
        au! BufEnter *.c let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'
        au! BufEnter *.h let b:fswitchdst = 'jce,cpp,cc,c' | let b:fswitchlocs = './'
        au! BufEnter *.jce let b:fswitchdst = 'h,hpp' | let b:fswitchlocs = './'
    ]])
end

return M
