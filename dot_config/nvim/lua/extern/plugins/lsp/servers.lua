local gh = require("utils.gh").gh

local function mdx_typescript_sdk(root_dir)
	local project_sdk = require("lspconfig.util").get_typescript_server_path(root_dir)
	if project_sdk ~= "" then
		return project_sdk
	end

	local bundled = vim.fn.glob(
		vim.fs.joinpath(
			vim.fn.stdpath("data"),
			"mason",
			"packages",
			"vtsls",
			"**",
			"typescript",
			"lib",
			"typescript.js"
		),
		false,
		true
	)[1]

	return bundled and vim.fs.dirname(bundled) or nil
end

local servers = {

	vtsls = {}, -- TypeScript/JavaScript (also covers Node)
	astro = {},
	mdx_analyzer = {
		filetypes = { "mdx", "markdown.mdx" },
		get_language_id = function(_, _)
			return "mdx"
		end,
		before_init = function(_, config)
			local tsdk = mdx_typescript_sdk(config.root_dir)
			if tsdk then
				config.init_options.typescript.tsdk = tsdk
			end
		end,
	},
	cssls = {},
	emmet_language_server = {},
	yamlls = {},
	jsonls = {},
	oxlint = {},
	eslint = {},

	stylua = {},
	lua_ls = {
		on_init = function(client)
			client.server_capabilities.documentFormattingProvider = false
			if client.workspace_folders then
				local path = client.workspace_folders[1].name
				if
					path ~= vim.fn.stdpath("config")
					and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
				then
					return
				end
			end

			local current_settings = client.config.settings
			client.config.settings.Lua = vim.tbl_deep_extend("force", current_settings.Lua, {
				runtime = {
					version = "LuaJIT",
					path = { "lua/?.lua", "lua/?/init.lua" },
				},
				workspace = {
					checkThirdParty = false,
					library = vim.api.nvim_get_runtime_file("", true),
				},
			})
		end,
		settings = {
			Lua = {
				format = { enable = false },
			},
		},
	},
}

vim.pack.add({ gh("neovim/nvim-lspconfig") })

for name, server in pairs(servers) do
	vim.lsp.config(name, server)
	vim.lsp.enable(name)
end

return servers
