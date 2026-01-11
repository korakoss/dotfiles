vim.opt.termguicolors = true

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Python provider for Molten REPL
vim.g.python3_host_prog = vim.fn.expand("~/dotfiles/nvim/.venv/bin/python")
