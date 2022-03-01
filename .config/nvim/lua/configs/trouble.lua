local present, trouble = pcall(require, "trouble")
if not present then
   return
end

trouble.setup{
    mode = "document_diagnostics",
    padding = false,
}
