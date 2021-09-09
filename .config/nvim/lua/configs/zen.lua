local present, zen = pcall(require, "zen-mode")
if not present then
   return
end

zen.setup {
    window = {
        options = {
            signcolumn = "yes",
            number = false,
            relativenumber = false,
            cursorline = false,
            cursorcolumn = false,
            foldcolumn = "0",
            list = false,
        },
    },
    plugins = {
        gitsigns = { enabled = true },
        kitty = {
            enabled = true,
            font = "+4",
        },
    },
}
