return {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function ()
        require("trouble").setup({})
        vim.cmd[[highlight TroubleText guibg=none]]
    end
}
