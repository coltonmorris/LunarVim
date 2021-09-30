local execute = vim.api.nvim_command
local fn = vim.fn

local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
    execute("!git clone https://github.com/wbthomason/packer.nvim " .. install_path)
    execute "packadd packer.nvim"
end

--- Check if a file or directory exists in this path
local function require_plugin(plugin)
    local plugin_prefix = fn.stdpath("data") .. "/site/pack/packer/opt/"

    local plugin_path = plugin_prefix .. plugin .. "/"
    --	print('test '..plugin_path)
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
    -- dots in the file/dirname make things crash
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
    -- remove the author account name from plugin
    local plugin_name = string.match(plugin, "/(.*)")

    require_plugin_with_config(plugin_name)
end

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- opt = true means that the plugin is optional
return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    custom_use(use, "wbthomason/packer.nvim")
    -- use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {"neovim/nvim-lspconfig", opt = true}
    require_plugin("nvim-lspconfig")
    custom_use(use, "glepnir/lspsaga.nvim")
    custom_use(use, "kabouzeid/nvim-lspinstall")
    custom_use(use, "folke/trouble.nvim")
    custom_use_with_config_dir(use, "ahmedkhalf/project.nvim")

    -- Telescope
    -- use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    require_plugin("plenary.nvim")
    -- use {"nvim-telescope/telescope.nvim", opt = true}
    -- use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    -- use {"nvim-telescope/telescope-project.nvim", opt = true}

    -- Debugging
    custom_use(use, "mfussenegger/nvim-dap")

    -- Autocomplete
    custom_use_with_config_dir(use, "hrsh7th/nvim-compe")
    custom_use(use, "hrsh7th/vim-vsnip")
    custom_use(use, "rafamadriz/friendly-snippets")

    -- Treesitter
    custom_use_with_config_dir(use, "nvim-treesitter/nvim-treesitter")
    custom_use(use, "windwp/nvim-ts-autotag")
    custom_use_with_config_dir(use, 'andymass/vim-matchup')
    -- show you which function you're looking at at the top of the screen
    custom_use(use, "romgrk/nvim-treesitter-context")
    -- make matching parens and stuff different colors
    custom_use(use, "p00f/nvim-ts-rainbow")
    -- makes extra pairs that work with %
    custom_use(use, "theHamsta/nvim-treesitter-pairs")
    -- auto highlight the current word
    custom_use(use, "RRethy/vim-illuminate")

    -- TODO add:
    -- easyclip,
    -- the colorscheme,
    -- set up quickfix list <ctrl q> with telescope
    -- set up telescope to search project
    -- and add stuff to which-key

    custom_use_with_config_dir(use, "lewis6991/gitsigns.nvim")
    custom_use_with_config_dir(use, 'f-person/git-blame.nvim')
    custom_use_with_config_dir(use, "folke/which-key.nvim")
    custom_use_with_config_dir(use, "windwp/nvim-autopairs")
    custom_use(use, "kevinhwang91/nvim-bqf")

    -- Comments
    custom_use_with_config_dir(use, "terrortylor/nvim-comment")
    custom_use(use, 'JoosepAlviste/nvim-ts-context-commentstring')

    -- Color
    -- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    -- use {"tjdevries/colorbuddy.vim", opt = true}
    -- require_plugin("colorbuddy.vim")
    -- TODO update the functions to include the after ?
    use {"lukas-reineke/indent-blankline.nvim", opt = true, after = "material.nvim"}
    require_plugin_with_config("indent-blankline.nvim")

    custom_use_with_config_dir(use, "marko-cerovac/material.nvim")

    -- Icons
    -- TODO the custome_use doesnt work here?
    use {"kyazdani42/nvim-web-devicons", opt = true}
    require_plugin("nvim-web-devicons")

    -- Status Line and Bufferline
    custom_use_with_config_dir(use, "glepnir/galaxyline.nvim")
    custom_use_with_config_dir(use, "romgrk/barbar.nvim")

    -- Zen Mode
    custom_use_with_config_dir(use, "Pocco81/TrueZen.nvim")

    -- Formatter
    custom_use(use, "sbdchd/neoformat")
    custom_use_with_config_dir(use, "mfussenegger/nvim-lint")
    custom_use(use, "tpope/vim-sleuth")
    custom_use(use, "tpope/vim-repeat")
    custom_use_with_config_dir(use, "editorconfig/editorconfig-vim")
    custom_use(use, "tpope/vim-fugitive")
    custom_use_with_config_dir(use, "shumphrey/fugitive-gitlab.vim")
    custom_use(use, "tpope/vim-rhubarb")
    custom_use(use, "svermeulen/vim-easyclip")

    -- require_plugin("popup.nvim")
    -- require_plugin("telescope.nvim")
    -- require_plugin('telescope-project.nvim')
    -- require_plugin("nvim-tree.lua")
    -- require_plugin("nvcode-color-schemes.vim")
end)
