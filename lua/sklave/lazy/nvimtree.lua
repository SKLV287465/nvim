return {
  {
    "nvim-tree/nvim-tree.lua",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },

    cmd = { "NvimTreeToggle", "NvimTreeOpen" },

    keys = {
      { "<leader>e", "<cmd>NvimTreeToggle<CR>", desc = "Toggle file tree" },
    },

    opts = {
      view = {
        width = 30,
        relativenumber = true,
      },

      renderer = {
        indent_markers = {
          enable = true,
        },
        icons = {
          show = {
            git = true,
            file = true,
            folder = true,
            folder_arrow = true,
          },
        },
      },

      filters = {
        dotfiles = false,
      },

      git = {
        enable = true,
      },
    },

    config = function(_, opts)
      require("nvim-tree").setup(opts)
    end,
  },
}