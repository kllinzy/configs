local ls = require("luasnip")

ls.config.set_config {
  history = true,
}

vim.keymap.set({ "i", "s" }, "<c-k>", function()
  if ls.expand_or_jumpable() then 
    ls.expand_or_jump()
  end
end)

vim.keymap.set({"i", "s"}, "<c-j>", function()
  if ls.jumpable(-1) then
    ls.jump(-1)
  end
end, { silent = true }) 

vim.keymap.set("n", "<leader><leader>s", "<cmd> source ~/.config/nvim/lua/luasnip_config.lua<CR>") 
require("luasnip.loaders.from_vscode").lazy_load()
require("luasnip.loaders.from_vscode").lazy_load({ paths = { "~/.config/snippets" } })
