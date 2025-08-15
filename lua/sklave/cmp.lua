-- lua/sklave/cmp.lua
local cmp = require("cmp")

-- If you use LuaSnip, keep these; otherwise you can remove the snippet section.
local has_luasnip, luasnip = pcall(require, "luasnip")

cmp.setup({
  snippet = has_luasnip and {
    expand = function(args) luasnip.lsp_expand(args.body) end,
  } or nil,

  mapping = {
    -- DO NOT use Tab/S-Tab
    ['<Tab>']   = nil,
    ['<S-Tab>'] = nil,

    -- Confirm with Enter only when menu is visible; otherwise insert newline
    ['<CR>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.confirm({ select = true })
      else
        fallback()
      end
    end, { "i", "s" }),

    -- Navigate completion items
    ['<C-n>'] = cmp.mapping.select_next_item(),
    ['<C-p>'] = cmp.mapping.select_prev_item(),

    -- Optional: manual completion
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
  },

  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    has_luasnip and { name = "luasnip" } or nil,
    { name = "buffer" },
    { name = "path" },
  }),
})

-- Autopairs integration (safe; doesn't touch <Tab>)
local cmp_autopairs = require("nvim-autopairs.completion.cmp")
cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
