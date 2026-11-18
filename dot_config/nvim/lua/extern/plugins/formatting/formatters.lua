local oxfmt_filetypes = {
	"javascript",
	"javascriptreact",
	"typescript",
	"typescriptreact",
	"json",
	"jsonc",
	"json5",
	"css",
	"scss",
	"less",
	"graphql",
	"toml",
	"yaml",
	"markdown",
	"html",
	"vue",
}

local prettier_filetypes = {
	"astro",
	"svelte",
	"mdx",
	"markdown.mdx",
	"handlebars",
	"hbs",
	"angular",
	"mjml",
}

local formatters_by_ft = {}

for _, filetype in ipairs(oxfmt_filetypes) do
	formatters_by_ft[filetype] = { "oxfmt", "prettier", stop_after_first = true }
end

for _, filetype in ipairs(prettier_filetypes) do
	formatters_by_ft[filetype] = { "prettier" }
end

return formatters_by_ft
