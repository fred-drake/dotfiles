
require("mason-null-ls").setup({
    ensure_installed = {
        -- Opt to list sources here, when available in mason.
    },
    automatic_installation = false,
    automatic_setup = true, -- Recommended, but optional
})


local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.diagnostics.eslint,
        null_ls.builtins.completion.spell,
    }
})

require 'mason-null-ls'.setup_handlers() -- If `automatic_setup` is true.
