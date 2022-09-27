vim.api.nvim_create_autocmd("BufWritePost", {
	pattern = "*.snipppets",
	command = "CmpUltisnipsReloadSnippets",
    group = vim.api.nvim_create_augroup('nvimcmp', {clear = true})
})

vim.api.nvim_create_autocmd("User", {
	pattern = "AlphaReady",
	command = "set laststatus=0 | set showtabline=0 | set nofoldenable | autocmd BufUnload <buffer> set showtabline=2 | set laststatus=2",
    group = vim.api.nvim_create_augroup('alpha', {clear = true})
})

vim.api.nvim_create_autocmd({"WinEnter", "BufRead", "BufNewFile"}, {
	pattern = "*",
	command = "if &ft != 'alpha' | call CleanEmptyBuffers() | endif",
    group = 'alpha'
})


