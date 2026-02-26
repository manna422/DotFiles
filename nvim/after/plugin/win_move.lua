function WinMove(key)
  local curwin = vim.fn.winnr()
  vim.cmd("wincmd " .. key)
  if curwin == vim.fn.winnr() then
    if string.match(key, "[jk]") then
      vim.cmd("wincmd s")
    else
      vim.cmd("wincmd v")
    end
    vim.cmd("wincmd " .. key)
  end
end

vim.keymap.set("n", "<C-h>", function() WinMove("h") end)
vim.keymap.set("n", "<C-j>", function() WinMove("j") end)
vim.keymap.set("n", "<C-k>", function() WinMove("k") end)
vim.keymap.set("n", "<C-l>", function() WinMove("l") end)
