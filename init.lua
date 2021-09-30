CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

require('plugins')
require('settings')
require('autocmd')
require('keybinds')

require('lsp')
require('lsp.angular-ls')
require('lsp.bash-ls')
require('lsp.clangd')
require('lsp.cmake-ls')
require('lsp.css-ls')
require('lsp.dart-ls')
require('lsp.docker-ls')
require('lsp.efm-general-ls')
require('lsp.elm-ls')
require('lsp.emmet-ls')
require('lsp.graphql-ls')
require('lsp.go-ls')
require('lsp.html-ls')
require('lsp.json-ls')
require('lsp.js-ts-ls')
require('lsp.kotlin-ls')
require('lsp.latex-ls')
require('lsp.lua-ls')
require('lsp.php-ls')
require('lsp.python-ls')
require('lsp.ruby-ls')
require('lsp.rust-ls')
require('lsp.svelte-ls')
require('lsp.terraform-ls')
-- require('lsp.tailwindcss-ls')
require('lsp.vim-ls')
require('lsp.vue-ls')
require('lsp.yaml-ls')
require('lsp.elixir-ls')
