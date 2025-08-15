require "nvchad.mappings"

vim.g.mapleader = " "
local keymap = vim.keymap
local opts = { noremap = true, silent = true }
local lastMappedCommand = nil

-- Function to run mapped command and store as last Ex Command to be able to re-execute
local function set_and_store_last_cmd(mode, lhs, rhs)
  opts = { noremap = true, silent = true }
  keymap.set(mode, lhs, function()
    vim.cmd(rhs)
    vim.fn.histadd("cmd", rhs)
    -- vim.fn.setreg(":", rhs)
    lastMappedCommand = rhs
  end, opts)
end

-- Repeat last command
keymap.set("n", "<leader>q", function()
  if lastMappedCommand then
    vim.cmd(lastMappedCommand)
  else
    vim.cmd(":@:")
  end
end)

keymap.set("n", "<leader>ra", ":%s/")

keymap.set("n", "<leader>y", '"+y')          -- Yank to system clipboard
keymap.set('n', '<leader>cl', ':nohl<CR>', {}) -- Clear search highlighting

-- Do things without affecting the registers
keymap.set("n", "x", '"_x')         -- Delete character without yanking
keymap.set("n", "<Leader>p", '"0p') -- Paste from register 0 after cursor
keymap.set("n", "<Leader>P", '"0P') -- Paste from register 0 before cursor
keymap.set("v", "<Leader>p", '"0p') -- Paste from register 0 in visual mode
keymap.set("n", "<Leader>c", '"_c') -- Change text without yanking
keymap.set("n", "<Leader>C", '"_C') -- Change to end of line without yanking
keymap.set("v", "<Leader>c", '"_c') -- Change selection without yanking
keymap.set("v", "<Leader>C", '"_C') -- Change selection to end of line without yanking
keymap.set("n", "<Leader>d", '"_d') -- Delete text without yanking
keymap.set("n", "<Leader>D", '"_D') -- Delete to end of line without yanking
keymap.set("v", "<Leader>d", '"_d') -- Delete selection without yanking
keymap.set("v", "<Leader>D", '"_D') -- Delete selection to end of line without yanking

-- Increment/decrement
keymap.set("n", "+", "<C-a>") -- increment number under cursor
keymap.set("n", "-", "<C-x>") -- decrement number under cursor

-- Delete a word backwards
keymap.set("n", "dw", 'vb"_d') -- delete word backwards visually

-- New tab
keymap.set("n", "te", ":tabedit<Return>")            -- open new tab
keymap.set("n", "<tab>", ":tabnext<Return>", opts)   -- go to next tab
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts) -- go to previous tab

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)  -- horizontal split
keymap.set("n", "sv", ":vsplit<Return>", opts) -- vertical split

-- Move window
keymap.set("n", "sh", "<C-w>h")     -- move to left window
keymap.set("n", "sk", "<C-w>k")     -- move to upper window
keymap.set("n", "sj", "<C-w>j")     -- move to lower window
keymap.set("n", "sl", "<C-w>l")     -- move to right window
keymap.set("n", "sw", "<C-w><C-w>") -- move to next window

-- Resize window
keymap.set("n", "<C-w><left>", "<C-w><")  -- resize window narrower
keymap.set("n", "<C-w><right>", "<C-w>>") -- resize window wider
keymap.set("n", "<C-w><up>", "<C-w>+")    -- resize window taller
keymap.set("n", "<C-w><down>", "<C-w>-")  -- resize window shorter

-- Buffer Mappings
keymap.set("n", "<leader>ls", ":buffers<CR>")
keymap.set("n", "<leader>wb", ":buffer<tab>")
keymap.set("n", "<leader>wn", ":bnext<CR>")

-- Incremental Rename
keymap.set("n", "<leader>rn", ":IncRename ") -- incremental rename command

-- ChatGPT Mappings
keymap.set("n", "<leader>gpt", ":AvanteAsk<CR>")          -- open ChatGPT
keymap.set("n", "<leader>gptn", ":AvanteChat<CR>")
keymap.set("n", "<leader>cj", ":ChatGPTCompleteCode<CR>") -- complete code with ChatGPT
keymap.set("n", "<leader>ej", "V:AvanteEdit<CR>")         -- select entire line and edit with instructions (normal mode)
keymap.set("v", "<leader>ej", ":AvanteEdit<CR>")          -- edit with instructions (visual mode)

-- Terminal Mappings
keymap.set("n", "<leader>t", ":terminal<CR>")
keymap.set("t", "<Escape>", "<C-\\><C-n>")

