-- Ansible
vim.cmd [[
   autocmd BufNewFile,BufRead *.yaml,*.yml
     \ if search('hosts:\|tasks:\|loop:\|tags:', 'nw')
     \ |   set ft=yaml.ansible 
     \ |   set colorcolumn=160
     \ | endif
]]

-- Terraform and Hashicorp files
vim.cmd([[silent! autocmd! filetypedetect BufRead,BufNewFile *.tf]])
vim.cmd([[autocmd BufRead,BufNewFile *.hcl set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile .terraformrc,terraform.rc set filetype=hcl]])
vim.cmd([[autocmd BufRead,BufNewFile *.tf,*.tfvars set filetype=terraform]])
vim.cmd([[autocmd BufRead,BufNewFile *.tfstate,*.tfstate.backup set filetype=json]])

