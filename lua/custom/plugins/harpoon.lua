local ui = require 'harpoon.ui'
local mark = require 'harpoon.mark'

return {
  vim.keymap.set('n', '<leader>a', mark.add_file),
  vim.keymap.set('n', '<leader>m', ui.toggle_quick_menu),

  vim.keymap.set('n', '<leader>n', function()
    ui.nav_file(1)
  end),
  vim.keymap.set('n', '<leader>e', function()
    ui.nav_file(2)
  end),
  vim.keymap.set('n', '<leader>i', function()
    ui.nav_file(3)
  end),
  vim.keymap.set('n', '<leader>o', function()
    ui.nav_file(4)
  end),
}
