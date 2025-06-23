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
      local map = vim.keymap.set

 
      -- Load Telescope extension for Harpoon marks
      require('telescope').load_extension('harpoon')

      -- Harpoon keymaps
      map('n', '<leader>hh',
          ':Telescope harpoon marks<CR>',
          { desc = 'Harpoon [M]arks (Telescope)', silent = true })
      map('n', '<leader>ha',
          ':lua require("harpoon.mark").add_file()<CR>',
          { desc = 'Harpoon Add File', silent = true })
      map('n', '<leader>ht',
          ':lua require("harpoon.ui").toggle_quick_menu()<CR>',
          { desc = 'Harpoon Toggle Menu', silent = true })

      -- Jump to Harpoon files 1–3
      map('n', '<C-1>',
          ':lua require("harpoon.ui").nav_file(1)<CR>',
          { desc = 'Harpoon File 1', silent = true })
      map('n', '<C-2>',
          ':lua require("harpoon.ui").nav_file(2)<CR>',
          { desc = 'Harpoon File 2', silent = true })
      map('n', '<C-3>',
          ':lua require("harpoon.ui").nav_file(3)<CR>',
          { desc = 'Harpoon File 3', silent = true })

      for i = 4, 9 do
        map('n', '<C-' .. i .. '>',
            ':lua require("harpoon.ui").nav_file(' .. i .. ')<CR>',
            { desc = 'Harpoon File ' .. i, silent = true })
      end
    end,
  },
}
