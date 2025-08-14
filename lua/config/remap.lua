local set = vim.keymap.set

-- File / Project navigation
-- open netrw file explorer
set("n", "<leader>pv", ":Ex<CR>") 

-- TEXT MOVEMENT & EDITING --
-- move selected block down
set("v", "J", ":m '>+1<CR>gv=gv") 
-- move selected block up
set("v", "K", ":m '>-2<CR>gv=gv") 
-- join lines without moving cursor
set("n", "J", "mzJ`z") 
-- half-page down, recenter
set("n", "<C-d>", "<C-d>zz") 
-- half-page up, recenter
set("n", "<C-u>", "<C-u>zz") 
-- next search result, recenter
set("n", "n", "nzzzv") 
-- previous search result, recenter
set("n", "N", "Nzzzv") 
-- paste over selection without yanking
set("x", "<leader>p", "\"_dP") 
-- delete without yanking
set("n", "<leader>d", "\"_d") 
-- delete selection without yanking
set("v", "<leader>d", "\"_d") 
-- replace word under cursor
set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]]) 
-- make file executable
set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- CLIPBOARD -- 
set("n", "<leader>y", "\"+y") -- yank to system clipboard
set("v", "<leader>y", "\"+y") -- yank selection to clipboard
set("n", "<leader>Y", "\"+Y") -- yank whole line to clipboard

-- LSP / TOOLS --
-- toggle undo tree
set("n", "<leader>u", ":UndotreeToggle<CR>") 
-- stop all LSP servers
set("n", "<leader>ls", ":LspStop<CR>") 
-- show diagnostics in float
set("n", "<leader>li", ":lua vim.diagnostic.open_float()<CR>") 

