local HIGHLIGHTS = {
  { highlight = "RainbowRed", color = "#E06C75" },
  { highlight = "RainbowOrange", color = "#D19A66" },
  { highlight = "RainbowYellow", color = "#E5C07B" },
  { highlight = "RainbowGreen", color = "#98C379" },
  { highlight = "RainbowBlue", color = "#61AFEF" },
  { highlight = "RainbowCyan", color = "#56B6C2" },
  { highlight = "RainbowViolet", color = "#C678DD" },
}

local function get_highlight_names()
  local keyset = {}
  for i, highlight in pairs(HIGHLIGHTS) do
    keyset[i] = highlight.highlight
  end
  return keyset
end

return {
  "lukas-reineke/indent-blankline.nvim",
  opts = { indent = { highlight = get_highlight_names() } },
  config = function(plugin, opts)
    local hooks = require("ibl.hooks")
    hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
      for _, highlight in pairs(HIGHLIGHTS) do
        vim.api.nvim_set_hl(0, highlight.highlight, { fg = highlight.color })
      end
    end)
    vim.g.rainbow_delimiters = { highlight = get_highlight_names() }

    -- `plugin.main` is "ibl"
    require(plugin.main).setup(opts)
    require("ibl").setup({
      indent = {
        char = "▏",
        tab_char = "▏",
        highlight = get_highlight_names(),
      },
      scope = {
        show_start = false,
        show_end = false,
      },
    })

    -- sync rainbow-delimiters with indent-blankline colors
    hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)

    -- hide first tab/space marks
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_space_indent_level)
    hooks.register(hooks.type.WHITESPACE, hooks.builtin.hide_first_tab_indent_level)
  end,
}
