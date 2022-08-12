if not pcall(require, "luasnip") then
  return
end

require("luasnip.loaders.from_vscode").lazy_load({
	include = nil, -- Load all languages
	exclude = {},
})
