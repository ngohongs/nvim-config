return {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
        "MunifTanjim/nui.nvim",
        -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
    },
    opts = {
        filesystem = {
            filtered_items = {
                visible = true,
                hide_dotfiles = false,
                hide_gitignored = true,
                never_show = {
                    ".git",
                },
            },
        },
    },
    config = function(_, opts)
        vim.keymap.set("n", "<leader>fs", ":Neotree toggle<CR>", {})
        require("neo-tree").setup(opts)
    end,
}
