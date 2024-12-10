return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  build = ":Copilot auth",
  event = "InsertEnter",
  opts = {
    filetypes = {
      markdown = true,
      help = true,
      yaml = true,
    },
  },
}
