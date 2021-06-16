CONFIG_PATH = vim.fn.stdpath('config')
DATA_PATH = vim.fn.stdpath('data')
CACHE_PATH = vim.fn.stdpath('cache')

O = {
    auto_close_tree = 0,
    auto_complete = true,
    -- colorscheme = 'lunar',
    colorscheme = 'material',
    hidden_files = true,
    wrap_lines = true,
    number = true,
    relative_number = true,
    shell = 'zsh',
	timeoutlen = 100,
    nvim_tree_disable_netrw = 0,
    extras = false,

    -- @usage pass a table with your desired languages
    treesitter = {
        ensure_installed = "all",
        ignore_install = {"haskell"},
        highlight = {enabled = true},
        playground = {enabled = true},
        rainbow = {enabled = true}
    },

    database = {save_location = '~/.config/nvcode_db', auto_execute = 1},
    python = {
        linter = '',
        -- @usage can be 'yapf', 'black'
        formatter = '',
        autoformat = false,
        isort = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true},
		analysis = {type_checking = "basic", auto_search_paths = true, use_library_code_types = true}
    },
    dart = {sdk_path = '/usr/lib/dart/bin/snapshots/analysis_server.dart.snapshot'},
    lua = {
        -- @usage can be 'lua-format'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    sh = {
        -- @usage can be 'shellcheck'
        linter = '',
        -- @usage can be 'shfmt'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    tsserver = {
        -- @usage can be 'eslint'
        linter = '',
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    json = {
        -- @usage can be 'prettier'
        formatter = '',
        autoformat = false,
        diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}
    },
    tailwindls = {filetypes = {'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact'}},
    clang = {diagnostics = {virtual_text = {spacing = 0, prefix = ""}, signs = true, underline = true}},
	ruby = {
		diagnostics = {virtualtext = {spacing = 0, prefix = ""}, signs = true, underline = true},
		filetypes = {'rb', 'erb', 'rakefile'}
	},
    go = {},
    -- css = {formatter = '', autoformat = false, virtual_text = true},
    -- json = {formatter = '', autoformat = false, virtual_text = true}

	dashboard = {
		custom_header = {
		    [[  _____       _            _             _   _      _       _     _   ]],
		    [[ / ____|     | |          (_)           | | | |    (_)     | |   | |  ]],
		    [[| (___   ___ | | __ _ _ __ _ _______  __| | | |     _  __ _| |__ | |_ ]],
		    [[ \___ \ / _ \| |/ _` | '__| |_  / _ \/ _` | | |    | |/ _` | '_ \| __|]],
		    [[ ____) | (_) | | (_| | |  | |/ /  __/ (_| | | |____| | (_| | | | | |_ ]],
		    [[|_____/ \___/|_|\__,_|_|  |_/___\___|\__,_| |______|_|\__, |_| |_|\__|]],
		    [[                                                       __/ |          ]],
		    [[                                                      |___/           ]],
		},
		footer= {"'Don\'t bend; don\'t water it down; don\'t try to make it logical; don\'t edit your own soul according to the fashion. Rather, follow your most intense obsessions mercilessly.' - Franz Kafka"},
	}
}

