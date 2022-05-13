local M = {}

-- vim.o   general setting
-- vim.g   global variables
-- vim.env environment variables
-- vim.wo  window-scoped options
-- vim.bo  buffer-scoped options
local general = vim.o
local global = vim.g
local window = vim.wo

function M.setup()
    -- tty fast
    general.ttyfast = true

    -- utf8
    global.encoding = "utf-8"
    general.fencs = "utf-8,gbk,big5,cp936,gb18030,gb2312,utf-16"

    -- 行号
    window.number = true

    -- 高亮所在行
    window.cursorline = true

    -- 高亮所在列
    window.cursorcolumn = true

    -- 显示左侧图标指示列
    window.signcolumn = "yes"

    -- 缩进4个空格等于一个Tab
    general.tabstop = 4
    general.softtabstop = 4
    general.shiftround = true

    -- >> << 时移动长度
    general.shiftwidth = 4

    -- 新行对齐当前行，空格替代tab
    general.expandtab = true
    general.autoindent = true
    general.smartindent = true

    -- 搜索大小写不敏感，除非包含大写
    general.ignorecase = true
    general.smartcase = true

    -- 搜索不要高亮
    general.hlsearch = true

    -- 边输入边搜索
    general.incsearch = true

    -- 使用增强状态栏后不再需要 vim 的模式提示
    general.showmode = false

    -- 命令行高为1
    general.cmdheight = 1

    -- 当文件被外部程序修改时，自动加载
    general.autoread = true

    -- 禁止折行
    general.wrap = false

    -- 允许隐藏被修改过的buffer
    general.hidden = true

    -- 鼠标支持
    general.mouse = "n"

    -- 自动变更当前目录
    general.autochdir = true

    -- 禁止创建备份文件
    general.backup = false
    general.writebackup = false
    general.swapfile = false

    -- smaller updatetime
    general.updatetime = 100

    -- 等待mappings
    general.timeoutlen = 500

    -- split window 从下边和右边出现
    general.splitbelow = true
    general.splitright = true

    -- 自动补全不自动选中
    global.completeopt = "menu,menuone,noselect"

    -- 样式
    general.background = "dark"
    general.termguicolors = true

    -- 不可见字符的显示，这里只把空格显示为一个点
    general.list = false

    -- 补全增强
    general.wildmenu = true

    -- Dont' pass messages to |ins-completin menu|
    general.shortmess = general.shortmess .. "c"
    general.pumheight = 10

    -- backspace
    general.backspace = "indent,eol,start"

    -- 显示当前光标位置
    general.ruler = true

    -- 将制表符扩展为空格
    general.expandtab = true
end

return M
