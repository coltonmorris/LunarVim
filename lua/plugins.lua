local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

-- Auto compile when there are changes in plugins.lua
-- vim.cmd('autocmd BufWritePost plugins.lua PackerCompile')

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    -- print('test '..plugin_path)
    local ok, err, code = os.rename(plugin_path, plugin_path)
    if not ok then
        if code == 13 then
            -- Permission denied, but it exists
            return true
        end
    end
    --	print(ok, err, code)
    if ok then vim.cmd("packadd " .. plugin) end
    return ok, err, code
end

local function require_plugin_with_config(plugin)
    -- dots in the file/dirname make things crash, replace with dashes
    local replace_dots = plugin:gsub([[%.]], [[%-]]) .. "-config"

    require_plugin(plugin)
    require(replace_dots)
end

local function custom_use(use, plugin)
    use {plugin, opt = true}

    -- remove the author account name from plugin
    local plugin_name = string.match(plugin, "/(.*)")

    require_plugin(plugin)
end

local function custom_use_with_config_dir(use, plugin)
    use {plugin, opt = true}
    -- remove the author account name from plugin (everything after slash)
    local plugin_name = string.match(plugin, "/(.*)")

    require_plugin_with_config(plugin_name)
end

-- opt = true means that the plugin is optional
return require("packer").startup(function(use)
    use {"nvim-lua/plenary.nvim"}
    require_plugin("plenary.nvim")

    -- Packer can manage itself as an optional plugin
    use {"wbthomason/packer.nvim", event = "VimEnter"}
    require_plugin('packer.nvim')

    use {"neovim/nvim-lspconfig", opt = true}
    require_plugin("nvim-lspconfig")
    use {"glepnir/lspsaga.nvim", opt = true}
    require_plugin("lspsaga.nvim")
    use {"kabouzeid/nvim-lspinstall", opt = true}
    require_plugin("nvim-lspinstall")
    use {"folke/trouble.nvim", opt = true}
    require_plugin("trouble.nvim")
    -- idk if i like the workflow of this plugin...
    -- use {"ahmedkhalf/project.nvim", opt = true}
    -- require_plugin("project.nvim")
    -- require("project-nvim-config")

    -- Telescope
    -- use {"nvim-lua/popup.nvim", opt = true}
    -- use {"nvim-telescope/telescope.nvim", opt = true}
    -- use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    -- use {"nvim-telescope/telescope-project.nvim", opt = true}

    -- Debugging
    use {"mfussenegger/nvim-dap", opt = true}
    require_plugin("nvim-dap")

    -- Autocomplete
    -- 
    use {"onsails/lspkind-nvim", opt = true} -- vscode-like pictograms for cmp
    require_plugin("lspkind-nvim")
    -- TODO use nvim-cmp by the same author
    use {"hrsh7th/nvim-cmp", opt = true}
    require_plugin("nvim-cmp")
    require("nvim-cmp-config")
    -- must declare these sources in the cmp-config dir
    -- TODO get a calculator cmp
    -- TODO get a spelling cmp
    use {"hrsh7th/cmp-buffer", opt = true}
    require_plugin("cmp-buffer")
    use {"hrsh7th/cmp-path", opt = true}
    require_plugin("cmp-path")
    use {"hrsh7th/cmp-nvim-lua", opt = true}
    require_plugin("cmp-nvim-lua")
    use {"hrsh7th/cmp-nvim-lsp", opt = true}
    require_plugin("cmp-nvim-lsp")
    use {"David-Kunz/cmp-npm", opt = true, requires = {'nvim-lua/plenary.nvim'}}
    require_plugin("cmp-npm")
    -- TODO maybe have this ripgrep the whole project rather than just cwd
    use {"lukas-reineke/cmp-rg", opt = true}
    require_plugin("cmp-rg")

    -- TODO use snippet pluign: https://github.com/L3MON4D3/LuaSnip
    -- TODO and then use https://github.com/saadparwaiz1/cmp_luasnip to have cmp work with snippets
    -- or use ultisnips, or snippy, or vsnip. tjdevries uses luasnip. ultisnips seems to be more supported in vim
    -- TODO when a snippet completes then we should have a keybinding for jumping between the values for filling it out

    use {"hrsh7th/vim-vsnip", opt = true}
    require_plugin("vim-vsnip")
    use {"rafamadriz/friendly-snippets", opt = true}
    require_plugin("friendly-snippets")

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", opt = true}
    require_plugin("nvim-treesitter")
    require("nvim-treesitter-config")
    use {"windwp/nvim-ts-autotag", opt = true}
    require_plugin("nvim-ts-autotag")
    use {'andymass/vim-matchup', opt = true}
    require_plugin("vim-matchup")
    require("vim-matchup-config")
    -- show you which function you're looking at at the top of the screen
    use {"romgrk/nvim-treesitter-context", opt = true}
    require_plugin("nvim-treesitter-context")
    -- make matching parens and stuff different colors
    use {"p00f/nvim-ts-rainbow", opt = true}
    require_plugin("nvim-ts-rainbow")
    -- makes extra pairs that work with %
    use {"theHamsta/nvim-treesitter-pairs", opt = true}
    require_plugin("nvim-treesitter-pairs")
    -- auto highlight the current word
    use {"RRethy/vim-illuminate", opt = true}
    require_plugin("vim-illuminate")

    -- TODO add:
    -- easyclip,
    -- the colorscheme,
    -- set up quickfix list <ctrl q> with telescope
    -- set up telescope to search project
    -- and add stuff to which-key

    use {"lewis6991/gitsigns.nvim", opt = true}
    require_plugin("gitsigns.nvim")
    require("gitsigns-nvim-config")
    use {"f-person/git-blame.nvim", opt = true}
    require_plugin("git-blame.nvim")
    require("git-blame-nvim-config")
    use {"folke/which-key.nvim", opt = true}
    require_plugin("which-key.nvim")
    require("which-key-nvim-config")
    use {"windwp/nvim-autopairs", opt = true}
    require_plugin("nvim-autopairs")
    require("nvim-autopairs-config")
    use {"kevinhwang91/nvim-bqf", opt = true}
    require_plugin("nvim-bqf")

    -- Comments
    use {"tpope/vim-commentary", opt = true}
    require_plugin("vim-commentary")
    use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}
    require_plugin('JoosepAlviste/nvim-ts-context-commentstring')

    -- Color
    -- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    -- use {"tjdevries/colorbuddy.vim", opt = true}
    -- require_plugin("colorbuddy.vim")
    -- TODO update the functions to include the after ?
    use {"lukas-reineke/indent-blankline.nvim", opt = true, after = "material.nvim"}
    require_plugin_with_config("indent-blankline.nvim")

    use {"marko-cerovac/material.nvim", opt = true}
    require_plugin("material.nvim")
    require("material-nvim-config")

    -- Icons
    -- TODO the custome_use doesnt work here?
    use {"kyazdani42/nvim-web-devicons", opt = true}
    require_plugin("nvim-web-devicons")

    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim", opt = true}
    require_plugin("galaxyline.nvim")
    require("galaxyline-nvim-config")
    use {"romgrk/barbar.nvim", opt = true}
    require_plugin("barbar.nvim")
    require("barbar-nvim-config")

    -- Formatter
    use {"sbdchd/neoformat", opt = true}
    require_plugin("neoformat")
    use {"tpope/vim-sleuth", opt = true}
    require_plugin("vim-sleuth")
    use {"tpope/vim-repeat", opt = true}
    require_plugin("vim-repeat")
    use {"editorconfig/editorconfig-vim", opt = true}
    require_plugin("editorconfig-vim")
    require("editorconfig-vim-config")
    use {"tpope/vim-fugitive", opt = true}
    require_plugin("vim-fugitive")
    use {"shumphrey/fugitive-gitlab.vim", opt = true}
    require_plugin("fugitive-gitlab.vim")
    require("fugitive-gitlab-vim-config")
    use {"tpope/vim-rhubarb", opt = true}
    require_plugin("vim-rhubarb")
    -- TODO vim-go is messing with nvim-lint i think. taking forever to save
    -- use {
    --     'fatih/vim-go',
    --     config = function()
    --         vim.g.syntastic_go_checkers = {}
    --         vim.g.go_fmt_command = ""
    --     end
    -- }
    -- use {"~/go/pkg/mod/github.com/zchee/nvim-go@v0.3.0/plugin/nvim-go.vim", opt = true, run = "make"}
    use {"mfussenegger/nvim-lint", opt = true}
    require_plugin("nvim-lint")
    require("nvim-lint-config")

    -- use {"svermeulen/vim-easyclip", opt = true}
    -- require_plugin("vim-easyclip")
    -- require("vim-easyclip-config")

    -- require_plugin("popup.nvim")
    -- require_plugin("telescope.nvim")
    -- require_plugin('telescope-project.nvim')
    -- require_plugin("nvim-tree.lua")
    -- require_plugin("nvcode-color-schemes.vim")
end)
