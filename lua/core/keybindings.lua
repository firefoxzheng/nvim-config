-- 本地变量
local map = vim.api.nvim_set_keymap
local opt = { noremap = true, silent = false }
local M = {}

function M.setup()
    -- leader 为 ;
    vim.g.mapleader = ";"

    -- 行首和行尾
    map("n", "<leader>bb", "0", opt)
    map("n", "<leader>ee", "$", opt)

    -- 快速保存, 快速退出
    map("n", "<leader>ww", ":w<CR>", opt)
    map("n", "<leader>wq", ":wq<CR>", opt)

    -- visual模式下缩进代码
    map("v", "<", "<gv", opt)
    map("v", ">", ">gv", opt)

    ------------------------------------------------------------------
    -- windows 分屏快捷键
    map("n", "sv", ":vsp<CR>", opt)
    map("n", "sh", ":sp<CR>", opt)

    -- 关闭当前
    map("n", "sc", "<C-w>c", opt)
    -- 关闭其他
    map("n", "so", "<C-w>o", opt) -- close others

    -- alt + hjkl  窗口之间跳转
    map("n", "<C-n>", "<C-w><C-w>", opt)
    map("n", "<C-h>", "<C-w>h", opt)
    map("n", "<C-j>", "<C-w>j", opt)
    map("n", "<C-k>", "<C-w>k", opt)
    map("n", "<C-l>", "<C-w>l", opt)
    map("n", "<leader>cw", "<C-w>q", opt)
    map("n", "<F2>", ":vertical resize +3<CR>", opt)
    map("n", "<F1>", ":vertical resize -3<CR>", opt)

    -- close quickfix and location list
    map("n", "<F10>", ":ccl|lcl<CR>", opt)

    --------------------------------------------------------------------
    -- 插件快捷键
    -- anyjump
    map("n", "<leader>aa", ":AnyJump<CR>", opt)
    map("n", "<leader>ab", ":AnyJumpBack<CR>", opt)
    map("n", "<leader>al", ":AnyJumpLastResults<CR>", opt)

    -- barbar 左右切换
    map("n", "<F3>", ":BufferPrevious<CR>", opt)
    map("n", "<F4>", ":BufferNext<CR>", opt)
    map("n", "<", ":BufferMovePrevious<CR>", opt)
    map("n", ">", ":BufferMoveNext<CR>", opt)
    map("n", "<leader>bd", ":BufferClose<CR>", opt)
    map("n", "<leader>bp", ":BufferPick<CR>", opt)

    -- cheatsheet
    map("n", "<leader>hh", ":Cheatsheet<CR>", opt)

    -- floaterm
    map("n", "<leader>te", ":FloatermToggle<CR>", opt)
    map("t", "<leader>te", "<C-\\><C-n>:FloatermToggle<CR>", opt)

    -- hlslens
    map("n", "n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>", opt)
    map("n", "N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>", opt)
    map("n", "*", "*<Cmd>lua require('hlslens').start()<CR>", opt)
    map("n", "#", "#<Cmd>lua require('hlslens').start()<CR>", opt)
    map("n", "g*", "g*<Cmd>lua require('hlslens').start()<CR>", opt)
    map("n", "g#", "g#<Cmd>lua require('hlslens').start()<CR>", opt)
    map("n", "<leader>nh", ":noh<CR>", opt)

    -- markdown-preview
    map("n", "<C-p>", ":PreviewMarkdown tab<CR>", opt)

    -- format
    map("n", "=", ":Format<CR>", opt)
    map("v", "=", ":Format<CR>", opt)

    -- Telescope
    map("n", "<leader>ft", ":Telescope<CR>", opt)
    map("n", "<leader>ff", ":Telescope git_files<CR>", opt)
    map("n", "<leader>fd", ":Telescope find_files<CR>", opt)
    map("n", "<leader>fg", ":Telescope live_grep<CR>", opt)
    map("n", "<leader>fb", ":Telescope buffers<CR>", opt)
    map("n", "<leader>fc", ":Telescope lsp_document_symbols<CR>", opt)

    -- translator
    map("n", "<leader>tr", "<Plug>TranslateW", {})
    map("v", "<leader>tr", "<Plug>TranslateWV", {})

    -- vim-fswitch
    map("n", "<leader>sw", ":FSHere<CR>", opt)

    -- wildfire
    map("n", "<SPACE>", "<Plug>(wildfire-fuel)", {})
    map("v", "<S-SPACE>", "<Plug>(wildfire-water)", {})
    map("n", "<leader>vv", "<Plug>(wildfire-quick-select)", {})

    -- miniyank
    map("n", "p", "<Plug>(miniyank-autoput)", {})
    map("n", "P", "<Plug>(miniyank-autoPut)", {})
    map("n", "<leader>p", "<Plug>(miniyank-startput)", {})
    map("n", "<leader>P", "<Plug>(miniyank-startPut)", {})
    map("n", "<leader>n", "<Plug>(miniyank-cycle)", {})
    map("n", "<leader>N", "<Plug>(miniyank-cycleback)", {})
    map("n", "<leader>c", "<Plug>(miniyank-tochar)", {})
    map("n", "<leader>l", "<Plug>(miniyank-toline)", {})
    map("n", "<leader>b", "<Plug>(miniyank-toblock)", {})

    -- lsp-config
    map("n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opt)
    map("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opt)
    map("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opt)
    map("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opt)
    map("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opt)
    map("n", "<leader>wa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opt)
    map("n", "<leader>wr", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opt)
    map("n", "<leader>wl", "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", opt)
    map("n", "<leader>D", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opt)
    map("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opt)
    map("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opt)
    map("n", "<leader>=", "<cmd>lua vim.lsp.buf.formatting()<CR>", opt)
    map("n", "<leader>fs", "<cmd>lua vim.lsp.buf.document_symbol()<CR>", opt)

    -- trouble
    map("n", "<leader>tt", "<cmd>TroubleToggle<cr>", opt)
    map("n", "cw", "<cmd>TroubleToggle workspace_diagnostics<cr>", opt)
    map("n", "ca", "<cmd>TroubleToggle document_diagnostics<cr>", opt)
    map("n", "gR", "<cmd>TroubleToggle lsp_references<cr>", opt)

    -- neogen
    map("n", "<Leader>ng", ":lua require('neogen').generate()<CR>", opt)

    -- code-action-menu
    map("n", "<F9>", ":CodeActionMenu<CR>", opt)

    -- pounce
    map("n", "ss", "<cmd>Pounce<CR>", opt)
    map("n", "SS", "<cmd>PounceRepeat<CR>", opt)
    map("v", "ss", "<cmd>Pounce<CR>", opt)
end

return M
