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
  ["indent-blankline.nvim"] = {
    config = { "\27LJ\2\né\3\0\0\5\0\17\00026\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0005\4\4\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\5\0005\4\6\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\a\0005\4\b\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\t\0005\4\n\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\v\0005\4\f\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\r\0005\4\14\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\15\0005\4\16\0B\0\4\1K\0\1\0\1\0\2\14nocombine\2\afg\f#FFD700\rIblScope\1\0\2\14nocombine\2\afg\f#C678DD\17IndentLevel6\1\0\2\14nocombine\2\afg\f#61AFEF\17IndentLevel5\1\0\2\14nocombine\2\afg\f#56B6C2\17IndentLevel4\1\0\2\14nocombine\2\afg\f#98C379\17IndentLevel3\1\0\2\14nocombine\2\afg\f#E5C07B\17IndentLevel2\1\0\2\14nocombine\2\afg\f#E06C75\17IndentLevel1\16nvim_set_hl\bapi\bvimÓ\6\1\0\6\0 \0F6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\5\0005\5\6\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\a\0005\5\b\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\t\0005\5\n\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\v\0005\5\f\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\r\0005\5\14\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\15\0005\5\16\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\17\0005\5\18\0B\1\4\0016\1\2\0009\1\3\0019\1\19\1'\3\20\0005\4\21\0003\5\22\0=\5\23\4B\1\3\0019\1\24\0005\3\28\0005\4\25\0005\5\26\0=\5\27\4=\4\29\0035\4\30\0=\4\31\3B\1\2\1K\0\1\0\nscope\1\0\4\fenabled\2\14highlight\rIblScope\rshow_end\2\15show_start\2\vindent\1\0\2\nscope\0\vindent\0\14highlight\1\a\0\0\17IndentLevel1\17IndentLevel2\17IndentLevel3\17IndentLevel4\17IndentLevel5\17IndentLevel6\1\0\2\tchar\bâ”‚\14highlight\0\nsetup\rcallback\0\1\0\2\rcallback\0\fpattern\6*\16ColorScheme\24nvim_create_autocmd\1\0\2\14nocombine\2\afg\f#FFD700\rIblScope\1\0\2\14nocombine\2\afg\f#C678DD\17IndentLevel6\1\0\2\14nocombine\2\afg\f#61AFEF\17IndentLevel5\1\0\2\14nocombine\2\afg\f#56B6C2\17IndentLevel4\1\0\2\14nocombine\2\afg\f#98C379\17IndentLevel3\1\0\2\14nocombine\2\afg\f#E5C07B\17IndentLevel2\1\0\2\14nocombine\2\afg\f#E06C75\17IndentLevel1\16nvim_set_hl\bapi\bvim\bibl\frequire\0" },
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/indent-blankline.nvim",
    url = "https://github.com/lukas-reineke/indent-blankline.nvim"
  },
  nerdtree = {
    config = { "\27LJ\2\n•\3\0\0\6\0\f\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\2\b\0B\0\2\0016\0\0\0009\0\t\0)\1\1\0=\1\n\0006\0\0\0009\0\a\0'\2\v\0B\0\2\1K\0\1\0%highlight NERDTreeDir guifg=blue\23NERDTreeShowHidden\6g»\1        autocmd VimEnter * NERDTree\n        autocmd bufenter * if (winnr('$') == 1 && exists('t:NERDTreeBufName') && bufname(t:NERDTreeBufName) == bufname('%')) | quit | endif\n      \bcmd\1\0\2\vsilent\2\fnoremap\2\24:NERDTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0" },
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/nerdtree",
    url = "https://github.com/preservim/nerdtree"
  },
  ["nord-vim"] = {
    config = { "\27LJ\2\nT\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\18termguicolors\6o\bvim\0" },
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/nord-vim",
    url = "https://github.com/arcticicestudio/nord-vim"
  },
  ["packer.nvim"] = {
    loaded = true,
    path = "/home/kali/.local/share/nvim/site/pack/packer/start/packer.nvim",
    url = "https://github.com/wbthomason/packer.nvim"
  }
}

