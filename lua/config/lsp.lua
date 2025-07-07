local lspconfig = require("lspconfig")

-- TypeScript Language Server
-- TypeScript Language Server setup with `tsserver`

lspconfig.tsserver.setup({
  on_attach = function(client, bufnr)
    -- Disable document formatting to avoid conflicts with other formatters (e.g., Prettier)
    client.resolved_capabilities.document_formatting = false

    -- You can add custom on_attach functions here (e.g., for key mappings, etc.)
    -- Example: vim.api.nvim_buf_set_keymap(bufnr, 'n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
  end,

  -- Enable tsserver filetypes
  filetypes = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
})

-- Lua Language Server
lspconfig.lua_ls.setup({
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }, -- Recognize 'vim' as a global variable
      },
    },
  },
})

-- First, ensure you have the nvim-treesitter plugin for syntax highlighting
require("nvim-treesitter.configs").setup({
  ensure_installed = { "prisma" }, -- Ensure Prisma parser is installed
  highlight = {
    enable = true, -- Enable highlighting for supported languages
  },
})

-- Now, configure Prisma LSP
local lspconfig = require("lspconfig")

lspconfig.prismals.setup({
  settings = {
    prisma = {
      prismaFmtBinPath = "/path/to/prisma-fmt", -- Optional, set path if needed
    },
  },
  on_attach = function(client, bufnr)
    -- You can also configure key mappings or custom actions here
    -- Example: Enable completion on tab
    local opts = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(bufnr, "i", "<Tab>", 'pumvisible() ? "<C-n>" : "<Tab>"', opts)
    vim.api.nvim_buf_set_keymap(bufnr, "i", "<S-Tab>", 'pumvisible() ? "<C-p>" : "<S-Tab>"', opts)

    -- Check for completion issues (set if any settings need to be added)
    if client.resolved_capabilities.completion then
      vim.cmd([[setlocal omnifunc=v:lua.vim.lsp.omnifunc]])
    end
  end,
})

--tailwind language server

lspconfig.tailwindcss.setup({
  on_attach = function(client, bufnr)
    -- Enable autocompletion
    local cmp = require("cmp")
    cmp.setup.buffer({
      sources = {
        { name = "nvim_lsp" },
      },
    })
  end,
})

--json language server

lspconfig.jsonls.setup({
  settings = {
    json = {
      schemas = {
        {
          description = "TypeScript Configuration",
          fileMatch = { "tsconfig.json" },
          url = "http://json.schemastore.org/tsconfig",
        },
      },
    },
  },
})
---- Rust LSP Setup
lspconfig.rust_analyzer.setup({
  on_attach = function(_, bufnr)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  end,
  settings = {
    ["rust-analyzer"] = {
      cargo = { allFeatures = true },
      checkOnSave = { command = "clippy" },
    },
  },
})

lspconfig.pyright.setup({
  settings = {
    python = {
      analysis = {
        autoSearchPaths = true,
        diagnosticMode = "workspace",
        useLibraryCodeForTypes = true,
      },
      pythonPath = vim.fn.exepath("python3"), -- Automatically detect Python
    },
  },
})

-- go lang language server

-- Add more LSP server configurations as needed
-- C++ LSP (clangd)
lspconfig.clangd.setup({
  on_attach = function(_, bufnr)
    -- Keybindings (customize as needed)
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
  end,
  cmd = {
    "clangd",
    "--background-index", -- Index in the background
    "--clang-tidy", -- Enable clang-tidy diagnostics
    "--header-insertion=never", -- Disable auto-inserting headers
  },
})
