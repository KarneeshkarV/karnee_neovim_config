return {
  "ojroques/nvim-osc52",
  config = function()
    local osc52 = require("osc52")
    osc52.setup{
      max_length = 0,           -- Maximum length of selection (0 for no limit)
      silent = false,           -- Show message on successful copy
      trim = false,             -- Don't trim text before copy
      tmux_passthrough = true,  -- Use tmux passthrough (requires tmux 3.2+)
    }

    -- Auto-copy on yank to system clipboard
    vim.api.nvim_create_autocmd('TextYankPost', {
      callback = function()
        if vim.v.event.operator == 'y' then
          local text = vim.fn.getreg('"')
          osc52.copy(text)
        end
      end
    })

    -- Custom keymaps for explicit OSC52 copy
    vim.keymap.set('n', '<leader>y', osc52.copy_operator, {expr = true, desc = 'OSC52 copy operator'})
    vim.keymap.set('n', '<leader>yy', '<leader>y_', {remap = true, desc = 'OSC52 copy line'})
    vim.keymap.set('v', '<leader>y', osc52.copy_visual, {desc = 'OSC52 copy visual'})
  end
}

