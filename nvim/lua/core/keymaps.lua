-- Diagnostics
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = "Open diagnostic float" })

vim.keymap.set('n', '<leader>fv', function()
  require('telescope.builtin').find_files({
    attach_mappings = function(_, map)
      map('i', '<CR>', require('telescope.actions').select_vertical)
      map('n', '<CR>', require('telescope.actions').select_vertical)
      return true
    end
  })
end)

vim.keymap.set('n', '<leader>fh', function()
  require('telescope.builtin').find_files({
    attach_mappings = function(_, map)
      map('i', '<CR>', require('telescope.actions').select_horizontal)
      map('n', '<CR>', require('telescope.actions').select_horizontal)
      return true
    end
  })
end)


