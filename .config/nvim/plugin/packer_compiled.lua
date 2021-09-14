-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

  local time
  local profile_info
  local should_profile = true
  if should_profile then
    local hrtime = vim.loop.hrtime
    profile_info = {}
    time = function(chunk, start)
      if start then
        profile_info[chunk] = hrtime()
      else
        profile_info[chunk] = (hrtime() - profile_info[chunk]) / 1e6
      end
    end
  else
    time = function(chunk, start) end
  end
  
local function save_profiles(threshold)
  local sorted_times = {}
  for chunk_name, time_taken in pairs(profile_info) do
    sorted_times[#sorted_times + 1] = {chunk_name, time_taken}
  end
  table.sort(sorted_times, function(a, b) return a[2] > b[2] end)
  local results = {}
  for i, elem in ipairs(sorted_times) do
    if not threshold or threshold and elem[2] > threshold then
      results[i] = elem[1] .. ' took ' .. elem[2] .. 'ms'
    end
  end

  _G._packer = _G._packer or {}
  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/lckdscl/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?.lua;/home/lckdscl/.cache/nvim/packer_hererocks/2.0.5/share/lua/5.1/?/init.lua;/home/lckdscl/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?.lua;/home/lckdscl/.cache/nvim/packer_hererocks/2.0.5/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/lckdscl/.cache/nvim/packer_hererocks/2.0.5/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s))
  if not success then
    vim.schedule(function()
      vim.api.nvim_notify('packer.nvim: Error running ' .. component .. ' for ' .. name .. ': ' .. result, vim.log.levels.ERROR, {})
    end)
  end
  return result
end

