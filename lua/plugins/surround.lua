return {
  {
    "kylechui/nvim-surround",
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end,
    keys = {
      { '<leader>"', 'ysiw"', desc = 'Surround word with "', remap = true },
      { "<leader>'", "ysiw'", desc = "Surround word with '", remap = true },
      { "<leader>`", "ysiw`", desc = "Surround word with `", remap = true },
      { "<leader>(", "ysiw(", desc = "Surround word with (", remap = true },
      { "<leader>{", "ysiw{", desc = "Surround word with {", remap = true },
    },
  },
}
