return {
    "Mofiqul/dracula.nvim",
    name = "dracula",
    priority = 1000,
    config = function()
        local colors = require("dracula").colors()
        require("dracula").setup({
            transparent_bg = true,
            overrides = {
                NeoTreeNormal = { fg = colors.fg, bg = colors.menu, },
                NeoTreeNormalNC = { fg = colors.fg, bg = colors.menu, },
                SignColumn = { bg = colors.bg, },
                FoldColumn = { bg = colors.bg, },
                LineNr = { fg = colors.comment, bg = colors.bg },
                TroubleNormal = { bg = colors.menu },
                -- TroubleFile = { bg = colors.menu },
                TroubleIndent = { bg = colors.menu },
                TroubleFoldIcon = { bg = colors.menu },
                -- TroubleCount = { bg = colors.menu },
            },
        })
        vim.cmd.colorscheme("dracula")
    end,
}
