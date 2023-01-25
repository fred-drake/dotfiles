-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = true
lvim.colorscheme = "lunar"

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
lvim.keys.insert_mode["jk"] = "<ESC>"
lvim.keys.visual_mode["jk"] = "<ESC>"
lvim.keys.normal_mode["x"] = '"_x'
lvim.keys.normal_mode["<Tab>"] = ":bnext<CR>"
lvim.keys.normal_mode["<S-Tab>"] = ":bprev<CR>"
-- lvim.keys.normal_mode["<leader>sm"] = ":MaximizerToggle<CR>"

lvim.builtin.which_key.mappings["x"] = { "<cmd>close<CR>", "Close split window" }
lvim.builtin.which_key.mappings["|"] = { "<C-w>v", "Split Vertically" }
lvim.builtin.which_key.mappings["-"] = { "<C-w>s", "Split Horizontally" }
lvim.builtin.which_key.mappings["m"] = { "<cmd>MarkdownPreviewToggle<CR>", "Markdown Preview" }
lvim.builtin.which_key.mappings["o"] = {
	name = "+SOPS",
	d = { "<cmd>!sops -d -i %<CR><CR>", "Decrypt file" },
	e = { "<cmd>!sops -e -i %<CR><CR>", "Encrypt file" },
}
lvim.builtin.which_key.mappings["K"] = { vim.lsp.buf.hover, "Hover Documentation" }

-- TODO: User Config for predefined plugins
-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = true
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.icons.show.git = false

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
	"bash",
	"c",
	"javascript",
	"json",
	"lua",
	"python",
	"typescript",
	"tsx",
	"css",
	"rust",
	"java",
	"yaml",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true

lvim.plugins = {
	{ "towolf/vim-helm" },
	{ "christoomey/vim-tmux-navigator" },
	{
		"iamcco/markdown-preview.nvim",
		run = "cd app && npm install",
		setup = function()
			vim.g.mkdp_filetypes = { "markdown" }
		end,
		ft = { "markdown" },
	},
	{ "pearofducks/ansible-vim" },
}

-- generic LSP settings
lvim.lsp.installer.setup.ensure_installed = {
	"ansiblels",
}

-- General VIM options
vim.opt.relativenumber = true
vim.opt.iskeyword:append("-")

-- -- set a formatter, this will override the language server formatting capabilities (if it exists)
local formatters = require("lvim.lsp.null-ls.formatters")
formatters.setup({
	{ command = "black", filetypes = { "python" } },
	{ command = "prettier", filetypes = { "javascript", "typescript", "typescriptreact", "yaml.ansible", "json" } },
	{ command = "golines", filetypes = { "go" } },
	{ command = "stylua", filetypes = { "lua" } },
})

-- -- set additional linters
local linters = require("lvim.lsp.null-ls.linters")
linters.setup({
	{ command = "flake8", filetypes = { "python" } },
	{ command = "golangci-lint", filetypes = { "go" } },
	{ command = "jsonlint", filetypes = { "json" } },
	{ command = "rubocop", filetypes = { "ruby" } },
})

-- manager setup
local managers = require("lvim.lsp.manager")
managers.setup("ansiblels")
managers.setup("yaml", {
	completion = true,
	schemas = {
		["https://raw.githubusercontent.com/yannh/kubernetes-json-schema/master/v1.20.5-standalone-strict/all.json"] = "/*.yaml",
	},
})

-- Set file types
vim.cmd("au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible")
vim.cmd("au BufRead,BufNewFile */templates/*.yaml,*/templates/*.tpl,*.gotmpl,helmfile*.yaml set filetype=helm")

-- Centers when paginating or searching
vim.cmd("nnoremap <C-d> <C-d>zz")
vim.cmd("nnoremap <C-u> <C-u>zz")
vim.cmd("nnoremap n nzzzv")
vim.cmd("nnoremap N Nzzzv")

-- Lazygit setup
-- Added custom parameters to use a config file in a normalized location among both Linux and MacOS
local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({
	cmd = "lazygit --use-config-file ~/.config/lazygit/config.yml",
	hidden = true,
	direction = "float",
	float_opts = {
		border = "none",
		width = 100000,
		height = 100000,
	},
	on_open = function(_)
		vim.cmd("startinsert!")
	end,
	on_close = function(_) end,
	count = 99,
})
function Custom_lazygit_toggle()
	lazygit:toggle()
end
lvim.builtin.which_key.mappings["g"]["g"] = { "<cmd>lua Custom_lazygit_toggle()<CR>", "Lazygit" }
