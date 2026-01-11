return {
    "benlubas/molten-nvim",
    version = "^1.0.0",
    dependencies = { "3rd/image.nvim" },
    build = ":UpdateRemotePlugins",
    ft = { "python" },
    init = function()
        vim.g.molten_output_virt_lines = true
        vim.g.molten_auto_open_output = false
    end,
    keys = {
        { "<leader>mi", ":MoltenInit python3<CR>", desc = "Initialize Molten" },
        { "<leader>ml", ":MoltenEvaluateLine<CR>", desc = "Evaluate line" },
        { "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", mode = "v", desc = "Evaluate selection" },
    }
}
