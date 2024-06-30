----------------------------------
--- Nvim resizing panes keymap ---
----------------------------------
vim.api.nvim_set_keymap('n', '<a-h>', ":vertical resize +5<CR>", { noremap = false , silent = true })
vim.api.nvim_set_keymap('n', '<a-l>', ":vertical resize -5<CR>", { noremap = false , silent = true })
vim.api.nvim_set_keymap('n', '<a-k>', ":resize +5<CR>", { noremap = false , silent = true })
vim.api.nvim_set_keymap('n', '<a-j>', ":resize -5<CR>", { noremap = false , silent = true })

----------------------
-- DAP key bindings --
----------------------
vim.api.nvim_set_keymap('n', '<Leader>db', "<cmd>lua require'dap'.toggle_breakpoint()<CR>", { noremap = false , silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dB', "<cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dr', "<cmd>lua require'dap'.restart()<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dh', "<cmd>lua require'dap'.pause()<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>do', "<cmd>lua require'dap'.close()<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>dc', "<cmd>lua require'dap'.continue()<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>ds', "<cmd>lua require'dap'.step_over()<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>di', "<cmd>lua require'dap'.step_into()<CR>", { noremap = false, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>du', "<cmd>lua require'dapui'.toggle()<CR>", { noremap = false, silent = true })
-------------------------
-- Rnvimr key bindings --
-------------------------
vim.api.nvim_set_keymap('n', '<Leader>rr', ":RnvimrToggle<CR>", { noremap = false, silent = true })
---------------------------
-- Nvimtree key bindings --
---------------------------
vim.api.nvim_set_keymap('n', '<Leader>mm', ":NvimTreeToggle<CR>", { noremap = false, silent = true })


