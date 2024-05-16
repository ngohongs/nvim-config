return {
	"kevinhwang91/nvim-ufo",
	event = "VeryLazy",
	dependencies = "kevinhwang91/promise-async",
	config = function()
		vim.opt.foldcolumn = "1" -- '0' is not bad
		vim.opt.foldlevel = 99 -- Using ufo provider need a large value, feel free to decrease the value
		vim.opt.foldlevelstart = 99
		vim.opt.foldenable = true
		vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

		-- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
		vim.keymap.set("n", "zR", require("ufo").openAllFolds)
		vim.keymap.set("n", "zM", require("ufo").closeAllFolds)
		-- Peak Fold
		vim.keymap.set("n", "zP", function()
			local winid = require("ufo").peekFoldedLinesUnderCursor()
			if not winid then
				vim.lsp.buf.hover()
			end
		end, { desc = "Peek Fold" })

		-- Option 3: treesitter as a main provider instead
		-- (Note: the `nvim-treesitter` plugin is *not* needed.)
		-- ufo uses the same query files for folding (queries/<lang>/folds.scm)
		-- performance and stability are better than `foldmethod=nvim_treesitter#foldexpr()`
		require("ufo").setup({
			provider_selector = function(bufnr, filetype, buftype)
				return { "treesitter", "indent" }
			end,
		})
	end,
}
