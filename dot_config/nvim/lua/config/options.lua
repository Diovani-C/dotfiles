-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- Set invisible characters display
vim.opt.listchars = {
  eol = "↲",
  tab = "» ",
  trail = "·",
  extends = "<",
  precedes = ">",
  conceal = "┊",
  nbsp = "␣",
}

-- Disable anoing message
vim.g.lazyvim_check_order = false
