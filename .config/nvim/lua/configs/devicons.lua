local present, icons = pcall(require, "nvim-web-devicons")
if not present then
   return
end

icons.setup {
    default = true,
    override = {
        ["default_icon"] = {
            icon = "",
            color = "#6d8086",
            name = "Default",
        }
    }
}

icons.set_default_icon('', '#6d8086')
