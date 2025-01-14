-- Configuration pattern reference from https://github.com/folke/tokyonight.nvim?tab=readme-ov-file (Apache 2.0 License)
local Config = require("binary.config")

local M = {}

function M.load(opts)
  opts = require("binary.config").extend(opts)

  local system_bg = vim.o.background
  local style_bg = opts.style
  if opts.style == "system" then
    opts = require("binary.config").extend({ style = system_bg })
  else
    if style_bg ~= "dark" then -- Ensure style_bg is legal, defaults to "light"
      style_bg = "light"
    end
  end

  -- TODO: add plugins support

  if system_bg ~= style_bg then
    vim.g.background = style_bg
  end

  return require("binary.theme").setup(opts)
end

M.setup = Config.setup

return M
