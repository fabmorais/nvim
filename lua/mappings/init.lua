local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

vim.g.mapleader = " "

map("n", "<leader>e", ":NvimTreeToggle<CR>", opts)
map("n", "<leader>u", ":UndotreeToggle<CR>", opts)
map("n", "<C-h>", "<C-w>h", { noremap = true, silent = false })
map("n", "<C-l>", "<C-w>l", { noremap = true, silent = false })
map("n", "<C-j>", "<C-w>j", { noremap = true, silent = false })
map("n", "<C-k>", "<C-w>k", { noremap = true, silent = false })
map("v", "<", "<gv", { noremap = true, silent = false })
map("v", ">", "<gv", { noremap = true, silent = false })
-- map("i", "<C-J>", 'copilot#Accept("<CR>")', { silent = true, expr = true })
map("i", "<C-J>", "codeium#Accept()", { silent = true, expr = true })
map("n", "<C-d>", "<C-d>zz", { noremap = true, silent = false })
map("n", "<C-u>", "<C-u>zz", { noremap = true, silent = false })

-- Terminal escapes
map("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
map("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
map("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
map("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- Yank whole page to C-y
map("n", "<C-y>", "<cmd>%y+<CR>", { desc = "file copy whole" })

-- Comment
map("n", "<leader>/", "gcc", { desc = "Comment toggle", noremap = false })
map("v", "<leader>/", "gc", { desc = "Comment toggle", noremap = false })

-- Select the whole file
map("n", "gv", ":norm ggVG <CR>", opts)

-- map(
--   "n",
--   "<C-u>",
--   "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
--   { noremap = true, silent = true }
-- )
-- map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", { noremap = true, silent = true })

--- barbar mappings ---
-- Move to previous/next
map("n", "<A-,>", ":BufferPrevious<CR>", opts)
map("n", "<A-.>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
map("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
map("n", "<A->>", " :BufferMoveNext<CR>", opts)
-- Goto buffer in position...
map("n", "<A-1>", ":BufferGoto 1<CR>", opts)
map("n", "<A-2>", ":BufferGoto 2<CR>", opts)
map("n", "<A-3>", ":BufferGoto 3<CR>", opts)
map("n", "<A-4>", ":BufferGoto 4<CR>", opts)
map("n", "<A-5>", ":BufferGoto 5<CR>", opts)
map("n", "<A-6>", ":BufferGoto 6<CR>", opts)
map("n", "<A-7>", ":BufferGoto 7<CR>", opts)
map("n", "<A-8>", ":BufferGoto 8<CR>", opts)
map("n", "<A-9>", ":BufferGoto 9<CR>", opts)
map("n", "<A-0>", ":BufferLast<CR>", opts)

-- Pin/unpin buffer
map("n", "<A-p>", ":BufferPin<CR>", opts)

-- Close buffer
map("n", "<A-c>", ":BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseAllButPinned<CR>
--                 :BufferCloseAllButCurrentOrPinned<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
map("n", "<C-p>", ":BufferPick<CR>", opts)
-- Sort automatically by...
map("n", "<Space>bb", ":BufferCloseAllButCurrentOrPinned<CR>", opts)
map("n", "<Space>bn", ":BufferOrderByBufferNumber<CR>", opts)
map("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
map("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)
map("n", "<Space>bw", ":BufferOrderByWindowNumber<CR>", opts)

--> Telescope mappings
-- map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
-- map("n", "<leader>fh", ":Telescope keymaps<CR>", opts)
