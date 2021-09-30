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

vim.cmd "autocmd BufWritePost plugins.lua PackerCompile" -- Auto compile when there are changes in plugins.lua

-- opt = true means that the plugin is optional
return require("packer").startup(function(use)
    -- Packer can manage itself as an optional plugin
    use "wbthomason/packer.nvim"

    -- TODO refactor all of this (for now it works, but yes I know it could be wrapped in a simpler function)
    use {"neovim/nvim-lspconfig", opt = true}
    use {"glepnir/lspsaga.nvim", opt = true}
    use {"kabouzeid/nvim-lspinstall", opt = true}
    use {"folke/trouble.nvim", opt = true}
    use {"ahmedkhalf/project.nvim", opt = true}

    -- Telescope
    -- use {"nvim-lua/popup.nvim", opt = true}
    use {"nvim-lua/plenary.nvim", opt = true}
    -- use {"nvim-telescope/telescope.nvim", opt = true}
    -- use {"nvim-telescope/telescope-fzy-native.nvim", opt = true}
    -- use {"nvim-telescope/telescope-project.nvim", opt = true}

    -- Debugging
    use {"mfussenegger/nvim-dap", opt = true}

    -- Autocomplete
    use {"hrsh7th/nvim-compe", opt = true}
    use {"hrsh7th/vim-vsnip", opt = true}
    use {"rafamadriz/friendly-snippets", opt = true}

    -- Treesitter
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}
    use {"windwp/nvim-ts-autotag", opt = true}
    use {'andymass/vim-matchup', opt = true}
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
    use {'f-person/git-blame.nvim', opt = true}
    use {"folke/which-key.nvim", opt = true}
    use {"windwp/nvim-autopairs", opt = true}
    use {"kevinhwang91/nvim-bqf", opt = true}

    -- Comments
    use {"terrortylor/nvim-comment", opt = true}
    use {'JoosepAlviste/nvim-ts-context-commentstring', opt = true}

    -- Color
    -- use {"christianchiarulli/nvcode-color-schemes.vim", opt = true}
    -- use {"tjdevries/colorbuddy.vim", opt = true}
    -- require_plugin("colorbuddy.vim")
    use {"lukas-reineke/indent-blankline.nvim", opt = true, after = "material.nvim"}
    require_plugin("indent-blankline.nvim")
    use {"marko-cerovac/material.nvim", opt = true}
    require_plugin("material.nvim")

    -- Icons
    use {"kyazdani42/nvim-web-devicons", opt = true}

    -- Status Line and Bufferline
    use {"glepnir/galaxyline.nvim", opt = true}
    use {"romgrk/barbar.nvim", opt = true}

    -- Zen Mode
    use {"Pocco81/TrueZen.nvim", opt = true}

    -- Formatter
    use {"sbdchd/neoformat", opt = true}
    require_plugin("neoformat")
    use {"mfussenegger/nvim-lint", opt = true}
    require_plugin("nvim-lint")
    use {"tpope/vim-sleuth", opt = true}
    require_plugin("vim-sleuth")
    use {"tpope/vim-repeat", opt = true}
    require_plugin("vim-repeat")
    use {"editorconfig/editorconfig-vim", opt = true}
    require_plugin("editorconfig-vim")
    use {"tpope/vim-fugitive", opt = true} -- needed for :Gbrowse
    require_plugin("vim-fugitive")
    use {"shumphrey/fugitive-gitlab.vim", opt = true} -- needed for :Gbrowse. requires setup (echo 'machine api.github.com login <user> password <token>' >> ~/.netrc)
    require_plugin("fugitive-gitlab.vim")
    use {"tpope/vim-rhubarb", opt = true} -- needed for :Gbrowse. requires setup (echo 'machine api.github.com login <user> password <token>' >> ~/.netrc)
    require_plugin("vim-rhubarb")
    use {"svermeulen/vim-easyclip", opt = true} -- needed for :Gbrowse. requires setup (echo 'machine api.github.com login <user> password <token>' >> ~/.netrc)
    require_plugin("svermeulen/vim-easyclip")

    require_plugin("nvim-lspconfig")
    require_plugin("lspsaga.nvim")
    require_plugin("nvim-lspinstall")
    require_plugin('trouble.nvim')
    require_plugin("friendly-snippets")
    require_plugin("popup.nvim")
    require_plugin("plenary.nvim")
    -- require_plugin("telescope.nvim")
    -- require_plugin('telescope-project.nvim')
    require_plugin("nvim-dap")
    require_plugin("nvim-compe")
    require_plugin("vim-vsnip")
    require_plugin("nvim-treesitter")
    require_plugin("nvim-ts-autotag")
    require_plugin('vim-matchup')
    require_plugin("nvim-tree.lua")
    require_plugin("gitsigns.nvim")
    require_plugin("git-blame.nvim")
    require_plugin("which-key.nvim")
    require_plugin("nvim-autopairs")
    require_plugin("nvim-comment")
    require_plugin("nvim-bqf")
    -- require_plugin("nvcode-color-schemes.vim")
    require_plugin("nvim-web-devicons")
    require_plugin("galaxyline.nvim")
    require_plugin("barbar.nvim")
    require_plugin('project.nvim')
    require_plugin("TrueZen.nvim")
    require_plugin("nvim-ts-context-commentstring")
end)
