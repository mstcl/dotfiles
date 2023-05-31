local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local bo = vim.bo
local cmd = vim.cmd

local nvimcmp = augroup("nvimcmp", { clear = true })
autocmd({ "BufWritePost" }, {
	pattern = "*.snipppets",
	group = nvimcmp,
	command = "CmpUltisnipsReloadSnippets",
})

local alpha = augroup("alpha", { clear = true })
autocmd({ "User" }, {
	pattern = "AlphaReady",
	group = alpha,
	command = "set laststatus=0 | set showtabline=0 | set nofoldenable | autocmd BufUnload <buffer> set showtabline=2 | set laststatus=3",
})
autocmd({ "StdinReadPre" }, {
	pattern = "*",
	command = "let g:isReadingFromStdin = 1",
	group = alpha,
})

--[[ autocmd({ "VimEnter" }, {
	pattern = "*",
	group = alpha,
	callback = function()
		if vim.fn.argc() == 0 then
			vim.cmd("Alpha")
		end
	end,
}) ]]

autocmd({ "WinEnter", "BufRead", "BufNewFile" }, {
	pattern = "*",
	command = "if &ft != 'alpha' | call CleanEmptyBuffers() | endif",
	group = alpha,
})

local stay = augroup("stay", { clear = true })
autocmd({ "BufReadPost" }, {
	pattern = "*",
	group = stay,
	command = "silent! normal! g`\"zv' zz",
})

local editing = augroup("editing", { clear = true })
autocmd({ "BufEnter" }, {
	pattern = "*",
	group = editing,
	command = "setlocal formatoptions-=cro",
})

local outline = augroup("outline", { clear = true })
autocmd({ "BufEnter" }, {
	pattern = "*",
	group = outline,
	command = "if (winnr(\"$\") == 1 && &filetype =~# 'Outline') | q | endif",
})

local highlight_yank = augroup("highlight_yank", { clear = true })
autocmd({ "TextYankPost" }, {
	pattern = "*",
	group = highlight_yank,
	command = 'silent! lua vim.highlight.on_yank{"IncSearch", 1000}',
})

local filetypes = augroup("filetypes", { clear = true })
autocmd({ "BufReadPost" }, {
	pattern = "*.rasi",
	group = filetypes,
	command = "set filetype=css",
})
autocmd({ "BufReadPost" }, {
	pattern = "*.ipynb",
	group = filetypes,
	command = "set filetype=python",
})
autocmd({ "BufReadPost" }, {
	pattern = "*.conf",
	group = filetypes,
	command = "set filetype=config",
})

local mdoptions = augroup("mdoptions", { clear = true })
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.md", "*.markdown", "*.tex" },
	group = mdoptions,
	command = "set nolist | setlocal spell | inoremap <silent> <C-L>  <c-g>u<Esc>[s1z=`]a<c-g>u",
})
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = { "*.md", "*.markdown" },
	group = mdoptions,
	command = "call MathAndLiquid()",
})

local indentft = augroup("indentft", { clear = true })
local indentgroup = {
	"*.vim",
	"*.ipynb",
	"*.tex",
	"*.py",
	"*.lua",
	"*.cpp",
	"*.ssh",
	"*.sh",
	"*.ini",
	"*.conf",
	"*.html",
	"*.json",
	"*.toml",
	"*.zsh",
	"*.yaml",
	"*.xml",
	"*.xml",
	"*.c",
	"*.h",
	"*.hpp",
	"*.rs",
	"*.js",
	"*config*",
	"*rc",
}
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = indentgroup,
	group = indentft,
	command = "silent! IndentBlanklineEnable",
})
autocmd({ "BufNewFile", "BufRead" }, {
	pattern = indentgroup,
	group = indentft,
	command = "nnoremap <silent> zA zA:IndentBlanklineRefresh<CR> | nnoremap <silent> za za:IndentBlanklineRefresh<CR> | nnoremap <silent> zm :lua require('ufo').closeFoldsWith() require('indent_blankline').refresh()<CR> | nnoremap <silent> zM :lua require('ufo').closeAllFolds() require('indent_blankline').refresh()<CR> | nnoremap <silent> zc zc:IndentBlanklineRefresh<CR> | nnoremap <silent> zC zC:IndentBlanklineRefresh<CR> | nnoremap <silent> zr :lua require('ufo').openFoldsExceptKinds() require('indent_blankline').refresh()<CR> | nnoremap <silent> zR :lua require('ufo').openAllFolds() require('indent_blankline').refresh()<CR> | nnoremap <silent> zo zo:IndentBlanklineRefresh<CR> | nnoremap <silent> zO zO:IndentBlanklineRefresh<CR>",
})

local floaterm = augroup("floaterm", { clear = true })
autocmd({ "Filetype" }, {
	pattern = "floaterm",
	group = floaterm,
	command = "set nonumber | set norelativenumber",
})

local procsearch = augroup("procsearch", { clear = true })
autocmd({ "CmdLineLeave" }, {
	pattern = "*",
	group = procsearch,
	command = "let b:cmdtype = expand('<afile>') | if (b:cmdtype == '/' || b:cmdtype == '?') | call timer_start(200, 'ProcessSearch') | endif",
})

local telescope = augroup("telescope", { clear = true })
autocmd({ "Filetype" }, {
	pattern = "TelescopePrompt",
	group = telescope,
	callback = function()
		require("cmp").setup.buffer({ completion = { autocomplete = false } })
	end,
})

local showpaste = augroup("showpaste", { clear = true })
autocmd({ "InsertLeave", "InsertEnter" }, {
	pattern = "*",
	group = showpaste,
	command = "call ShowPaste()",
})

local barbecue = augroup("barbecue", { clear = true })

autocmd({ "WinResized", "BufWinEnter", "CursorHold", "InsertLeave" }, {
	pattern = {"*.lua", "*.python", "*.tex", "*.vim", "*.sh", "*.cpp"},
	group = barbecue,
	callback = function()
		require("barbecue.ui").update()
	end,
})

autocmd({
	"BufWinLeave",
	"BufLeave",
	"QuitPre",
	"FocusLost",
	"InsertLeave"},
	{
		pattern = "?*", -- pattern required for some events
		callback = function()
			if not bo.readonly and vim.fn.expand("%") ~= "" and bo.buftype == "" and bo.filetype ~= "gitcommit" then
				cmd.update(vim.fn.expand("%:p"))
			end
		end,
	}
)

local autochdir = augroup("autochdir", { clear = true })

autocmd("BufWinEnter", {
	group = "autochdir",
	pattern = "?*",
	callback = function()
		local ignoredFT = { "gitcommit", "NeogitCommitMessage", "DiffviewFileHistory", "" }
		if not bo.modifiable or vim.tbl_contains(ignoredFT, bo.filetype) or not (vim.fn.expand("%:p"):find("^/")) then
			return
		end
		cmd.cd(vim.fn.expand("%:p:h"))
	end,
})

local wordcount = augroup("wordcount", { clear = true })

autocmd("Filetype", {
	group = "wordcount",
	pattern = "markdown",
	callback = function()
		require("section-wordcount").wordcounter({})
	end,
})
