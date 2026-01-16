return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
    },
    config = function()
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = { "lua_ls", "rust_analyzer", "pyright", "gopls"}
        })

        local servers = { "lua_ls", "rust_analyzer", "pyright" }
        for _, server in ipairs(servers) do
            vim.lsp.config(server, {})
            vim.lsp.enable(server)
        end

        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, { desc = "Hover documentation" })
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, { desc = "Find references" })
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, { desc = "Rename symbol" })
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, { desc = "Code action" })
    end
}
