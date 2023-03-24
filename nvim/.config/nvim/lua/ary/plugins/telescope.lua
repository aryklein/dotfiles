return {
  -- telescope
    'nvim-telescope/telescope.nvim',
    lazy = true,
    cmd = { 'Telescope' },
     dependencies = {
       'nvim-lua/plenary.nvim',
       { -- FZF sorter for telescope written in C
         'nvim-telescope/telescope-fzf-native.nvim',
          build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
       }
     },
     config = function()
       require("ary.telescope")
     end
}