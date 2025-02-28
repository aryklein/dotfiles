local telescope = require('telescope')

telescope.setup({
  defaults = {
    prompt_prefix = '󰜴 ',
    selection_caret = ' ',
    file_sorter = require('telescope.sorters').get_fuzzy_file,
    generic_sorter = require('telescope.sorters').get_generic_fuzzy_sorter,
    set_env = { ['COLORTERM'] = 'truecolor' }, -- default = nil,
    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    file_ignore_patterns = {'.git/*', '.env/*', '%.jpeg', '%.png', '%.jpg', '%.mkv'},
    color_devicons = false,
    use_less = true,
    -- sort results by name from top to bottom
    sorting_strategy = 'ascending',
  },
  extensions = {
    fzf = {
      fuzzy = true,                    -- false will only do exact matching
      override_generic_sorter = true,  -- override the generic sorter
      override_file_sorter = true,     -- override the file sorter
      case_mode = 'smart_case',        -- or "ignore_case" or "respect_case"
                                       -- the default case_mode is "smart_case"
    },
  },
})

-- To get fzf loaded and working with telescope, you need to call
-- load_extension, somewhere after setup function:
telescope.load_extension('fzf')

-- Telescope extension for browsing the file system, and picking files.
telescope.load_extension('file_browser')