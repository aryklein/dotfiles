return {
    { -- telescope
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        lazy = true,
        cmd = { 'Telescope' },
        keys = {
            { "<leader>ff", "<cmd>Telescope find_files<cr>", desc = "Find Files" },
            { "<leader>fg", "<cmd>Telescope live_grep<cr>", desc = "Grep" },
            { "<leader>fb", "<cmd>Telescope buffers<cr>", desc = "Buffers" },
            { "<leader>fh", "<cmd>Telescope help_tags<cr>", desc = "Help Tags" },
        },
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
    },
    { -- telescope file browser
        "nvim-telescope/telescope-file-browser.nvim",
        lazy = true,
        dependencies = {
            "nvim-telescope/telescope.nvim",
            "nvim-lua/plenary.nvim"
        }
    }
}
