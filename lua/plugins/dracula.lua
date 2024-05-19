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
                
                LineNr = { fg = colors.comment, bg = colors.menu },
                SignColumn = { bg = colors.menu },
                FoldColumn = { fg = colors.comment, bg = colors.menu },
                GitSignsAdd = { fg = colors.bright_green, bg = colors.menu },
                GitSignsChange = { fg = colors.cyan, bg = colors.menu },
                GitSignsDelete = { fg = colors.bright_red, bg = colors.menu },
                DiagnosticSignError = { fg = colors.red, bg = colors.bg },
                DiagnosticSignWarn = { fg = colors.yellow, bg = colors.bg },
                DiagnosticSignInfo = { fg = colors.cyan, bg = colors.bg },
                DiagnosticSignHint = { fg = colors.cyan, bg = colors.bg },
            }
        })

        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function()
                vim.cmd("hi DiagnosticSignError guifg=" .. colors.red .. " guibg=" .. colors.menu)
                vim.cmd("hi DiagnosticSignWarn guifg=" .. colors.yellow .. " guibg=" .. colors.menu)
                vim.cmd("hi DiagnosticSignInfo guifg=" .. colors.cyan .. " guibg=" .. colors.menu)
                vim.cmd("hi DiagnosticSignHint guifg=" .. colors.cyan .. " guibg=" .. colors.menu)
            end
        })

        vim.cmd.colorscheme("dracula")
    end,
    lazy = false,
    priority = 1000,
}
