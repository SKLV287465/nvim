return {
  -- LSP
  
    {
        "neovim/nvim-lspconfig",
        dependencies = {
        { "williamboman/mason.nvim", config = true },
        { "williamboman/mason-lspconfig.nvim" },
        { "hrsh7th/cmp-nvim-lsp" },
        },
        config = function()
        local mason = require("mason")
        local mason_lspconfig = require("mason-lspconfig")
        local lspconfig = vim.lsp.config
        local cmp_lsp = require("cmp_nvim_lsp")

        mason.setup()

        mason_lspconfig.setup({
            ensure_installed = { "rust_analyzer", "lua_ls" },
        })

        local capabilities = cmp_lsp.default_capabilities()
        vim.lsp.config("clangd", {
            capabilities = capabilities,
        })
        vim.lsp.enable("clangd")
        end,
    },

  -- Autocompletion
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",
    },
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")

      cmp.setup({
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },

        mapping = cmp.mapping.preset.insert({
          ["<C-Space>"] = cmp.mapping.complete(),
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
          ["<Tab>"] = cmp.mapping.select_next_item(),
          ["<S-Tab>"] = cmp.mapping.select_prev_item(),
        }),

        sources = {
          { name = "nvim_lsp" },
          { name = "luasnip" },
        },
      })
    end,
  },
}
