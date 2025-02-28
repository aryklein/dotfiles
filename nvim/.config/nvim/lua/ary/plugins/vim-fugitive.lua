return {
  'tpope/vim-fugitive',
  cmd = { 'Git', 'Gstatus', 'Gcommit', 'Gdiff', 'Gblame' },
  event = { "BufReadPre", "BufNewFile" },
}
