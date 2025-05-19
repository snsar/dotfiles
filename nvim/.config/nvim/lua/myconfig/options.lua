-- Thiết lập cơ bản cho Neovim
local vim = vim
local opt = vim.opt

-- Hiển thị
opt.number = true         -- số dòng
opt.relativenumber = true -- số dòng tương đối
opt.cursorline = true     -- highlight dòng hiện tại
opt.termguicolors = true  -- bật true color
opt.colorcolumn = "120"   -- hiển thị cột giới hạn độ dài dòng
opt.showmatch = true      -- hiển thị cặp ngoặc tương ứng

-- Tab & Indent
opt.tabstop = 4        -- độ rộng tab
opt.shiftwidth = 4     -- độ rộng indent
opt.softtabstop = 4    -- số spaces khi nhấn tab
opt.expandtab = true   -- dùng spaces thay vì tab
opt.smartindent = true -- tự động indent
opt.autoindent = true  -- giữ indent khi xuống dòng
opt.breakindent = true -- giữ indent khi wrap

-- Tìm kiếm
opt.ignorecase = true -- không phân biệt hoa thường
opt.smartcase = true  -- nhưng phân biệt nếu có chữ hoa
opt.incsearch = true  -- tìm kiếm khi gõ
opt.hlsearch = true   -- highlight kết quả tìm kiếm

-- Giao diện
opt.signcolumn = "yes" -- luôn hiển thị signcolumn
opt.scrolloff = 8      -- giữ khoảng cách với mép trên/dưới
opt.sidescrolloff = 8  -- giữ khoảng cách với mép trái/phải
opt.wrap = false       -- không tự xuống dòng
opt.pumheight = 10     -- giới hạn số mục trong popup menu
opt.cmdheight = 2      -- thêm không gian cho thông báo

-- Clipboard & Undo
opt.clipboard = "unnamedplus" -- dùng clipboard hệ thống
opt.undofile = true           -- bật undo persist
opt.swapfile = false          -- tắt swapfile
opt.backup = false            -- tắt backup
opt.writebackup = false       -- tắt writebackup

-- Hành vi khác
opt.mouse = "a"                      -- bật chuột
opt.splitbelow = true                -- cửa sổ ngang mở xuống dưới
opt.splitright = true                -- cửa sổ dọc mở sang phải
opt.updatetime = 100                 -- giảm thời gian để trigger CursorHold (tốt cho LSP)
opt.timeoutlen = 300                 -- giảm lag khi chạy lsp
opt.completeopt = "menuone,noselect" -- cài đặt completion
opt.hidden = true                    -- cho phép buffer ẩn khi có thay đổi chưa lưu
opt.fileencoding = "utf-8"           -- mã hóa file
opt.conceallevel = 0                 -- hiển thị `` trong markdown

-- Tối ưu hiệu suất
opt.lazyredraw = true -- không redraw khi thực thi macro
opt.synmaxcol = 240   -- giới hạn số ký tự để syntax highlight

-- Cài đặt cho các ngôn ngữ cụ thể
vim.g.go_highlight_types = 1
vim.g.go_highlight_fields = 1
vim.g.go_highlight_functions = 1
vim.g.go_highlight_function_calls = 1
vim.g.go_highlight_operators = 1
vim.g.go_highlight_extra_types = 1
