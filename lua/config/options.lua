-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.number = true
vim.opt.relativenumber = true

-- Window bar
vim.opt.winbar = "%=%m %f"

-- Indenting
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Folding
vim.opt.foldmethod = "expr"
vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false

-- Text wrapping
vim.opt.wrap = false

-- Backups
vim.opt.swapfile = false
vim.opt.backup = false

-- Hilights
vim.opt.hlsearch = true
vim.opt.incsearch = true

-- Minimum number of screen lines above and below cursor
vim.opt.scrolloff = 8

-- Open help in a new buffer instead of a vsplit
vim.api.nvim_create_autocmd("BufWinEnter", {
  pattern = "*",
  callback = function(event)
    if vim.bo[event.buf].filetype == "help" then
      vim.cmd.only()
      vim.bo.buflisted = true
    end
  end,
})
