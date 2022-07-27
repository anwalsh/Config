require("navigator").setup({
	default_mapping = false,
	on_attach = function(client, bufnr)
		if client.resolved_capabilities.document_formatting then
			vim.cmd("autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_sync()")
		end
	end,
})
