local ui = require 'harpoon.ui'
local mark = require 'harpoon.mark'

return {
  vim.keymap.set('n', '<leader>a', mark.add_file, { desc = '[A]dd current file to Harpoon' }),
  vim.keymap.set('n', '<leader>m', ui.toggle_quick_menu, { desc = 'Show Harpoon [M]enu' }),

  vim.keymap.set('n', '<leader>n', function()
    ui.nav_file(1)
  end, { desc = 'Add file to [N] letter of the keyboard' }),
  vim.keymap.set('n', '<leader>e', function()
    ui.nav_file(2)
  end, { desc = 'Add file to [E] letter of the keyboard' }),
  vim.keymap.set('n', '<leader>i', function()
    ui.nav_file(3)
  end, { desc = 'Add file to [I] letter of the keyboard' }),
  vim.keymap.set('n', '<leader>o', function()
    ui.nav_file(4)
  end, { desc = 'Add file to [O] letter of the keyboard' }),
}
