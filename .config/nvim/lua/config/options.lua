-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.clipboard = ""

-- reload files automatically when changed externally (when git branch changes for example)
-- https://stackoverflow.com/questions/62100785/auto-reload-file-and-in-neovim-and-auto-reload-nerbtree
-- doesn't work rn
vim.o.autoread = true
vim.api.nvim_create_autocmd({ "BufEnter", "CursorHold", "CursorHoldI", "FocusGained" }, {
  command = "if mode() != 'c' | checktime | endif",
  pattern = { "*" },
})

-- add ansbile filetype
vim.filetype.add({
  pattern = {
    [".*%.ansible%.yaml"] = "ansible",
    [".*%.ansible%.yml"] = "ansible",
  },
})

-- add yaml filetype whenver a filetype of ansible is opened
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ansible",
  callback = function()
    vim.bo.filetype = "yaml"
  end,
})

vim.g.autoformat = false
