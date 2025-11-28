local gitsigns = require('gitsigns')

gitsigns.setup({
  on_attach = function(bufnr)
    local gs = package.loaded.gitsigns

    local function map(mode, l, r, opts)
      opts = opts or {}
      opts.buffer = bufnr
      vim.keymap.set(mode, l, r, opts)
    end

    -- Navigation
    map('n', ']c', function()
      if vim.wo.diff then return ']c' end
      vim.schedule(function() gs.next_hunk() end)
      return '<Ignore>'
    end, {expr = true})

    map('n', '[c', function()
      if vim.wo.diff then return '[c' end
      vim.schedule(function() gs.prev_hunk() end)
      return '<Ignore>'
    end, {expr = true})

    -- Actions
    map('n', '<leader>hp', gs.preview_hunk, { desc = 'Preview git hunk' })
    map('n', '<leader>hb', function() gs.blame_line({full = true}) end, { desc = 'Blame line' })
    map('n', '<leader>tb', gs.toggle_current_line_blame, { desc = 'Toggle line blame' })
    map('n', '<leader>hd', gs.diffthis, { desc = 'Diff this' })
  end,
})
