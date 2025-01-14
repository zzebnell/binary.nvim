local M = {}

function M.setup(opts)
  if vim.g.colors_name then
    vim.cmd("hi clear")
    vim.cmd("syntax reset")
  end
  vim.o.termguicolors = true
  vim.g.colors_name = "binary"

  local style = opts.style
  local colors = opts.colors
  if style == "dark" then
    colors = {
      fg = colors.bg,
      bg = colors.fg,
    }
  end

  local hls = vim.api.nvim_get_hl(0, {})
  vim.api.nvim_set_hl(0, "Binary", {
    fg = colors.fg,
    bg = colors.bg,
    force = true,
  })
  for hl, _ in pairs(hls) do
    if hl == "Normal" then
      -- Set `Normal` separately so the bg color is preserved
      vim.api.nvim_set_hl(0, "Normal", {
        fg = colors.fg,
        bg = colors.bg,
      })
    elseif hl ~= "Binary" then
      vim.api.nvim_set_hl(0, hl, { link = "Binary" })
    end
  end

  local reversed_hls = vim.tbl_deep_extend(
    "force",
    opts.use_default_reversed_group and require("binary.groups.reversed") or {},
    opts.reversed_group or {}
  )

  vim.api.nvim_set_hl(0, "BinaryReversed", {
    fg = colors.bg,
    bg = colors.fg,
  })

  for hl, value in pairs(reversed_hls) do
    if value and hl ~= "BinaryReversed" then
      vim.api.nvim_set_hl(0, hl, { link = "BinaryReversed", force = true })
    end
  end

  -- TODO: add terminal colors
  return colors, hls, opts
end

return M
