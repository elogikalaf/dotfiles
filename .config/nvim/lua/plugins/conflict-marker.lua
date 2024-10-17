return {
  "rhysd/conflict-marker.vim",
  config = function()
    -- disable the default highlight group
    vim.g.conflict_marker_highlight_group = ""

    -- Include text after begin and end markers
    vim.g.conflict_marker_begin = "^<<<<<<<\\+ .*$"
    vim.g.conflict_marker_common_ancestors = "^|||||||\\+ .*$"
    vim.g.conflict_marker_end = "^>>>>>>>\\+ .*$"

    -- Set custom highlight colors
    vim.cmd([[
      highlight ConflictMarkerBegin guibg=#4a8150
      highlight ConflictMarkerOurs guibg=#754a81
      highlight ConflictMarkerTheirs guibg=#2f628e
      highlight ConflictMarkerEnd guibg=#3db330
      highlight ConflictMarkerCommonAncestorsHunk guibg=#281eba
    ]])
  end,
}
