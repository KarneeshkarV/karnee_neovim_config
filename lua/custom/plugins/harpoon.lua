return {
  {
    -- Harpoon plugin
    'ThePrimeagen/harpoon',
    name = 'harpoon',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
    },
    config = function()
      -- Load Telescope extension for Harpoon marks
      require('telescope').load_extension 'harpoon'

      vim.keymap.set('n', '<leader>hh', ':Telescope harpoon marks<CR>', { desc = 'Harpoon [M]arks (Telescope)' })

      -- Add current file to Harpoon
      vim.keymap.set('n', '<leader>ha', ':lua require("harpoon.mark").add_file()<CR>', { desc = 'Harpoon Add File' })

      -- Toggle Harpoon quick menu
      vim.keymap.set('n', '<leader>ht', ':lua require("harpoon.ui").toggle_quick_menu()<CR>', { desc = 'Harpoon Toggle Menu' })

      -- Jump directly to Harpoon mark 1–3 using commands
      vim.keymap.set('n', '<C-1>', ':lua require("harpoon.ui").nav_file(1)<CR>', { desc = 'Harpoon File 1' })
      vim.keymap.set('n', '<C-2>', ':lua require("harpoon.ui").nav_file(2)<CR>', { desc = 'Harpoon File 2' })
      vim.keymap.set('n', '<C-3>', ':lua require("harpoon.ui").nav_file(3)<CR>', { desc = 'Harpoon File 3' })

      -- (Optional) Extend mappings for marks 4–9
      for i = 4, 9 do
        vim.keymap.set('n', '<C-' .. i .. '>', (':lua require("harpoon.ui").nav_file(' .. i .. ')<CR>'), { desc = 'Harpoon File ' .. i })
      end
    end,
  },
}
