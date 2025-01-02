local opt = vim.opt -- for conciseness

opt.guicursor = "n-v-c-sm:block"
opt.conceallevel = 1 -- for obsidian nice rendering
vim.g.netrw_banner = 0 -- clears netrw header

-- line numbers
opt.relativenumber = true
opt.number = true

-- tabs and indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.expandtab = true
opt.autoindent = true

-- line wrapping
opt.wrap = true

-- search setting
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false
opt.incsearch = true

-- cursor line
opt.cursorline = true

-- appearance
opt.termguicolors = true
opt.background = "dark"
opt.signcolumn = "yes"

--backspace
opt.backspace = "indent,eol,start"

-- clipboard
-- opt.clipboard:append("unnamedplus")

-- split windows
opt.splitright = true
opt.splitbelow = true

-- extra
opt.scrolloff = 8
opt.colorcolumn = "120"

-- after getting undotree plugin
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

opt.iskeyword:append("-")
