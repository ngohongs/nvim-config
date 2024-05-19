return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("trouble").setup({
            indent_lines = false,
        })

        -- Setting group before doesn't work
        vim.cmd[[highlight TroubleText guibg=none]]
    end
}
