return {
  "akinsho/toggleterm.nvim",
  opts = {
    persist_mode = false,
  },
  keys = {
    {
      "<leader>z",
      "<cmd>ToggleTerm size=20 dir=. direction=horizontal<cr>",
      desc = "Open a horizontal terminal at the Desktop directory",
    },
  },
}
