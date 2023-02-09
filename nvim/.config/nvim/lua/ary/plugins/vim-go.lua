-- Go language support for Neovim
return {
  'fatih/vim-go',
  build = ':GoUpdateBinaries',
  ft = 'go',
}
