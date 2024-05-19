return {
    "Mofiqul/dracula.nvim",
    config = function()
        local colors = require("dracula").colors()
        require("dracula").setup({
        })
        vim.cmd.colorscheme("dracula")
    end,
}
