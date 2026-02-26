vim.cmd 'autocmd BufNewFile,BufRead *.go nnoremap <leader>e :! go run %<CR>'
vim.cmd 'autocmd BufNewFile,BufRead *.exs nnoremap <leader>e :! elixir %<CR>'
vim.cmd 'autocmd BufNewFile,BufRead *.js nnoremap <leader>e :! node %<CR>'
-- vim.cmd 'autocmd BufNewFile,BufRead *.py nnoremap <leader>e :! python %<CR>'
vim.cmd 'autocmd BufNewFile,BufRead *.sh nnoremap <leader>e :! sh %<CR>'
vim.cmd 'autocmd BufNewFile,BufRead *.ts nnoremap <leader>e :! npx ts-node %<CR>'

local function execute_current_buffer()
  vim.cmd('w')
  print('\n\n')
  if vim.bo.filetype == 'python' then
    vim.cmd('! python ' .. vim.fn.expand('%:p'))
  end
end

vim.keymap.set('n', '<leader>e', execute_current_buffer)
