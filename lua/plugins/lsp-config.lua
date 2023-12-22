return {
    {
        "williamboman/mason.nvim",
        config = function()
            require("mason").setup()
        end
    },
    {
        'williamboman/mason-lspconfig.nvim',
        config = function()
            require("mason-lspconfig").setup({
            ensure_installed = { "bashls", "clangd", "cmake", "rust_analyzer", "tsserver", "lua_ls", "pyright"}
            })
        end
    },
    {
        'neovim/nvim-lspconfig',
        config = function()
            local lspconfig = require('lspconfig')
            lspconfig.bashls.setup({})
            lspconfig.clangd.setup({})
            lspconfig.cmake.setup({})
            lspconfig.rust_analyzer.setup({})
            lspconfig.tsserver.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.pyright.setup({})

            vim.keymap.set('n', 'K', vim.lsp.buf.hover, {})
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition, {})
            vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, {})
        end
    }
}