time([[try_loadstring definition]], false)
time([[Defining packer_plugins]], true)
_G.packer_plugins = {
  ["alpha-nvim"] = {
    commands = { "Alpha" },
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18configs.alpha\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/alpha-nvim"
  },
  ["auto-pairs"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.autopairs\frequire\0" },
    loaded = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/start/auto-pairs"
  },
  ["barbar.nvim"] = {
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19configs.barbar\frequire\0" },
    loaded = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/start/barbar.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["better-escape.vim"] = {
    config = { "\27LJ\1\2f\0\0\2\0\5\0\t4\0\0\0007\0\1\0'\1,\1:\1\2\0004\0\0\0007\0\1\0003\1\4\0:\1\3\0G\0\1\0\1\2\0\0\ajk\27better_escape_shortcut\27better_escape_interval\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/better-escape.vim"
  },
  ["cleanfold.nvim"] = {
    config = { "\27LJ\1\0027\0\0\2\0\3\0\0064\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\1G\0\1\0\nsetup\14cleanfold\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/cleanfold.nvim"
  },
  ["colorbuddy.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23configs.colorbuddy\frequire\0" },
    load_after = {
      ["packer.nvim"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/colorbuddy.nvim"
  },
  ["foldsigns.nvim"] = {
    config = { "\27LJ\1\2l\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\4\0003\2\3\0:\2\5\1>\0\2\1G\0\1\0\fexclude\1\0\0\1\2\0\0\30LspDiagnosticsSignWarning\nsetup\14foldsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/foldsigns.nvim"
  },
  ["galaxyline.nvim"] = {
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23configs.statusline\frequire\0" },
    loaded = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/start/galaxyline.nvim",
    wants = { "nvim-web-devicons" }
  },
  ["gitsigns.nvim"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21configs.gitsigns\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/gitsigns.nvim"
  },
  ["grammar-guard.nvim"] = {
    loaded = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/start/grammar-guard.nvim",
    wants = { "nvim-lspconfig" }
  },
  ["impatient.nvim"] = {
    loaded = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/start/impatient.nvim"
  },
  ["indent-blankline.nvim"] = {
    commands = { "IndentBlanklineEnable" },
    config = { "\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19configs.indent\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/indent-blankline.nvim"
  },
  ["jupytext.vim"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/jupytext.vim"
  },
  kommentary = {
    config = { "\27LJ\1\2«\1\0\0\3\0\b\0\f4\0\0\0007\0\1\0)\1\2\0:\1\2\0004\0\3\0%\1\4\0>\0\2\0027\0\5\0%\1\6\0003\2\a\0>\0\3\1G\0\1\0\1\0\1\22ignore_whitespace\2\fdefault\23configure_language\22kommentary.config\frequire'kommentary_create_default_mappings\6g\bvim\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/kommentary"
  },
  ["lsp_signature.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/lsp_signature.nvim"
  },
  neoformat = {
    commands = { "Neoformat" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/neoformat"
  },
  ["neoscroll.nvim"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.neoscroll\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/neoscroll.nvim"
  },
  ["nvim-colorizer.lua"] = {
    commands = { "ColorizerToggle" },
    config = { "\27LJ\1\2g\0\0\2\0\6\0\n4\0\0\0%\1\1\0>\0\2\0027\0\2\0>\0\1\0014\0\3\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0\28ColorizerAttachToBuffer\bcmd\bvim\nsetup\14colorizer\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-colorizer.lua"
  },
  ["nvim-compe"] = {
    after_files = { "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-compe/after/plugin/compe.vim" },
    config = { "\27LJ\1\2-\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\18configs.compe\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-compe",
    wants = { "ultisnips" }
  },
  ["nvim-lightbulb"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-lightbulb"
  },
  ["nvim-lspconfig"] = {
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.lspconfig\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-lspconfig"
  },
  ["nvim-tree.lua"] = {
    loaded = true,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-tree.lua"
  },
  ["nvim-treesitter"] = {
    after = { "spellsitter.nvim" },
    config = { "\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23configs.treesitter\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-treesitter"
  },
  ["nvim-ts-rainbow"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/nvim-ts-rainbow"
  },
  ["nvim-web-devicons"] = {
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21configs.devicons\frequire\0" },
    loaded = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/start/nvim-web-devicons"
  },
  ["packer.nvim"] = {
    after = { "colorbuddy.nvim" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/packer.nvim"
  },
  ["plenary.nvim"] = {
    loaded = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/start/plenary.nvim"
  },
  ["spellsitter.nvim"] = {
    config = { "\27LJ\1\2i\0\0\3\0\6\0\t4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0003\2\4\0:\2\5\1>\0\2\1G\0\1\0\rcaptures\1\2\0\0\fcomment\1\0\1\ahl\rSpellBad\nsetup\16spellsitter\frequire\0" },
    load_after = {
      ["nvim-treesitter"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/spellsitter.nvim"
  },
  ["surround.nvim"] = {
    config = { "\27LJ\1\2U\0\0\2\0\4\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0003\1\3\0>\0\2\1G\0\1\0\1\0\1\19mappings_style\rsurround\nsetup\rsurround\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/surround.nvim"
  },
  ["sxhkd-vim"] = {
    loaded = false,
    needs_bufread = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/sxhkd-vim"
  },
  ["symbols-outline.nvim"] = {
    commands = { "SymbolsOutline", "SymbolsOutlineOpen", "SymbolsOutlineClose" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/symbols-outline.nvim"
  },
  tabular = {
    after_files = { "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/tabular/after/plugin/TabularMaps.vim" },
    load_after = {
      ["vim-markdown"] = true
    },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/tabular"
  },
  ["telescope-fzf-native.nvim"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/telescope-fzf-native.nvim"
  },
  ["telescope-zoxide"] = {
    commands = { "Telescope" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/telescope-zoxide"
  },
  ["telescope.nvim"] = {
    commands = { "Telescope" },
    config = { "\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.telescope\frequire\0" },
    loaded = false,
    needs_bufread = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/telescope.nvim"
  },
  ["tex-conceal.vim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/tex-conceal.vim"
  },
  ["twilight.nvim"] = {
    commands = { "Twilight" },
    config = { "\27LJ\1\2:\0\0\2\0\3\0\a4\0\0\0%\1\1\0>\0\2\0027\0\2\0002\1\0\0>\0\2\1G\0\1\0\nsetup\rtwilight\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/twilight.nvim"
  },
  ultisnips = {
    after_files = { "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/ultisnips/after/plugin/UltiSnips_after.vim" },
    config = { '\27LJ\1\2g\0\0\2\0\3\0\0054\0\0\0007\0\1\0%\1\2\0>\0\2\1G\0\1\0Hlet g:UltiSnipsSnippetDirectories=[$HOME."/.config/nvim/ultisnips"]\bcmd\bvim\0' },
    loaded = false,
    needs_bufread = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/ultisnips"
  },
  undotree = {
    commands = { "UndotreeToggle" },
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21configs.undotree\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/undotree"
  },
  ["vim-easy-align"] = {
    keys = { { "", "<Plug>(EasyAlign)" } },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/vim-easy-align"
  },
  ["vim-floaterm"] = {
    commands = { "FloatermNew", "FloatermToggle", "FloatermNext", "FloatermPrev", "FloatermKill" },
    config = { "\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21configs.floaterm\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/vim-floaterm"
  },
  ["vim-fugitive"] = {
    commands = { "Git", "Gdiff", "Gdiffsplit", "Gvdiffsplit", "Gwrite", "Gw" },
    loaded = false,
    needs_bufread = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/vim-fugitive"
  },
  ["vim-markdown"] = {
    after = { "tabular" },
    loaded = false,
    needs_bufread = true,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/vim-markdown",
    wants = { "tabular" }
  },
  ["wilder.nvim"] = {
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/wilder.nvim"
  },
  ["zen-mode.nvim"] = {
    commands = { "ZenMode" },
    config = { "\27LJ\1\2+\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\16configs.zen\frequire\0" },
    loaded = false,
    needs_bufread = false,
    path = "/home/lckdscl/.local/share/nvim/site/pack/packer/opt/zen-mode.nvim",
    wants = { "twilight.nvim" }
  }
}

time([[Defining packer_plugins]], false)
-- Setup for: nvim-tree.lua
time([[Setup for nvim-tree.lua]], true)
try_loadstring("\27LJ\1\2,\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\17configs.tree\frequire\0", "setup", "nvim-tree.lua")
time([[Setup for nvim-tree.lua]], false)
time([[packadd for nvim-tree.lua]], true)
vim.cmd [[packadd nvim-tree.lua]]
time([[packadd for nvim-tree.lua]], false)
-- Setup for: jupytext.vim
time([[Setup for jupytext.vim]], true)
try_loadstring("\27LJ\1\2|\0\0\2\0\6\0\t4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\4\0%\1\5\0>\0\2\1G\0\1\0003let g:jupytext_filetype_map = {'py': 'python'}\bcmd\15py:percent\17jupytext_fmt\6g\bvim\0", "setup", "jupytext.vim")
time([[Setup for jupytext.vim]], false)
time([[packadd for jupytext.vim]], true)
vim.cmd [[packadd jupytext.vim]]
time([[packadd for jupytext.vim]], false)
-- Setup for: symbols-outline.nvim
time([[Setup for symbols-outline.nvim]], true)
try_loadstring("\27LJ\1\2/\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\20configs.outline\frequire\0", "setup", "symbols-outline.nvim")
time([[Setup for symbols-outline.nvim]], false)
-- Setup for: ultisnips
time([[Setup for ultisnips]], true)
try_loadstring("\27LJ\1\2¥\1\0\0\2\0\b\0\r4\0\0\0007\0\1\0%\1\3\0:\1\2\0004\0\0\0007\0\1\0%\1\5\0:\1\4\0004\0\0\0007\0\1\0%\1\a\0:\1\6\0G\0\1\0\f<s-tab>!UltiSnipsJumpBackwardTrigger\n<tab> UltiSnipsJumpForwardTrigger\n<nop>\27UltiSnipsExpandTrigger\6g\bvim\0", "setup", "ultisnips")
time([[Setup for ultisnips]], false)
-- Setup for: vim-markdown
time([[Setup for vim-markdown]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21configs.markdown\frequire\0", "setup", "vim-markdown")
time([[Setup for vim-markdown]], false)
-- Config for: galaxyline.nvim
time([[Config for galaxyline.nvim]], true)
try_loadstring("\27LJ\1\0022\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\23configs.statusline\frequire\0", "config", "galaxyline.nvim")
time([[Config for galaxyline.nvim]], false)
-- Config for: auto-pairs
time([[Config for auto-pairs]], true)
try_loadstring("\27LJ\1\0021\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\22configs.autopairs\frequire\0", "config", "auto-pairs")
time([[Config for auto-pairs]], false)
-- Config for: barbar.nvim
time([[Config for barbar.nvim]], true)
try_loadstring("\27LJ\1\2.\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\19configs.barbar\frequire\0", "config", "barbar.nvim")
time([[Config for barbar.nvim]], false)
-- Config for: nvim-web-devicons
time([[Config for nvim-web-devicons]], true)
try_loadstring("\27LJ\1\0020\0\0\2\0\2\0\0044\0\0\0%\1\1\0>\0\2\1G\0\1\0\21configs.devicons\frequire\0", "config", "nvim-web-devicons")
time([[Config for nvim-web-devicons]], false)

-- Command lazy-loads
time([[Defining lazy-load commands]], true)
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Telescope lua require("packer.load")({'telescope-zoxide', 'telescope-fzf-native.nvim', 'telescope.nvim'}, { cmd = "Telescope", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ZenMode lua require("packer.load")({'zen-mode.nvim'}, { cmd = "ZenMode", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Alpha lua require("packer.load")({'alpha-nvim'}, { cmd = "Alpha", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermKill lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermKill", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutline lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutline", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Twilight lua require("packer.load")({'twilight.nvim'}, { cmd = "Twilight", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiff lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiff", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineClose lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineClose", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gw lua require("packer.load")({'vim-fugitive'}, { cmd = "Gw", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file SymbolsOutlineOpen lua require("packer.load")({'symbols-outline.nvim'}, { cmd = "SymbolsOutlineOpen", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gwrite lua require("packer.load")({'vim-fugitive'}, { cmd = "Gwrite", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gvdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gvdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file UndotreeToggle lua require("packer.load")({'undotree'}, { cmd = "UndotreeToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermNew lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermNew", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermToggle lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Neoformat lua require("packer.load")({'neoformat'}, { cmd = "Neoformat", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermPrev lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermPrev", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Gdiffsplit lua require("packer.load")({'vim-fugitive'}, { cmd = "Gdiffsplit", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file IndentBlanklineEnable lua require("packer.load")({'indent-blankline.nvim'}, { cmd = "IndentBlanklineEnable", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file Git lua require("packer.load")({'vim-fugitive'}, { cmd = "Git", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file FloatermNext lua require("packer.load")({'vim-floaterm'}, { cmd = "FloatermNext", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
pcall(vim.cmd, [[command -nargs=* -range -bang -complete=file ColorizerToggle lua require("packer.load")({'nvim-colorizer.lua'}, { cmd = "ColorizerToggle", l1 = <line1>, l2 = <line2>, bang = <q-bang>, args = <q-args> }, _G.packer_plugins)]])
time([[Defining lazy-load commands]], false)

-- Keymap lazy-loads
time([[Defining lazy-load keymaps]], true)
vim.cmd [[noremap <silent> <Plug>(EasyAlign) <cmd>lua require("packer.load")({'vim-easy-align'}, { keys = "<lt>Plug>(EasyAlign)", prefix = "" }, _G.packer_plugins)<cr>]]
time([[Defining lazy-load keymaps]], false)

vim.cmd [[augroup packer_load_aucmds]]
vim.cmd [[au!]]
  -- Filetype lazy-loads
time([[Defining lazy-load filetype autocommands]], true)
vim.cmd [[au FileType lua ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "lua" }, _G.packer_plugins)]]
vim.cmd [[au FileType html ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "html" }, _G.packer_plugins)]]
vim.cmd [[au FileType typescript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "typescript" }, _G.packer_plugins)]]
vim.cmd [[au FileType sass ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "sass" }, _G.packer_plugins)]]
vim.cmd [[au FileType cfg ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "cfg" }, _G.packer_plugins)]]
vim.cmd [[au FileType json ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "json" }, _G.packer_plugins)]]
vim.cmd [[au FileType conf ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "conf" }, _G.packer_plugins)]]
vim.cmd [[au FileType ini ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "ini" }, _G.packer_plugins)]]
vim.cmd [[au FileType javascript ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "javascript" }, _G.packer_plugins)]]
vim.cmd [[au FileType markdown ++once lua require("packer.load")({'vim-markdown'}, { ft = "markdown" }, _G.packer_plugins)]]
vim.cmd [[au FileType vim ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "vim" }, _G.packer_plugins)]]
vim.cmd [[au FileType dosini ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "dosini" }, _G.packer_plugins)]]
vim.cmd [[au FileType sxhkd ++once lua require("packer.load")({'sxhkd-vim'}, { ft = "sxhkd" }, _G.packer_plugins)]]
vim.cmd [[au FileType css ++once lua require("packer.load")({'nvim-colorizer.lua'}, { ft = "css" }, _G.packer_plugins)]]
vim.cmd [[au FileType tex ++once lua require("packer.load")({'tex-conceal.vim'}, { ft = "tex" }, _G.packer_plugins)]]
time([[Defining lazy-load filetype autocommands]], false)
  -- Event lazy-loads
time([[Defining lazy-load event autocommands]], true)
vim.cmd [[au WinScrolled * ++once lua require("packer.load")({'neoscroll.nvim'}, { event = "WinScrolled *" }, _G.packer_plugins)]]
vim.cmd [[au CursorMoved * ++once lua require("packer.load")({'kommentary'}, { event = "CursorMoved *" }, _G.packer_plugins)]]
vim.cmd [[au VimEnter * ++once lua require("packer.load")({'packer.nvim'}, { event = "VimEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufRead * ++once lua require("packer.load")({'lsp_signature.nvim', 'nvim-treesitter', 'cleanfold.nvim', 'gitsigns.nvim', 'nvim-lightbulb', 'nvim-lspconfig', 'nvim-ts-rainbow', 'foldsigns.nvim'}, { event = "BufRead *" }, _G.packer_plugins)]]
vim.cmd [[au InsertEnter * ++once lua require("packer.load")({'better-escape.vim', 'nvim-compe', 'ultisnips'}, { event = "InsertEnter *" }, _G.packer_plugins)]]
vim.cmd [[au BufEnter * ++once lua require("packer.load")({'wilder.nvim', 'surround.nvim'}, { event = "BufEnter *" }, _G.packer_plugins)]]
time([[Defining lazy-load event autocommands]], false)
vim.cmd("augroup END")
vim.cmd [[augroup filetypedetect]]
time([[Sourcing ftdetect script at: /home/lckdscl/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], true)
vim.cmd [[source /home/lckdscl/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]]
time([[Sourcing ftdetect script at: /home/lckdscl/.local/share/nvim/site/pack/packer/opt/vim-markdown/ftdetect/markdown.vim]], false)
time([[Sourcing ftdetect script at: /home/lckdscl/.local/share/nvim/site/pack/packer/opt/sxhkd-vim/ftdetect/sxhkd.vim]], true)
vim.cmd [[source /home/lckdscl/.local/share/nvim/site/pack/packer/opt/sxhkd-vim/ftdetect/sxhkd.vim]]
time([[Sourcing ftdetect script at: /home/lckdscl/.local/share/nvim/site/pack/packer/opt/sxhkd-vim/ftdetect/sxhkd.vim]], false)
vim.cmd("augroup END")
if should_profile then save_profiles(0) end

end)

if not no_errors then
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
