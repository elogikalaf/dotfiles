-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local diagnostics_errors_only = false
local saved_diagnostic_config = nil

local function diagnostics_config_errors_only(value, enable_if_unset)
  if value == false or (value == nil and not enable_if_unset) then
    return value
  end

  local config = type(value) == "table" and vim.deepcopy(value) or {}
  config.severity = { min = vim.diagnostic.severity.ERROR }
  return config
end

vim.keymap.set("n", "<leader>uE", function()
  diagnostics_errors_only = not diagnostics_errors_only

  if diagnostics_errors_only then
    saved_diagnostic_config = vim.deepcopy(vim.diagnostic.config())
    local errors_only_config = vim.deepcopy(saved_diagnostic_config)

    errors_only_config.virtual_text = diagnostics_config_errors_only(saved_diagnostic_config.virtual_text, true)
    errors_only_config.signs = diagnostics_config_errors_only(saved_diagnostic_config.signs, true)
    errors_only_config.underline = diagnostics_config_errors_only(saved_diagnostic_config.underline, true)
    errors_only_config.float = diagnostics_config_errors_only(saved_diagnostic_config.float, true)
    errors_only_config.virtual_lines = diagnostics_config_errors_only(saved_diagnostic_config.virtual_lines, false)

    vim.diagnostic.config(errors_only_config)
    vim.notify("Diagnostics: errors only")
  else
    vim.diagnostic.config(saved_diagnostic_config)
    saved_diagnostic_config = nil
    vim.notify("Diagnostics: all severities")
  end
end, { desc = "Toggle Diagnostics Errors Only" })
