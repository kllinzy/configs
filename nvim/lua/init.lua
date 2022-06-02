vim.cmd [[
	set number
	set clipboard=unnamedplus
	set tabstop=2
	set shiftwidth=2
	set expandtab
]]


-- Make relative line numbers default. The current line number will be shown as well as relative numbering from that current line. It makes navigating around code easier.
vim.wo.number = true
vim.wo.relativenumber = true

-- Enable break indent.
vim.o.breakindent = true

-- Save undo history.
vim.opt.undofile = true

-- Case insensitive searching unless /C or capital in search.
vim.o.ignorecase = true
vim.o.smartcase = true

-- Decrease update time.
vim.o.updatetime = 250
vim.wo.signcolumn = 'yes'

-- Set colorscheme defaults (order is important here).
vim.o.termguicolors = true
vim.g.onedark_terminal_italics = 2
vim.o.background = 'dark'
--vim.cmd [[colorscheme moonfly]]

-- Set status bar settings, it might throw errors because we haven't installed the `moonfly` theme yet, so don't worry about that. 
vim.g.lightline = {
  colorscheme = 'moonfly',
  active = { left = { { 'mode', 'paste' }, { 'gitbranch', 'readonly', 'filename', 'modified' } } },
  component_function = { gitbranch = 'FugitiveHead' },
}

-- Set dark theme if macOS theme is dark, light otherwise.
vim.o.background = 'dark'
vim.cmd [[colorscheme moonfly]]

-- Highlight on yank (copy). It will do a nice highlight blink of the thing you just copied.
vim.api.nvim_exec(
  [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]],
  false
)


require('plugin_config')
require('keybindings')

--extension configs
require('treesitter_config')
require('gitsigns_config')
require('telescope_config')
require('neoformat_config')
require('coc_config')
