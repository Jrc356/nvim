return {
  "zbirenbaum/copilot.lua",
  cmd = "Copilot",
  opts = function()
    require("copilot.api").status = require("copilot.status")
  end,
}
