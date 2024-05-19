return {
    "Mofiqul/dracula.nvim",
    config = function()
        local colors = require("dracula").colors()
        require("dracula").setup({
            overrides = {
                TroubleNormal = { bg = colors.menu },
                -- TroubleFile = { bg = colors.menu },
                TroubleIndent = { bg = "NONE" },
                TroubleFoldIcon = { bg = "NONE" },
                -- TroubleCount = { bg = colors.menu },
                -- TroubleText = { gui = "NONE" },
            }
        })

        -- vim.cmd[[hi TroubleText guibg=none]]
        vim.cmd.colorscheme("dracula")
        vim.cmd[[highlight TroubleText guibg=none]]
    end,
}
