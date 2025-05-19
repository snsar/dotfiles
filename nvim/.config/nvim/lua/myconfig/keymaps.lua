-- Map tiện dụng
local vim = vim
local map = vim.keymap.set
local opts = { noremap = true, silent = true }

-- Leader
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Di chuyển giữa splits
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Di chuyển tab buffers
map("n", "<S-l>", ":bnext<CR>", opts)
map("n", "<S-h>", ":bprevious<CR>", opts)

-- Lưu & thoát
map("n", "<leader>w", ":w<CR>", opts)
map("n", "<leader>q", ":q<CR>", opts)

-- Tìm kiếm nhanh với Telescope (giả định bạn có telescope)
map("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Tìm file" })
map("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Tìm theo nội dung" })
map("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Danh sách buffer" })
map("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Tìm help" })

-- Xóa highlight sau khi tìm
map("n", "<leader>nh", ":nohlsearch<CR>", { desc = "Xoá highlight tìm kiếm" })

-- Di chuyển dòng trong visual mode
map("v", "J", ":m '>+1<CR>gv=gv", opts)
map("v", "K", ":m '<-2<CR>gv=gv", opts)

-- Resize window
map("n", "<C-Up>", ":resize -2<CR>", opts)
map("n", "<C-Down>", ":resize +2<CR>", opts)
map("n", "<C-Left>", ":vertical resize -2<CR>", opts)
map("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Lưu nhanh bằng Ctrl+s
map({ "n", "i", "v" }, "<C-s>", "<Esc>:w<CR>", opts)