time([[Defining packer_plugins]], false)
-- Config for: indent-blankline.nvim
time([[Config for indent-blankline.nvim]], true)
try_loadstring("\27LJ\2\né\3\0\0\5\0\17\00026\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\3\0005\4\4\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\5\0005\4\6\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\a\0005\4\b\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\t\0005\4\n\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\v\0005\4\f\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\r\0005\4\14\0B\0\4\0016\0\0\0009\0\1\0009\0\2\0)\2\0\0'\3\15\0005\4\16\0B\0\4\1K\0\1\0\1\0\2\14nocombine\2\afg\f#FFD700\rIblScope\1\0\2\14nocombine\2\afg\f#C678DD\17IndentLevel6\1\0\2\14nocombine\2\afg\f#61AFEF\17IndentLevel5\1\0\2\14nocombine\2\afg\f#56B6C2\17IndentLevel4\1\0\2\14nocombine\2\afg\f#98C379\17IndentLevel3\1\0\2\14nocombine\2\afg\f#E5C07B\17IndentLevel2\1\0\2\14nocombine\2\afg\f#E06C75\17IndentLevel1\16nvim_set_hl\bapi\bvimÓ\6\1\0\6\0 \0F6\0\0\0'\2\1\0B\0\2\0026\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\5\0005\5\6\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\a\0005\5\b\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\t\0005\5\n\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\v\0005\5\f\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\r\0005\5\14\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\15\0005\5\16\0B\1\4\0016\1\2\0009\1\3\0019\1\4\1)\3\0\0'\4\17\0005\5\18\0B\1\4\0016\1\2\0009\1\3\0019\1\19\1'\3\20\0005\4\21\0003\5\22\0=\5\23\4B\1\3\0019\1\24\0005\3\28\0005\4\25\0005\5\26\0=\5\27\4=\4\29\0035\4\30\0=\4\31\3B\1\2\1K\0\1\0\nscope\1\0\4\fenabled\2\14highlight\rIblScope\rshow_end\2\15show_start\2\vindent\1\0\2\nscope\0\vindent\0\14highlight\1\a\0\0\17IndentLevel1\17IndentLevel2\17IndentLevel3\17IndentLevel4\17IndentLevel5\17IndentLevel6\1\0\2\tchar\bâ”‚\14highlight\0\nsetup\rcallback\0\1\0\2\rcallback\0\fpattern\6*\16ColorScheme\24nvim_create_autocmd\1\0\2\14nocombine\2\afg\f#FFD700\rIblScope\1\0\2\14nocombine\2\afg\f#C678DD\17IndentLevel6\1\0\2\14nocombine\2\afg\f#61AFEF\17IndentLevel5\1\0\2\14nocombine\2\afg\f#56B6C2\17IndentLevel4\1\0\2\14nocombine\2\afg\f#98C379\17IndentLevel3\1\0\2\14nocombine\2\afg\f#E5C07B\17IndentLevel2\1\0\2\14nocombine\2\afg\f#E06C75\17IndentLevel1\16nvim_set_hl\bapi\bvim\bibl\frequire\0", "config", "indent-blankline.nvim")
time([[Config for indent-blankline.nvim]], false)
-- Config for: nerdtree
time([[Config for nerdtree]], true)
try_loadstring("\27LJ\2\n•\3\0\0\6\0\f\0\0216\0\0\0009\0\1\0009\0\2\0'\2\3\0'\3\4\0'\4\5\0005\5\6\0B\0\5\0016\0\0\0009\0\a\0'\2\b\0B\0\2\0016\0\0\0009\0\t\0)\1\1\0=\1\n\0006\0\0\0009\0\a\0'\2\v\0B\0\2\1K\0\1\0%highlight NERDTreeDir guifg=blue\23NERDTreeShowHidden\6g»\1        autocmd VimEnter * NERDTree\n        autocmd bufenter * if (winnr('$') == 1 && exists('t:NERDTreeBufName') && bufname(t:NERDTreeBufName) == bufname('%')) | quit | endif\n      \bcmd\1\0\2\vsilent\2\fnoremap\2\24:NERDTreeToggle<CR>\n<C-n>\6n\20nvim_set_keymap\bapi\bvim\0", "config", "nerdtree")
time([[Config for nerdtree]], false)
-- Config for: nord-vim
time([[Config for nord-vim]], true)
try_loadstring("\27LJ\2\nT\0\0\3\0\5\0\t6\0\0\0009\0\1\0+\1\2\0=\1\2\0006\0\0\0009\0\3\0'\2\4\0B\0\2\1K\0\1\0\21colorscheme nord\bcmd\18termguicolors\6o\bvim\0", "config", "nord-vim")
time([[Config for nord-vim]], false)

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
