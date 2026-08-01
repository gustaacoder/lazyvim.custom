return {
  {
    "vim-test/vim-test",
    dependencies = {
      "preservim/vimux",
    },
    keys = {
      { "<leader>tt", "<cmd>TestNearest<cr>", desc = "Test Nearest" },
      { "<leader>tT", "<cmd>TestFile<cr>", desc = "Test File" },
      { "<leader>ta", "<cmd>TestSuite<cr>", desc = "Test Suite" },
      { "<leader>tl", "<cmd>TestLast<cr>", desc = "Test Last" },
    },
    init = function()
      vim.g["test#php#runner"] = "pest"
      vim.g["test#php#pest#executable"] = "vendor/bin/pest"
      vim.g["test#strategy"] = "neovim"
    end,
  },
}
