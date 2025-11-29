vim.opt.termguicolors = true

-- Basic settings
vim.g.mapleader = " "
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)


vim.g.python3_host_prog = vim.fn.expand("~/.config/nvim/.venv/bin/python")


-- Load plugins
require("lazy").setup({
    -- LSP
    {
        "neovim/nvim-lspconfig",
        dependencies = {
            "williamboman/mason.nvim",
            "williamboman/mason-lspconfig.nvim",
        },
        config = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = { "lua_ls" }
            })

            vim.lsp.config('lua_ls', {})
            vim.lsp.enable('lua_ls')

            -- LSP keybindings
            vim.keymap.set('n', 'gd', vim.lsp.buf.definition)
            vim.keymap.set('n', 'K', vim.lsp.buf.hover)
            vim.keymap.set('n', 'gr', vim.lsp.buf.references)
            vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename)
            vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action)
        end
    },

    -- Autocompletion
    {
        "hrsh7th/nvim-cmp",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require("cmp")
            cmp.setup({
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
                mapping = cmp.mapping.preset.insert({
                    ['<C-Space>'] = cmp.mapping.complete(),
                    ['<CR>'] = cmp.mapping.confirm({ select = true }),
                }),
                sources = {
                    { name = 'nvim_lsp' },
                    { name = 'buffer' },
                }
            })
        end
    },

    -- Treesitter
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
            require("nvim-treesitter.configs").setup({
                ensure_installed = { "lua", "python", "vim" },
                highlight = { enable = true },
            })
        end
    },

    -- Colorscheme
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 100,
    },
    {
        "rebelot/kanagawa.nvim",
        lazy = false,
        priority = 100,
    },
    {
        "catppuccin/nvim",
        name = "catppuccin",
        lazy = false,
        priority = 1000,
    },
    {
        "EdenEast/nightfox.nvim",
        lazy = false,
        priority = 100,
    },
    {
        "ellisonleao/gruvbox.nvim",
        lazy = false,
        priority = 100,
    },
    {
        "navarasu/onedark.nvim",
        lazy = false,
        priority = 100,
    },
    {
        "tanvirtin/monokai.nvim",
        lazy = false,
        priority = 1000,
    },
    {
        "Mofiqul/vscode.nvim",
        lazy = false,
        priority = 100,
    },
    {
        "sainnhe/everforest",
        lazy = false,
        priority = 100,
    },
    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 100,
    },
    {
      "benlubas/molten-nvim",
      version = "^1.0.0",
      dependencies = { "3rd/image.nvim" },  -- optional, for image support
      build = ":UpdateRemotePlugins",
      init = function()
        vim.g.molten_output_virt_lines = true  -- inline output
        vim.g.molten_auto_open_output = false
      end,
    }
})

vim.cmd[[colorscheme catppuccin-mocha]]


vim.keymap.set("n", "<leader>ml", ":MoltenEvaluateLine<CR>", { silent = true })
vim.keymap.set("v", "<leader>mv", ":<C-u>MoltenEvaluateVisual<CR>gv", { silent = true })
vim.keymap.set("n", "<leader>mi", ":MoltenInit python3<CR>", { silent = true })
