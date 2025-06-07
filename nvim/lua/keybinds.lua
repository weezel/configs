vim.g.mapleader = ";"

-- Mappings
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Reload config
vim.keymap.set("n", "<leader><leader>v", function()
  dofile(vim.env.MYVIMRC)
end, { desc = "Source init.lua" })

-- Custom mappings
map("n", "<leader>a", ":g/pattern/s/$/<CR>", opts)
map("n", "<leader>m", ":g/pattern/normal @q<CR>", opts)
map("n", "<leader>b", ":e#<CR>", opts)
map("n", "<leader>,", ":bd<CR>", opts)

-- Diff mode mappings
if vim.opt.diff:get() then
  map("n", "<leader>1", "diffput", opts)
  map("n", "<leader>2", "diffget", opts)
  vim.opt.foldminlines = 99999
end

-- Insert mode enhancements
map("i", "<C-c>", "<Esc>", opts)
map("n", "<C-CR>", "i<CR><Esc>", opts)
map("i", "<A-h>", "<Left>", opts)
map("i", "<A-j>", "<Down>", opts)
map("i", "<A-k>", "<Up>", opts)
map("i", "<A-l>", "<Right>", opts)
map("n", "<C-A-j>", "<PageDown>", opts)
map("n", "<C-A-k>", "<PageUp>", opts)
map("i", "<C-A-j>", "<ESC><C-E>i", opts)
map("i", "<C-A-k>", "<ESC><C-Y>i", opts)
map("n", "<C-h>", ":bprev<CR>", opts)
map("n", "<C-l>", ":bnext<CR>", opts)

-- Readline-like bindings
map("i", "<C-a>", "<esc>I", opts)
map("i", "<C-e>", "<esc>A", opts)
map("i", "<C-d>", "<Del>", opts)
map("i", "<A-f>", "<C-Right>", opts)
map("i", "<A-b>", "<C-Left>", opts)

-- Window movement
map("n", "<M-h>", "<C-w>h", opts)
map("n", "<M-j>", "<C-w>j", opts)
map("n", "<M-k>", "<C-w>k", opts)
map("n", "<M-l>", "<C-w>l", opts)

-- Quickfix
map("n", "<C-n>", ":cn<CR>", opts)
map("n", "<C-p>", ":cp<CR>", opts)

-- Paste without moving cursor
map("n", "p", "p`[", { noremap = true })
map("n", "P", "P`[", { noremap = true })

-- Auto complete
vim.api.nvim_set_keymap("i", "<C-Space>", "<C-x><C-o>", { noremap = true, silent = true })

-- Select auto completed value
vim.api.nvim_set_keymap("i", "<CR>", "pumvisible() ? '<C-y>' : '<CR>'", { expr = true, noremap = true })

-- Show function signature
vim.api.nvim_set_keymap("i", "<C-p>", "v:lua.vim.lsp.buf.signature_help()", { noremap = true, silent = true, expr = true })

-- Disable F1 help, use it to toggle fullscreen scrolloff
map("n", "<F1>", ":let &scrolloff=999-&scrolloff<CR>", opts)
map("i", "<F1>", "<ESC>:let &scrolloff=999-&scrolloff<CR>a", opts)

-- Show info about the error
vim.keymap.set("n", "<C-q>", vim.diagnostic.open_float, { noremap = true, desc = "Show diagnostic" })

-- Visual mode search
vim.cmd [[
function! s:VSetSearch(cmdtype)
  let temp = @s
  norm! gv"sy
  let @/ = '\V' . substitute(escape(@s, a:cmdtype.'\'), '\n', '\\n', 'g')
  let @s = temp
endfunction
xnoremap * :<C-u>call <SID>VSetSearch('/')<CR>/<C-R>=@/<CR><CR>
xnoremap # :<C-u>call <SID>VSetSearch('?')<CR>?<C-R>=@/<CR><CR>
]]
