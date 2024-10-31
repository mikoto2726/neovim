-- Packer のブートストラップ
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      'git',
      'clone',
      '--depth',
      '1',
      'https://github.com/wbthomason/packer.nvim',
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

-- packer.nvim の初期設定
require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Packerを自身で管理

  -- NERDTreeプラグインの設定
  use {
    'preservim/nerdtree',
    config = function()
      -- NERDTreeのショートカット設定
      vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
      
      -- NERDTreeの自動起動設定
      vim.cmd([[
        autocmd VimEnter * NERDTree
        autocmd bufenter * if (winnr('$') == 1 && exists('t:NERDTreeBufName') && bufname(t:NERDTreeBufName) == bufname('%')) | quit | endif
      ]])
      
      vim.g.NERDTreeShowHidden = 1
      vim.cmd('highlight NERDTreeDir guifg=blue')
    end
  }

  -- nord カラースキームの設定
  use {
    'arcticicestudio/nord-vim',
    config = function()
      vim.o.termguicolors = true
      vim.cmd('colorscheme nord')
    end
  }

  -- indent-blankline.nvim の設定 (バージョン 3)
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local ibl = require("ibl")

      -- ハイライトグループを定義
      vim.api.nvim_set_hl(0, "IndentLevel1", { fg = "#E06C75", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel2", { fg = "#E5C07B", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel3", { fg = "#98C379", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel4", { fg = "#56B6C2", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel5", { fg = "#61AFEF", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel6", { fg = "#C678DD", nocombine = true })
      vim.api.nvim_set_hl(0, "IblScope",    { fg = "#FFD700", nocombine = true })

      -- カラースキームが変更されたときにハイライトを再定義する
      vim.api.nvim_create_autocmd("ColorScheme", {
        pattern = "*",
        callback = function()
          vim.api.nvim_set_hl(0, "IndentLevel1", { fg = "#E06C75", nocombine = true })
          vim.api.nvim_set_hl(0, "IndentLevel2", { fg = "#E5C07B", nocombine = true })
          vim.api.nvim_set_hl(0, "IndentLevel3", { fg = "#98C379", nocombine = true })
          vim.api.nvim_set_hl(0, "IndentLevel4", { fg = "#56B6C2", nocombine = true })
          vim.api.nvim_set_hl(0, "IndentLevel5", { fg = "#61AFEF", nocombine = true })
          vim.api.nvim_set_hl(0, "IndentLevel6", { fg = "#C678DD", nocombine = true })
          vim.api.nvim_set_hl(0, "IblScope",    { fg = "#FFD700", nocombine = true })
        end,
      })

      -- プラグインの設定
      ibl.setup {
        indent = {
          char = '│',
          highlight = {
            "IndentLevel1",
            "IndentLevel2",
            "IndentLevel3",
            "IndentLevel4",
            "IndentLevel5",
            "IndentLevel6",
          },
        },
        scope = {
          enabled = true,
          show_start = true,
          show_end = true,
          highlight = "IblScope",
        },
      }
    end
  }

  -- 他のプラグインの設定
  -- ...

  -- packer_bootstrap が true の場合、自動的に PackerSync を実行
  if packer_bootstrap then
    require('packer').sync()
  end
end)

-- 基本設定
vim.o.background = 'dark'
vim.o.backspace = 'indent,eol,start'
vim.o.number = true
vim.o.tabstop = 4
vim.o.shiftwidth = 4
vim.o.expandtab = true
vim.o.clipboard = 'unnamedplus'
vim.cmd('syntax enable')

-- 背景を透明にする設定
vim.cmd [[
  augroup TransparentBG
    autocmd!
    autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi NormalNC guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE
  augroup END
]]

-- その他の設定やキーマッピング
-- ...

