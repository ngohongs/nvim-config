return {
    "kevinhwang91/nvim-ufo",
    dependencies = {
        "kevinhwang91/promise-async",
        "luukvbaal/statuscol.nvim",
        "lewis6991/gitsigns.nvim",
    },
    config = function()
        vim.o.foldcolumn = "1" -- '0' is not bad
        vim.o.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
        vim.o.foldlevelstart = 99
        vim.o.foldenable = true
        vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

        local symbols = { Error = "󰅙", Info = "󰋼", Hint = "󰌵", Warn = "" }

        for name, icon in pairs(symbols) do
            local hl = "DiagnosticSign" .. name
            vim.fn.sign_define(hl, { text = icon, numhl = hl, texthl = hl })
        end

        vim.keymap.set("n", "zp", function()
            local winid = require("ufo").peekFoldedLinesUnderCursor()
            if not winid then
                vim.lsp.buf.hover()
            end
        end)

        vim.api.nvim_set_hl(0, "Folded", { bg = "#44475a", fg = "#f8f8f2" })

        local handler = function(virtText, lnum, endLnum, width, truncate)
            local newVirtText = {}
            local suffix = (" 󰁂 %d "):format(endLnum - lnum)
            local sufWidth = vim.fn.strdisplaywidth(suffix)
            local targetWidth = width - sufWidth
            local curWidth = 0
            for _, chunk in ipairs(virtText) do
                local chunkText = chunk[1]
                local chunkWidth = vim.fn.strdisplaywidth(chunkText)
                if targetWidth > curWidth + chunkWidth then
                    table.insert(newVirtText, chunk)
                else
                    chunkText = truncate(chunkText, targetWidth - curWidth)
                    local hlGroup = chunk[2]
                    table.insert(newVirtText, { chunkText, hlGroup })
                    chunkWidth = vim.fn.strdisplaywidth(chunkText)
                    -- str width returned from truncate() may less than 2nd argument, need padding
                    if curWidth + chunkWidth < targetWidth then
                        suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
                    end
                    break
                end
                curWidth = curWidth + chunkWidth
            end
            table.insert(newVirtText, { suffix, "MoreMsg" })
            return newVirtText
        end
        -- Option 3: treesitter as a main provider instead
        -- (Note: the `nvim-treesitter` plugin is *not* needed.)
        -- ufo uses the same query files for folding (queries/<lang>/folds.scm)
        -- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
        require("ufo").setup({
            fold_virt_text_handler = handler,
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        })

        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "trouble", "neo-tree" },
            callback = function()
                require("ufo").detach()
                vim.opt_local.foldenable = false
                vim.wo.foldcolumn = "0"
            end
        })

        local builtin = require("statuscol.builtin")
        require("statuscol").setup({
            ft_ignore = {
                "neo-tree", "trouble",
            },
            bt_ingore = {
                "neo-tree", "trouble",
            },
            segments = {
                { text = { "%s" }, click = "v:lua.ScSa" },
                { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
                {
                    text = { builtin.lnumfunc, " " },
                    condition = { true, builtin.not_empty },
                    click = "v:lua.ScLa",
                }
            },
        })
    end,
}
