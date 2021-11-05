local present, zen = pcall(require, "zen-mode")
if not present then
   return
end

zen.setup {
    window = {
        backdrop = 1;
        width = 90,
        options = {
            signcolumn = "no",
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
            enabled = false,
            font = "+4",
        },
    },
}
