local keymap = vim.keymap.set
vim.g.mapleader = " "
vim.g.copilot_no_tab_map = true -- Disable Copilot tab mapping

local opts = { noremap = true, silent = true }

local function with_desc(desc)
    return { desc = desc, noremap = true, silent = true }
end

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", with_desc("Toggle NvimTree"))

-- Visual mode indentation
keymap("v", "<", "<gv", with_desc("Indent left"))
keymap("v", ">", ">gv", with_desc("Indent right"))

-- Copilot accept
keymap("i", "<C-J>", 'copilot#Accept("<CR>")', {
    silent = true,
    expr = true,
    replace_keycodes = false,
    desc = "Copilot Accept",
})

-- Centered scroll
keymap("n", "<C-d>", "<C-d>zz", with_desc("Scroll down and center"))
keymap("n", "<C-u>", "<C-u>zz", with_desc("Scroll up and center"))

-- Move lines up and down
keymap("n", "<A-Down>", ":m .+1<CR>==", with_desc("Move line down"))
keymap("n", "<A-Up>", ":m .-2<CR>==", with_desc("Move line up"))
keymap("v", "<A-Down>", ":m '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap("v", "<A-U>", ":m '<-2<CR>gv=gv", { desc = "Move selection up" })

-- Window navigation
keymap("n", "<C-h>", "<C-w>h", with_desc("Move to left window"))
keymap("n", "<C-l>", "<C-w>l", with_desc("Move to right window"))
keymap("n", "<C-j>", "<C-w>j", with_desc("Move to lower window"))
keymap("n", "<C-k>", "<C-w>k", with_desc("Move to upper window"))

-- Terminal escapes
keymap("t", "<C-k>", "<C-\\><C-n><C-w>k", opts)
keymap("t", "<C-j>", "<C-\\><C-n><C-w>j", opts)
keymap("t", "<C-h>", "<C-\\><C-n><C-w>h", opts)
keymap("t", "<C-l>", "<C-\\><C-n><C-w>l", opts)

-- Yank whole page to Ctrl-y
keymap("n", "<C-y>", "<cmd>%y+<CR>", { desc = "file copy whole" })

-- Comment
-- keymap("n", "<leader>/", "gcc", { desc = "Comment toggle", noremap = false })
-- keymap("v", "<leader>/", "gc", { desc = "Comment toggle", noremap = false })
keymap("n", "<leader>/", ":CommentToggle<CR>", { desc = "Toggle comment", noremap = true, silent = true })
keymap("v", "<leader>/", ":CommentToggle<CR>", { desc = "Toggle comment", noremap = true, silent = true })

-- Select the whole file
-- keymap("n", "gv", ":norm ggVG <CR>", opts)
keymap("n", "<leader>va", "ggVG", { desc = "Select entire file", noremap = true, silent = true })

-- map(
--   "n",
--   "<C-u>",
--   "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(-1)<cr>",
--   { noremap = true, silent = true }
-- )
-- map("n", "<C-d>", "<cmd>lua require('lspsaga.action').smart_scroll_with_saga(1)<cr>", { noremap = true, silent = true })

--- barbar mappings ---
-- Move to previous/next
keymap("n", "<A-,>", ":BufferPrevious<CR>", opts)
keymap("n", "<A-.>", ":BufferNext<CR>", opts)
-- Re-order to previous/next
keymap("n", "<A-<>", ":BufferMovePrevious<CR>", opts)
keymap("n", "<A->>", ":BufferMoveNext<CR>", opts)
-- Goto buffer in position...
keymap("n", "<A-1>", ":BufferGoto 1<CR>", opts)
keymap("n", "<A-2>", ":BufferGoto 2<CR>", opts)
keymap("n", "<A-3>", ":BufferGoto 3<CR>", opts)
keymap("n", "<A-4>", ":BufferGoto 4<CR>", opts)
keymap("n", "<A-5>", ":BufferGoto 5<CR>", opts)
keymap("n", "<A-6>", ":BufferGoto 6<CR>", opts)
keymap("n", "<A-7>", ":BufferGoto 7<CR>", opts)
keymap("n", "<A-8>", ":BufferGoto 8<CR>", opts)
keymap("n", "<A-9>", ":BufferGoto 9<CR>", opts)
keymap("n", "<A-0>", ":BufferLast<CR>", opts)

-- Pin/unpin buffer
keymap("n", "<A-p>", ":BufferPin<CR>", opts)

-- Close buffer
keymap("n", "<A-c>", ":BufferClose<CR>", opts)
-- Wipeout buffer
--                 :BufferWipeout<CR>
-- Close commands
--                 :BufferCloseAllButCurrent<CR>
--                 :BufferCloseAllButPinned<CR>
--                 :BufferCloseAllButCurrentOrPinned<CR>
--                 :BufferCloseBuffersLeft<CR>
--                 :BufferCloseBuffersRight<CR>
-- Magic buffer-picking mode
keymap("n", "<C-p>", ":BufferPick<CR>", opts)
-- Sort automatically by...
keymap("n", "<Space>bb", ":BufferCloseAllButCurrentOrPinned<CR>", opts)
keymap("n", "<Space>bn", ":BufferOrderByBufferNumber<CR>", opts)
keymap("n", "<Space>bd", ":BufferOrderByDirectory<CR>", opts)
keymap("n", "<Space>bl", ":BufferOrderByLanguage<CR>", opts)
keymap("n", "<Space>bw", ":BufferOrderByWindowNumber<CR>", opts)

--> Telescope mappings
-- map("n", "<leader>ff", ":Telescope find_files<CR>", opts)
-- map("n", "<leader>fg", ":Telescope live_grep<CR>", opts)
-- map("n", "<leader>fh", ":Telescope keymaps<CR>", opts)
