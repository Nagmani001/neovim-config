-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
-- Set a keybinding to show LSP info
vim.keymap.set("n", "<leader>li", ":LspInfo<CR>", { desc = "LSP Info" })

-- always use vim.keymap.set

-- Move to window using <leader> + hjkl keys
vim.keymap.set("n", "<leader>h", "<C-w>h", { desc = "Go to Left Window" })
vim.keymap.set("n", "<leader>j", "<C-w>j", { desc = "Go to Lower Window" })
vim.keymap.set("n", "<leader>k", "<C-w>k", { desc = "Go to Upper Window" })
vim.keymap.set("n", "<leader>l", "<C-w>l", { desc = "Go to Right Window" })

-- keymaps for prisma
vim.api.nvim_set_keymap("n", "<leader>pm", ":terminal npx prisma migrate dev<CR>", { noremap = true })
vim.api.nvim_set_keymap("n", "<leader>ps", ":terminal npx prisma studio<CR>", { noremap = true })

--use a single esc press to bring me back to normal mode
-- Simple Esc behavior to always go to Normal mode
vim.keymap.set({ "i", "v", "c" }, "<Esc>", "<Esc>", { noremap = true, silent = true })

-- to make saving files easier
-- Map ; and : to both enter command mode
vim.api.nvim_set_keymap("n", ";", ":", { noremap = true, silent = true }) -- ; enters command mode
vim.api.nvim_set_keymap("n", ":", ":", { noremap = true, silent = true }) -- : enters command mode

vim.keymap.set("i", "H", "H", { noremap = true, silent = true })
vim.keymap.set("i", "J", "J", { noremap = true, silent = true })
vim.keymap.set("i", "K", "K", { noremap = true, silent = true })
vim.keymap.set("i", "L", "L", { noremap = true, silent = true })
