return {
  "nvim-neo-tree/neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        hide_dotfiles = false, -- Show dotfiles
        hide_hidden = false, -- Show hidden files (like .* files)
        hide_by_name = {}, -- Don't hide files by name
        hide_by_pattern = {}, -- Don't hide files by pattern
      },
    },
  },
}
