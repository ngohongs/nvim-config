return {
    "nvim-treesitter/nvim-treesitter",
    dependencies = {
        {
            "nvim-treesitter/playground",
        },
    },
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.install").compilers = { "clang", "gcc" }
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            auto_install = true,
            ensure_installed = {
                "vimdoc",
                "c",
                "cpp",
                "make",
                "cmake",
                "rust",
                "lua",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })

        require("nvim-treesitter.configs").setup({
            playground = {
                enabled = true,
            }
        })
    end,
}
