return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require 'nvim-treesitter.install'.compilers = { "clang", "gcc" }
        local configs = require("nvim-treesitter.configs")
        configs.setup({
            ensure_installed = {
                "vimdoc",
                "c",
                "cpp",
                "make",
                "cmake",
                "rust",
                "lua",
                "c_sharp",
            },
            highlight = { enable = true },
            indent = { enable = true },
        })
    end
}
