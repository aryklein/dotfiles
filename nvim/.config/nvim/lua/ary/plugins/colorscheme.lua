-- Nightfox color schemes
--return {
--    -- nightfox color scheme
--    'EdenEast/nightfox.nvim',
--    lazy = false, -- load on startup
--    priority = 52, -- make sure it loads before other plugins
--    config = function()
--        -- load the colorscheme here
--        vim.cmd('colorscheme carbonfox')
--    end
--}

-- Catppuccino color scheme
return {
    'catppuccin/nvim',
    name = 'catppuccin',
    priority = 1000,
    config = function()
        vim.cmd.colorscheme "catppuccin-mocha"
    end
}
