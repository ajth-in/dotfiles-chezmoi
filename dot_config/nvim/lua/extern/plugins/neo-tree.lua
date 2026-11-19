vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '*' },
  'https://github.com/nvim-lua/plenary.nvim',
  'https://github.com/MunifTanjim/nui.nvim',
}

vim.keymap.set('n', '<leader>e', '<Cmd>Neotree toggle reveal<CR>', {
  desc = 'Toggle NeoTree and reveal current file',
  silent = true,
})

local function copy_path(state, base)
  local node = state.tree:get_node()
  if not node or node.type == 'message' then
    return
  end

  local path = node.path
  if base == 'relative' then
    path = vim.fs.relpath(state.path, path) or vim.fn.fnamemodify(path, ':.')
    if path == '' then
      path = '.'
    end
  end

  vim.fn.setreg('+', path)
  vim.notify('Copied: ' .. path)
end

require('neo-tree').setup {
  filesystem = {
    commands = {
      copy_relative_path = function(state)
        copy_path(state, 'relative')
      end,
      copy_absolute_path = function(state)
        copy_path(state, 'absolute')
      end,
    },
    window = {
      mappings = {
        ['\\'] = 'close_window',
        ['Y'] = { command = 'copy_relative_path', desc = 'Copy relative path' },
        ['gY'] = { command = 'copy_absolute_path', desc = 'Copy absolute path' },
      },
    },
  },
}
