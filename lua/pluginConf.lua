return {
  -- nvim-cmp and related sources
  { "hrsh7th/nvim-cmp" },
  { "hrsh7th/cmp-nvim-lsp" }, -- LSP source for nvim-cmp
  { "hrsh7th/cmp-vsnip" }, -- Snippet source for nvim-cmp
  { "hrsh7th/vim-vsnip" }, -- Snippet plugin

  -- LSP Config
  { "neovim/nvim-lspconfig" }, -- LSP configs

  -- Rust Tools
  {
    "simrat39/rust-tools.nvim",
    dependencies = { "neovim/nvim-lspconfig" },
    config = function()
      require("rust-tools").setup({
        server = {
          on_attach = function(_, bufnr)
            local bufopts = { noremap = true, silent = true, buffer = bufnr }
            vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
            vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
            vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
            vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)
          end,
        },
      })
    end,
  },

  {
    "mg979/vim-visual-multi",
    branch = "master",
    init = function()
      vim.g.VM_default_mappings = 1
    end,
    lazy = true,
  },

  -- Prisma LSP (kept as is)
  {
    "prisma/language-server",
    config = function()
      -- Configure Prisma LSP
      require("lspconfig").prismals.setup({
        settings = {
          prisma = {
            prismaFmtBinPath = "/path/to/prisma-fmt", -- Optional, if you need custom path
          },
        },
        capabilities = require("cmp_nvim_lsp").default_capabilities(),
      })
    end,
  },
}
