vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "<Up>", "<Nop>")
vim.keymap.set("n", "<Down>", "<Nop>")
vim.keymap.set("n", "<Left>", "<Nop>")
vim.keymap.set("n", "<Right>", "<Nop>")
vim.keymap.set({"n", "v"}, "<leader>y", [["+y]])

vim.keymap.set("n", "[q", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "]q", "<cmd>cprev<CR>zz")

function StripTrailingWhitespace()
    local save_cursor = vim.fn.getpos('.')
    vim.cmd([[ %s/\s\+$//e ]])
    vim.fn.setpos('.', save_cursor)
end

-- vim.keymap.set('n', '<leader>w', StripTrailingWhitespace)