-- Git
keymap.set("n", "<leader>gd", ":Gitsigns diffthis<CR>")
keymap.set("n", "<leader>ga", ":Gitsigns stage_buffer<CR>")
keymap.set("n", "<leader>git", ":Gitsigns ")
keymap.set("n", "<leader>gic", ":!git commit -m \"")

-- Line Operations
keymap.set("v", "<leader>en", "$")  -- Move to end of line in visual mode
keymap.set("v", "<leader>rt", "^")  -- Move to first non-blank character in visual mode
keymap.set("n", "<leader>en", "$")  -- Move to end of line in normal mode
keymap.set("n", "<leader>rt", "^")  -- Move to first non-blank character in normal mode

-- Search word in current doc
keymap.set("n", "<leader>fw", "/")             -- start forward search

set_and_store_last_cmd("n", "<leader>lb", ":t.<CR>")       -- make a copy of the current line and put it below the line
set_and_store_last_cmd("n", "<leader>lt", ":t.-1<CR>")     -- make a copy of the current line and put it above the line
set_and_store_last_cmd("n", "<leader>lmt", ":m .-2<CR>") -- move current line up with cursor
set_and_store_last_cmd("n", "<leader>lmb", ":m .+1<CR>") -- move current line down with cursor

keymap.set("v", "lb", ":m '>+1<CR>gv=gv") -- move selected lines down and reselect
keymap.set("v", "lt", ":m '<-2<CR>gv=gv") -- move selected lines up and reselect

-- Navigations
keymap.set("n", "<C-d>", "<C-d>zz")
keymap.set("n", "<C-u>", "<C-u>zz")

--When using ChatGPT and ChatGPTEditWithInstructions, the following keybindings are available:
-- <C-Enter> [Both] to submit.
-- <C-y> [Both] to copy/yank last answer.
-- <C-o> [Both] Toggle settings window.
-- <C-h> [Both] Toggle help window.
-- <Tab> [Both] Cycle over windows.
-- <C-f> [Chat] Cycle over modes (center, stick to right).
-- <C-c> [Both] to close chat window.
-- <C-p> [Chat] Toggle sessions list.
-- <C-u> [Chat] scroll up chat window.
-- <C-d> [Chat] scroll down chat window.
-- <C-k> [Chat] to copy/yank code from last answer.
-- <C-n> [Chat] Start new session.
-- <C-r> [Chat] draft message (create message without submitting it to server)
-- <C-r> [Chat] switch role (switch between user and assistant role to define a workflow)
-- <C-s> [Both] Toggle system message window.
-- <C-i> [Edit Window] use response as input.
-- <C-d> [Edit Window] view the diff between left and right panes and use diff-mode commands

-- Avante AI Key Bindings
-- <leader>aa	show sidebar
-- <leader>at	toggle sidebar visibility
-- <leader>ar	refresh sidebar
-- <leader>af	switch sidebar focus
-- <leader>a?	select model
-- <leader>ae	edit selected blocks
-- <leader>aS	stop current AI request
-- <leader>ah	select between chat histories
-- co	choose ours
-- ct	choose theirs
-- ca	choose all theirs
-- c0	choose none
-- cb	choose both
-- cc	choose cursor
-- ]x	move to previous conflict
-- [x	move to next conflict
-- [[	jump to previous codeblocks (results window)
-- ]]	jump to next codeblocks (results windows)
--
-- Telescope
local builtin = require("telescope.builtin")
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})
vim.keymap.set('n', '<leader>pws', function()
      local word = vim.fn.expand("<cword>")
      builtin.grep_string({ search = word })
  end)
vim.keymap.set('n', '<leader>pWs', function()
      local word = vim.fn.expand("<cWORD>")
      builtin.grep_string({ search = word })
  end)

local function lsp_ops(desc)
return { buffer = bufnr, desc = "LSP " .. desc }
end

vim.keymap.set("n", "gD", vim.lsp.buf.declaration, lsp_ops "Lsp Go to declaration")
vim.keymap.set("n", "gd", vim.lsp.buf.definition, lsp_ops "Lsp Go to definition")
vim.keymap.set("n", "K", vim.lsp.buf.hover, lsp_ops "Lsp hover information")
vim.keymap.set("n", "gI", vim.lsp.buf.implementation, lsp_ops "Lsp Go to implementation")
vim.keymap.set("n", "<leader>sh", vim.lsp.buf.signature_help, lsp_ops "Lsp Show signature help")

