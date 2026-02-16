return {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false, -- load at startup
    event = { "BufReadPost", "BufNewFile" },

    dependencies = {
      -- optional but commonly used
      "nvim-treesitter/nvim-treesitter-textobjects",
    },

    opts = {
      ensure_installed = {
        "c",
        "lua",
        "rust",
      },

      sync_install = false,
      auto_install = true,

      highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
      },

      indent = {
        enable = true,
      },
    },

    config = function(_, opts)
      local ok, configs = pcall(require, "nvim-treesitter.configs")
      if not ok then
        return
      end

      configs.setup(opts)
    end,
  },
}
