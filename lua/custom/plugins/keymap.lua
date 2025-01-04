return {
  -- File explorer
  vim.keymap.set('n', '<leader>pv', vim.cmd.Ex, { desc = '[P]roject [V]iew' }),

  -- Move lines up and down in visual mode
  vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv"),
  vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv"),

  -- Yank to system clipboard
  vim.keymap.set('n', '<leader>y', '"+yy', { noremap = true, silent = true }),
  vim.keymap.set('v', '<leader>y', '"+y', { noremap = true, silent = true }),

  -- Undotree remaps
  vim.keymap.set('n', '<leader>u', vim.cmd.UndotreeToggle),
  { desc = '[T]oggle UndoTree window' },
}
