return {
    "tpope/vim-fugitive",
    cmd = { "Git", "G", "Gread", "Gwrite", "Gdiffsplit", "Gvdiffsplit" },
    keys = {
        { "<leader>gs", "<cmd>Git<cr>", desc = "Git status" },
        { "<leader>gb", "<cmd>Git blame<cr>", desc = "Git blame" },
        { "<leader>gd", "<cmd>Gdiffsplit<cr>", desc = "Git diff" },
        { "<leader>gl", "<cmd>Git log<cr>", desc = "Git log" },
    },
}
