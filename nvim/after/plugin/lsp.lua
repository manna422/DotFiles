local lsp_zero = require('lsp-zero')

require('mason').setup({})
require('mason-lspconfig').setup({
  ensure_installed = {
    'elixirls',
    'eslint',
    'lua_ls',
    'pylsp',
    'tailwindcss',
    'tsserver',
  },
  handlers = {
    function(server_name)
      require('lspconfig')[server_name].setup({})
    end,
    lua_ls = function()
      local lua_opts = lsp_zero.nvim_lua_ls()
      require('lspconfig').lua_ls.setup(lua_opts)
    end,
  },
})

local cmp = require('cmp')
local cmp_select = { behavior = cmp.SelectBehavior.Insert, count = 1 }
cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-p>'] = cmp.mapping.select_prev_item(cmp_select),
    ['<C-n>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-Space>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Enter>'] = cmp.mapping.complete(),
    ['<Tab>'] = nil,
    ['<S-Tab>'] = nil
  })
})

lsp_zero.set_preferences({
    suggest_lsp_servers = false,
})

lsp_zero.set_sign_icons({
  error = '✘',
  warn = '▲',
  hint = '⚑',
  info = '»'
})

lsp_zero.on_attach(function(client, bufnr)
  local opts = {buffer = bufnr, remap = false}
  vim.keymap.set("n", "<leader>gd", function() require('telescope.builtin').lsp_definitions() end, opts)
  vim.keymap.set("n", "<leader>gt", function() require('telescope.builtin').lsp_type_definitions() end, opts)
  vim.keymap.set("n", "<leader>gr", function() require('telescope.builtin').lsp_references() end, opts)
  vim.keymap.set("n", "<leader>gn", function() vim.lsp.buf.rename() end, opts)
  vim.keymap.set("n", "<leader>gk", function() vim.lsp.buf.hover() end, opts)

  vim.keymap.set("n", "<leader>ge", function() vim.diagnostic.open_float() end, opts)
  vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
  vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
end)
