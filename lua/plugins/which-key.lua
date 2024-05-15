return { -- Useful plugin to show you pending keybinds.
    'folke/which-key.nvim',
    event = 'VimEnter', -- Sets the loading event to 'VimEnter'
    opts = {
        preset = {
            operators = true,
            motions = true,
            text_object = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
        operators = { gc = "Comments" },
    },
    config = function(_, opts) -- This is the function that runs, AFTER loading
        require('which-key').setup(opts)
    end,
}
