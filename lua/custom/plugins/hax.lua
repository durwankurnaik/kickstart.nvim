return {
  -- Function to find directory and open it in current tmux window
  vim.api.nvim_create_user_command('FindAndOpenDir', function()
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'

    require('telescope.builtin').find_files {
      prompt_title = 'Find Directory',
      cwd = os.getenv 'HOME',
      hidden = true,
      attach_mappings = function(prompt_bufnr)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if selection then
            local dir = vim.fn.fnamemodify(selection[1], ':h')
            vim.cmd('cd ~/' .. dir)
            -- Clear and redraw the buffer to show new directory contents
            vim.cmd 'edit .'
          end
        end)
        return true
      end,
    }
  end, {}),

  -- Function to find directory and open it in new tmux window
  vim.api.nvim_create_user_command('FindAndOpenDirNewWindow', function()
    local actions = require 'telescope.actions'
    local action_state = require 'telescope.actions.state'

    require('telescope.builtin').find_files {
      prompt_title = 'Find Directory (New Window)',
      cwd = os.getenv 'HOME',
      hidden = true,
      attach_mappings = function(prompt_bufnr, map)
        actions.select_default:replace(function()
          actions.close(prompt_bufnr)
          local selection = action_state.get_selected_entry()
          if selection then
            local dir = vim.fn.fnamemodify(selection[1], ':h')
            -- Create new tmux window and change to selected directory
            os.execute(string.format('tmux new-window "cd ~/%s && nvim"', dir))
          end
        end)
        return true
      end,
    }
  end, {}),

  -- Keybindings
  vim.keymap.set('n', '<leader>pc', ':FindAndOpenDir<CR>', { desc = '[P]roject opened in [C]urrent tmux window' }),
  vim.keymap.set('n', '<leader>pn', ':FindAndOpenDirNewWindow<CR>', { desc = '[P]roject opened in [N]ew tmux window' }),
}
