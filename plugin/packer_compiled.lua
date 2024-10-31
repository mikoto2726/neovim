-- Automatically generated packer.nvim plugin loader code

if vim.api.nvim_call_function('has', {'nvim-0.5'}) ~= 1 then
  vim.api.nvim_command('echohl WarningMsg | echom "Invalid Neovim version for packer.nvim! | echohl None"')
  return
end

vim.api.nvim_command('packadd packer.nvim')

local no_errors, error_msg = pcall(function()

_G._packer = _G._packer or {}
_G._packer.inside_compile = true

local time
local profile_info
local should_profile = false
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
  if threshold then
    table.insert(results, '(Only showing plugins that took longer than ' .. threshold .. ' ms ' .. 'to load)')
  end

  _G._packer.profile_output = results
end

time([[Luarocks path setup]], true)
local package_path_str = "/home/kali/.cache/nvim/packer_hererocks/2.1.1723681758/share/lua/5.1/?.lua;/home/kali/.cache/nvim/packer_hererocks/2.1.1723681758/share/lua/5.1/?/init.lua;/home/kali/.cache/nvim/packer_hererocks/2.1.1723681758/lib/luarocks/rocks-5.1/?.lua;/home/kali/.cache/nvim/packer_hererocks/2.1.1723681758/lib/luarocks/rocks-5.1/?/init.lua"
local install_cpath_pattern = "/home/kali/.cache/nvim/packer_hererocks/2.1.1723681758/lib/lua/5.1/?.so"
if not string.find(package.path, package_path_str, 1, true) then
  package.path = package.path .. ';' .. package_path_str
end

if not string.find(package.cpath, install_cpath_pattern, 1, true) then
  package.cpath = package.cpath .. ';' .. install_cpath_pattern
end

time([[Luarocks path setup]], false)
time([[try_loadstring definition]], true)
local function try_loadstring(s, component, name)
  local success, result = pcall(loadstring(s), name, _G.packer_plugins[name])
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
  ale = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/ale",
    url = "https://github.com/dense-analysis/ale"
  },
  ["auto-pairs"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/auto-pairs",
    url = "https://github.com/jiangmiao/auto-pairs"
  },
  ["coc.nvim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/coc.nvim",
    url = "https://github.com/neoclide/coc.nvim"
  },
  ["eslint.nvim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/eslint.nvim",
    url = "https://github.com/MunifTanjim/eslint.nvim"
  },
  fzf = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/fzf",
    url = "https://github.com/junegunn/fzf"
  },
  ["fzf.vim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/fzf.vim",
    url = "https://github.com/junegunn/fzf.vim"
  },
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\nò\5\0\0\6\0\27\0>6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\5\0005\5\6\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\a\0005\5\b\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\t\0005\5\n\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\v\0005\5\f\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\r\0005\5\14\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\15\0005\5\16\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\17\0005\5\18\0B\1\4\0019\1\19\0005\3\23\0005\4\20\0005\5\21\0=\5\22\4=\4\24\0035\4\25\0=\4\26\3B\1\2\1K\0\1\0\nscope\1\0\4\fenabled\2\14highlight\rIblScope\rshow_end\2\15show_start\2\vindent\1\0\2\nscope\0\vindent\0\14highlight\1\a\0\0\17IndentLevel1\17IndentLevel2\17IndentLevel3\17IndentLevel4\17IndentLevel5\17IndentLevel6\1\0\2\14highlight\0\tchar\bâ”‚\nsetup\1\0\2\afg\f#89a7d0\14nocombine\2\rIblScope\1\0\2\afg\f#8aaed0\14nocombine\2\17IndentLevel6\1\0\2\afg\f#729bc4\14nocombine\2\17IndentLevel5\1\0\2\afg\f#5a8bb8\14nocombine\2\17IndentLevel4\1\0\2\afg\f#447aad\14nocombine\2\17IndentLevel3\1\0\2\afg\f#316aa1\14nocombine\2\17IndentLevel2\1\0\2\afg\f#205d96\14nocombine\2\17IndentLevel1\16nvim_set_hl\bapi\bvim\bibl\frequire\0" },
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  ["lightline.vim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/lightline.vim",
    url = "https://github.com/itchyny/lightline.vim"
  },
  nerdtree = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nerdtree-git-plugin"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/nerdtree-git-plugin",
    url = "https://github.com/Xuyuanp/nerdtree-git-plugin"
  },
  ["nvim-treesitter"] = {
    config = { "\27LJ\2\n¬\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\tfold\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\blua\1\0\2\fdisable\0\venable\2\21ensure_installed\1\0\4\vindent\0\21ensure_installed\0\tfold\0\14highlight\0\1\a\0\0\15javascript\15typescript\btsx\tjson\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0" },
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/nvim-treesitter",
    url = "https://github.com/nvim-treesitter/nvim-treesitter"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  },
  ["prettier.nvim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/prettier.nvim",
    url = "https://github.com/MunifTanjim/prettier.nvim"
  },
  ["tokyonight.nvim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/tokyonight.nvim",
    url = "https://github.com/folke/tokyonight.nvim"
  },
  ["vim-gitgutter"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/vim-gitgutter",
    url = "https://github.com/airblade/vim-gitgutter"
  },
  ["vim-rainbow"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/vim-rainbow",
    url = "https://github.com/frazrepo/vim-rainbow"
  },
  ["vim-snippets"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/vim-snippets",
    url = "https://github.com/honza/vim-snippets"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: nvim-treesitter
time([[Config for nvim-treesitter]], true)
try_loadstring("\27LJ\2\n¬\2\0\0\5\0\14\0\0176\0\0\0'\2\1\0B\0\2\0029\0\2\0005\2\4\0005\3\3\0=\3\5\0025\3\6\0005\4\a\0=\4\b\3=\3\t\0025\3\n\0=\3\v\0025\3\f\0=\3\r\2B\0\2\1K\0\1\0\tfold\1\0\1\venable\2\vindent\1\0\1\venable\2\14highlight\fdisable\1\2\0\0\blua\1\0\2\fdisable\0\venable\2\21ensure_installed\1\0\4\vindent\0\21ensure_installed\0\tfold\0\14highlight\0\1\a\0\0\15javascript\15typescript\btsx\tjson\thtml\bcss\nsetup\28nvim-treesitter.configs\frequire\0", "config", "nvim-treesitter")
time([[Config for nvim-treesitter]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\nò\5\0\0\6\0\27\0>6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\5\0005\5\6\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\a\0005\5\b\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\t\0005\5\n\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\v\0005\5\f\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\r\0005\5\14\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\15\0005\5\16\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\17\0005\5\18\0B\1\4\0019\1\19\0005\3\23\0005\4\20\0005\5\21\0=\5\22\4=\4\24\0035\4\25\0=\4\26\3B\1\2\1K\0\1\0\nscope\1\0\4\fenabled\2\14highlight\rIblScope\rshow_end\2\15show_start\2\vindent\1\0\2\nscope\0\vindent\0\14highlight\1\a\0\0\17IndentLevel1\17IndentLevel2\17IndentLevel3\17IndentLevel4\17IndentLevel5\17IndentLevel6\1\0\2\14highlight\0\tchar\bâ”‚\nsetup\1\0\2\afg\f#89a7d0\14nocombine\2\rIblScope\1\0\2\afg\f#8aaed0\14nocombine\2\17IndentLevel6\1\0\2\afg\f#729bc4\14nocombine\2\17IndentLevel5\1\0\2\afg\f#5a8bb8\14nocombine\2\17IndentLevel4\1\0\2\afg\f#447aad\14nocombine\2\17IndentLevel3\1\0\2\afg\f#316aa1\14nocombine\2\17IndentLevel2\1\0\2\afg\f#205d96\14nocombine\2\17IndentLevel1\16nvim_set_hl\bapi\bvim\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)

_G._packer.inside_compile = false
if _G._packer.needs_bufread == true then
  vim.cmd("doautocmd BufRead")
end
_G._packer.needs_bufread = false

if should_profile then save_profiles() end

end)

if not no_errors then
  error_msg = error_msg:gsub('"', '\\"')
  vim.api.nvim_command('echohl ErrorMsg | echom "Error in packer_compiled: '..error_msg..'" | echom "Please check your config for correctness" | echohl None')
end
