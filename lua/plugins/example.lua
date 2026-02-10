return {
  {
    "akinsho/flutter-tools.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    config = function(_, opts)
      require("flutter-tools").setup(opts)
    end,
    opts = {
      widget_guides = { enabled = true },
      dev_log = { enabled = false },
      hot_reload = true,
      lsp = {
        color = { enabled = true },
        settings = {
          showTodos = true,
          completeFunctionCalls = true,
        },
      },
    },
  },

  {
    "folke/tokyonight.nvim",
    priority = 1000,
    opts = { style = "moon" },
  },

  {
    "mason-org/mason.nvim",
    opts = {
      ensure_installed = {
        "google-java-format",
        "php-cs-fixer",
        "intelephense",
        "stylua",
      },
    },
  },

  {
    "nvim-telescope/telescope.nvim",
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        sorting_strategy = "ascending",
      },
    },
  },

  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        focus = "list",
        indent = 0,
        filters = {
          git_ignored = false,
          dotfiles = false,
        },
        layout = {
          layout = {
            width = 40,
          },
        },
      },
    },
  },
}
