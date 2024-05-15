return {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    dependencies = { 
        "nvim-lua/plenary.nvim"
    },
    config = function()
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc = 'Find files' })
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, { desc = 'Find with grep' })
        vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc = 'Find keymaps' })
        vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc = 'Find in help'})

        vim.keymap.set('n', '<leader>fn',
            function()
                builtin.find_files { cwd = vim.fn.stdpath 'config' }
            end,
            { desc = 'Find Neovim files' })

    end
}
