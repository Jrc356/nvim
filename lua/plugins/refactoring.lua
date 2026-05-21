return {
  "ThePrimeagen/refactoring.nvim",
  dependencies = {
    "lewis6991/async.nvim",
  },
  opts = {},
  -- Overriding the default config to prevent LazyVim from
  -- trying to load the deprecated Telescope extension
  config = function(_, opts)
    require("refactoring").setup(opts)
  end,
}
