vim.api.nvim_create_user_command(
	"WipeReg",
	"for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor",
	{ bang = false }
)
