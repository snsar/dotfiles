-- vim.cmd("set expandtab")
-- vim.cmd("set tabstop=4")
-- vim.cmd("set softtabstop=4")
-- vim.cmd("set shiftwidth=4")
-- vim.cmd("set autoindent")

-- vim.opt.clipboard = "unnamedplus"

-- -- Pull Lazy.nvim if not installed
-- local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
-- if not vim.loop.fs_stat(lazypath) then
--   vim.fn.system({
--     "git",
--     "clone",
--     "--filter=blob:none",
--     "https://github.com/folke/lazy.nvim.git",
--     "--branch=stable",
--     lazypath,
--   })
-- end
-- vim.opt.rtp:prepend(lazypath)

-- local plugins = {
--     { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
--     {
--         'nvim-telescope/telescope.nvim', tag = '0.1.8',
--         dependencies = { 'nvim-lua/plenary.nvim' }
--     }
-- }
-- local opts = {}

-- require("lazy").setup(plugins, opts)

-- require("catppuccin").setup()
-- vim.cmd.colorscheme "catppuccin"

require("myconfig")
