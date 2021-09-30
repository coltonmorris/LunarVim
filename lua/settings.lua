vim.cmd('let g:nvcode_termcolors=256')

vim.cmd('set path+=**') -- when using gf (goto file) it finds files in other dirs
vim.cmd('set ignorecase     ') -- ignorecase or infercase? The question of the century.
vim.cmd('set noswapfile') -- dont need a swap because we have an undo dir
vim.cmd('set scrolloff=3') -- keep the cursor from going all the way to the bottom when scrolling

vim.cmd('set iskeyword+=-') -- treat dash separated words as a word text object"
vim.cmd('set shortmess+=c') -- Don't pass messages to |ins-completion-menu|.
vim.cmd('set inccommand=split') -- Make substitution work in realtime
vim.o.hidden = true
vim.o.title = true
TERMINAL = vim.fn.expand('$TERMINAL')
vim.cmd('let &titleold="' .. TERMINAL .. '"')
vim.o.titlestring = "%<%F%=%l/%L - nvim colton"
vim.wo.wrap = true
-- vim.wo.wrap = O.wrap_lines -- Display long lines as just one line
-- vim.cmd('set whichwrap+=<,>,[,],h,l') -- move to next line with theses keys
vim.cmd('syntax on') -- syntax highlighting
vim.o.pumheight = 10 -- Makes popup menu smaller
vim.o.fileencoding = "utf-8" -- The encoding written to file
vim.o.cmdheight = 2 -- More space for displaying messages
vim.cmd('set colorcolumn=99999') -- fix indentline for now
vim.o.mouse = "a" -- Enable your mouse
vim.o.splitbelow = true -- Horizontal splits will automatically be below
vim.o.termguicolors = true -- set term gui colors most terminals support this
vim.o.splitright = true -- Vertical splits will automatically be to the right
-- vim.o.t_Co = "256" -- Support 256 colors
vim.o.conceallevel = 0 -- So that I can see `` in markdown files
vim.cmd('set expandtab') -- Converts tabs to spaces
vim.bo.smartindent = true -- Makes indenting smart
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.cursorline = true -- Enable highlighting of the current line
vim.o.showtabline = 2 -- Always show tabs
vim.o.showmode = false -- We don't need to see things like -- INSERT -- anymore
vim.o.backup = false -- This is recommended by coc
vim.o.writebackup = false -- This is recommended by coc
vim.wo.signcolumn = "yes" -- Always show the signcolumn, otherwise it would shift the text each time
vim.o.updatetime = 300 -- Faster completion
vim.o.timeoutlen = 100
vim.o.clipboard = "unnamed,unnamedplus" -- Copy paste between vim and everything else
vim.g.nvim_tree_disable_netrw = 0
vim.g.loaded_netrwPlugin = 1 -- needed for netrw gx command to open remote links in browser
vim.cmd('filetype plugin on') -- filetype detection
-- vim.o.guifont = "JetBrainsMono\\ Nerd\\ Font\\ Mono:h18"
-- vim.o.guifont = "Hack\\ Nerd\\ Font\\ Mono"
-- vim.o.guifont = "SauceCodePro Nerd Font:h17"
vim.o.guifont = "FiraCode Nerd Font:h17"

-- vim.o.guifont = "JetBrains\\ Mono\\ Regular\\ Nerd\\ Font\\ Complete"
