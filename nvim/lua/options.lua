vim.opt.termguicolors = true

-- Buffer behavior
vim.opt.hidden = true
vim.opt.relativenumber = true
vim.opt.history = 2000
vim.opt.hlsearch = true
vim.opt.incsearch = true
vim.opt.laststatus = 2
vim.opt.backup = false
vim.opt.swapfile = false
vim.opt.wrap = false
vim.opt.number = true
vim.opt.ruler = true
vim.opt.showcmd = true
vim.opt.showtabline = 2
vim.opt.wildmenu = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Editor performance options
vim.opt.ttyfast = true
vim.opt.lazyredraw = true

-- Syntax and colors
vim.cmd("syntax on")
vim.cmd("colorscheme unokai")
vim.opt.background = "dark"

-- Completion
--vim.opt.completeopt = { "longest", "menuone", "popup" }
vim.opt.completeopt = { "menu", "preview" }

-- UI Options
vim.opt.cursorline = true
vim.cmd("highlight clear CursorLine")
vim.cmd("highlight CursorLineNR cterm=bold ctermfg=yellow gui=bold")

vim.opt.listchars = { tab = ">-", trail = ".", eol = "$", extends = "#" }
vim.opt.backspace = { "indent", "eol", "start" }
vim.opt.timeoutlen = 500

-- Quickfix window
--vim.cmd("botright cwindow")

-- Statusline (can be replaced by plugins)
vim.opt.statusline = [[[%n] %<%.99f %h%w%m%r%y%= %l[%v],%c %L]]

vim.opt.fillchars:append("vert:│")
vim.cmd("highlight VertSplit ctermbg=NONE guibg=NONE guifg=grey")

-- Undo settings
vim.opt.undofile = true
vim.opt.undolevels = 1000
vim.opt.undoreload = 10000
vim.opt.undodir = vim.fn.expand("~/.config/nvim/undodir")
if vim.fn.isdirectory(vim.opt.undodir:get()[1]) == 0 then
  vim.fn.mkdir(vim.opt.undodir:get()[1], "p", 0700)
end

-- Indentation
vim.opt.autoindent = true
vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.copyindent = true

-- Scrolling
vim.opt.scrolloff = 5
vim.opt.sidescrolloff = 80

-- File encoding
vim.opt.fileencoding = "utf-8"
vim.opt.fileencodings = { "utf-8", "latin1" }

-- Match trailing whitespace
vim.cmd([[match ExtraWhitespace /\s\+$\| \+\ze\t/]])

-- Show errors inline
vim.diagnostic.config({
  virtual_text = true,   -- inline error messages
  signs = true,          -- shows in margin/signcolumn
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})
