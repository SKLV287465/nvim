vim.g.lightline = {
    active = {
    left = {
      { 'mode', 'paste' },
      { 'gitbranch', 'filename', 'modified' }
    }
  },
  component_function = {
    gitbranch = 'fugitive#head'
  }
}

