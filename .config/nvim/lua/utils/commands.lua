local create = vim.api.nvim_create_user_command
create("WipeReg", "for i in range(34,122) | silent! call setreg(nr2char(i), []) | endfor", { bang = false })
--[[ create("PeekOpen", require("peek").open, {})
create("PeekClose", require("peek").close, {}) ]]
create("Explore", "Telescope file_browser path=%:p:h", {})
