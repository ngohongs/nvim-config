return {
    "Mofiqul/dracula.nvim",
    config = function()
        local colors = require("dracula").colors()
        require("dracula").setup({
            overrides = {
                TroubleNormal = { bg = colors.menu },
                TroubleIndent = { bg = "NONE" },
                TroubleFoldIcon = { bg = "NONE" },
                -- TroubleText = { gui = "NONE" },
            }
        })

        vim.cmd.colorscheme("dracula")
    end,
}
