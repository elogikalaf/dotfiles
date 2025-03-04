return {
  {
    "github/copilot.vim",
    config = function()
      -- Disable the default Tab mapping for Copilot
      vim.g.copilot_no_tab_map = true

      -- Use another key combination for accepting Copilot suggestions (Ctrl+J in this example)
      vim.keymap.set("i", "<C-J>", 'copilot#Accept("\\<CR>")', {
        expr = true,
        replace_keycodes = false,
      })

      -- Optional: Disable Copilot for specific filetypes if needed
      -- vim.g.copilot_filetypes = {
      --   ["*"] = true,
      --   ["neo-tree"] = false,
      -- }
    end,
  },
}
