-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
-- Add any additional autocmds here
--auto cmd for setting modifiable true when a terminal buffer is opened
vim.cmd([[
    augroup Terminal
        autocmd!
        autocmd TermOpen * setlocal modifiable
    augroup END
]])

--for prisma lsp support
vim.api.nvim_command("autocmd BufRead,BufNewFile *.prisma set filetype=prisma")
