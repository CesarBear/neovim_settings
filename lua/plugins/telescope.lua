return  
{
    'nvim-telescope/telescope.nvim', tag = '0.1.5',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        local builtIn = require("telescope.builtin")
        vim.keymap.set('n', '<C-p>', builtIn.find_files, {})
        vim.keymap.set('n', '<leader>fg', builtIn.live_grep, {})
    end
}

