vim.g['incsearch#consistent_n_direction'] = 1
vim.g.vim_search_pulse_duration = 300

-- Pulses the first match after hitting the enter keyan
vim.cmd([[
    autocmd! User IncSearchExecute
    autocmd User IncSearchExecute :call search_pulse#Pulse()
]])
