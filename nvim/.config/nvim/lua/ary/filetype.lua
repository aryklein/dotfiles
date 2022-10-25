vim.cmd [[
   autocmd BufNewFile,BufRead *.yaml,*.yml
     \ if search('hosts:\|tasks:\|loop:\|tags:', 'nw')
     \ |   set ft=yaml.ansible 
     \ |   set colorcolumn=160
     \ | endif
]]
