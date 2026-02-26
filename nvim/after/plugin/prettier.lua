-- Define a function for Prettier formatting
function PrettierFormat()
    local file = vim.fn.expand("%:p") -- Get the full path of the current file
    vim.fn.system("prettier --write --ignore-path .gitignore " .. file)
    vim.cmd("checktime") -- Reload the file if it was modified externally
end

-- Map <leader>w to the PrettierFormat function
vim.api.nvim_set_keymap("n", "<leader>w", "<cmd>lua PrettierFormat()<CR>", { noremap = true, silent = true })

