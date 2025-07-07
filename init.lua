-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")
require("config.lsp")

-- init.lua or cmp.lua (for nvim-cmp setup)
local cmp = require("cmp")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

-- Setup for nvim-cmp
cmp.setup({
  snippet = {
    expand = function(args)
      -- Using vsnip for snippets
      vim.fn["vsnip#anonymous"](args.body)
    end,
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" }, -- LSP source for autocompletion
    { name = "vsnip" }, -- Snippet-based autocompletion
    { name = "buffer" }, -- Buffer-based autocompletion (useful for searching within the current file)
    { name = "path" }, -- Path-based autocompletion
    { name = "cmdline" }, -- Cmdline autocompletion (useful for commands)
  }),
  mapping = {
    ["<Tab>"] = cmp.mapping.select_next_item(),
    ["<S-Tab>"] = cmp.mapping.select_prev_item(),
    ["<CR>"] = cmp.mapping.confirm({ select = true }),
  },
})

-- Rust-tools.nvim setup with nvim-cmp capabilities
require("rust-tools").setup({
  server = {
    capabilities = capabilities, -- Attach nvim-cmp capabilities to rust-analyzer
    on_attach = function(_, bufnr)
      local bufopts = { noremap = true, silent = true, buffer = bufnr }
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
      vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
    end,
    settings = {
      ["rust-analyzer"] = {
        assist = {
          importGranularity = "module",
          importPrefix = "by_self",
        },
        cargo = {
          loadOutDirsFromCheck = true,
        },
        procMacro = {
          enable = true,
        },
      },
    },
  },
})

require("venv-selector").setup()

-- Example for lazy.nvim
require("lazy").setup({
  {
    "jupyter-vim/jupyter-vim",
    config = function()
      -- Add any configuration needed for jupyter-vim here
    end,
  },
})
