return {
  'windwp/nvim-autopairs',
  event = "InsertEnter",
  config = function()
    require("nvim-autopairs").setup({
      check_ts = true,  -- Use treesitter for better context
      disable_filetype = { "TelescopePrompt" },
      -- Prevent breaking brackets across lines
      break_undo = true, -- switch for basic rule break undo sequence
      map_cr = true,
      map_complete = true,
      auto_select = true,
      insert_after_quote = true,
      map_char = {
        all = '(',
        tex = '{'
      },
      -- Don't add pairs if it already has a close pair in same line
      enable_check_bracket_line = false,
      -- Don't add pairs if the next char is alphanumeric
      ignored_next_char = [=[[%w%%%'%[%"%.%`%$]]=],
    })
    
    -- Integration with nvim-cmp if available
    local cmp_autopairs = require('nvim-autopairs.completion.cmp')
    local cmp = require('cmp')
    cmp.event:on(
      'confirm_done',
      cmp_autopairs.on_confirm_done()
    )
  end
}