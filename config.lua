-- LunarVim - Customized by Nimajjj

-- default LunarVim config :


-- Enable powershell as your default shell
vim.opt.shell = "pwsh.exe"
vim.opt.shellcmdflag =
  "-NoLogo -NoProfile -ExecutionPolicy RemoteSigned -Command [Console]::InputEncoding=[Console]::OutputEncoding=[System.Text.Encoding]::UTF8;"
vim.cmd [[
		let &shellredir = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		let &shellpipe = '2>&1 | Out-File -Encoding UTF8 %s; exit $LastExitCode'
		set shellquote= shellxquote=
  ]]

-- Set a compatible clipboard manager
vim.g.clipboard = {
  copy = {
    ["+"] = "win32yank.exe -i --crlf",
    ["*"] = "win32yank.exe -i --crlf",
  },
  paste = {
    ["+"] = "win32yank.exe -o --lf",
    ["*"] = "win32yank.exe -o --lf",
  },
}

-- general
lvim.log.level = "warn"
lvim.format_on_save.enabled = false

-- keymappings [view all the defaults by pressing <leader>Lk]
lvim.leader = "space"
-- add your own keymapping
lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
-- lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
-- lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"
-- unmap a default keymapping
-- vim.keymap.del("n", "<C-Up>")
-- override a default keymapping
-- lvim.keys.normal_mode["<C-q>"] = ":q<cr>" -- or vim.keymap.set("n", "<C-q>", ":q<cr>" )


-- After changing plugin config exit and reopen LunarVim, Run :PackerInstall :PackerCompile
lvim.builtin.alpha.active = true
lvim.builtin.alpha.mode = "dashboard"
lvim.builtin.terminal.active = false


-- nvim-tree has some performance issues on windows, see kyazdani42/nvim-tree.lua#549
lvim.builtin.nvimtree.setup.diagnostics.enable = nil
lvim.builtin.nvimtree.setup.filters.custom = nil
lvim.builtin.nvimtree.setup.git.enable = nil
lvim.builtin.nvimtree.setup.update_cwd = nil
lvim.builtin.nvimtree.setup.update_focused_file.update_cwd = nil
lvim.builtin.nvimtree.setup.view.side = "left"
lvim.builtin.nvimtree.setup.renderer.highlight_git = nil
lvim.builtin.nvimtree.setup.renderer.icons.show.git = nil

-- if you don't want all the parsers change this to a table of the ones you want
lvim.builtin.treesitter.ensure_installed = {
  "cpp",
  "c",
  "lua",
}

lvim.builtin.treesitter.ignore_install = { "haskell" }
lvim.builtin.treesitter.highlight.enable = true



-- Custom config :

-- general
lvim.colorscheme = "gruvbox"
lvim.keys.normal_mode["<Left>"] = "<Nop>"
lvim.keys.normal_mode["<Down>"] = "<Nop>"
lvim.keys.normal_mode["<Up>"] = "<Nop>"
lvim.keys.normal_mode["<Right>"] = "<Nop>"


-- plugins
lvim.plugins = {
  {"lunarvim/colorschemes"},        -- colorscheme
  {"ellisonleao/gruvbox.nvim"},     -- colorscheme
  {"phaazon/hop.nvim"},             -- jumping in file
  {"doums/oterm.nvim"},             -- floating terminal
  {
    "iamcco/markdown-preview.nvim", -- markdown preview in browser
    run = "cd app && npm install",
    ft = "markdown",
    config = function()
      vim.g.mkdp_auto_start = 1
    end,
  },
  {"wakatime/vim-wakatime"},        -- code time stats
  {"nvim-telescope/telescope-file-browser.nvim"}  -- telescope file browser
}


-- telescope 
lvim.keys.normal_mode["<Space>lg"] = ":Telescope live_grep<cr>"
lvim.keys.normal_mode["<Space>f"] = ":Telescope find_files<cr>"
require("telescope").load_extension "file_browser"


-- hop.nvim
require'hop'.setup()
lvim.keys.normal_mode["<Space><Space>"] = ":HopWord<cr>"


-- oterm.nvim
require('oterm').setup({
  layout = 'center',
  split_hl = nil,
  height = 0.75,
  width = 0.85,
  keymaps = { exit = '<A-q>', normal = '<A-n>' },
})

lvim.keys.normal_mode["<F5>"] = ":Ot<cr>"


-- clangd
lvim.keys.normal_mode["<Space>hh"] = ":ClangdSwitchSourceHeader<cr>"


-- whichkey
require("which-key").setup()
lvim.builtin.which_key.mappings = {
  ["e"] = { "<cmd>NvimTreeToggle<CR>", "Explorer" },
  ["h"] = { '<cmd>let @/=""<CR>', "No Highlight" },

  p = {
    name = "Packer",
    c = { "<cmd>PackerCompile<cr>", "Compile" },
    i = { "<cmd>PackerInstall<cr>", "Install" },
    r = { "<cmd>LvimReload<cr>", "Reload" },
    s = { "<cmd>PackerSync<cr>", "Sync" },
    u = { "<cmd>PackerUpdate<cr>", "Update" },
  },
}
