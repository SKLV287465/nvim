return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  lazy = false,  -- ensures it loads on startup
  config = function()
    -- this runs only after the plugin is available
    local ok, configs = pcall(require, "nvim-treesitter.configs")
    if not ok then
      return
    end

    configs.setup({
      ensure_installed = { "c", "lua" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end,
}


