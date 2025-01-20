vim.o.termguicolors = true  -- カラースキームを正しく表示するために追加
vim.o.background = 'dark' -- 背景をダークに設定
vim.o.backspace = 'indent,eol,start' -- インデント、行末、行頭でバックスペースを有効化
vim.o.number = true -- 行番号を表示
vim.o.tabstop = 4 -- タブの幅を4に設定
vim.o.shiftwidth = 4 -- シフト幅を4に設定
vim.o.expandtab = true -- タブをスペースに変換
vim.o.clipboard = 'unnamedplus' -- クリップボードを有効化
vim.cmd('syntax enable') -- シンタックスハイライトを有効化

-- packer.nvim の初期設定
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'  -- Packerを自身で管理

  -- プラグインの定義
  use 'preservim/nerdtree'
  use 'Xuyuanp/nerdtree-git-plugin'
  use 'kyazdani42/nvim-web-devicons'  -- アイコン表示用
  use 'ryanoasis/vim-devicons'  -- NERDTreeでアイコンを表示
  use 'itchyny/lightline.vim'  -- lightlineのプラグイン
  use 'honza/vim-snippets'
  use {'junegunn/fzf', run = function() vim.fn['fzf#install']() end}
  use 'junegunn/fzf.vim'
  use 'airblade/vim-gitgutter'
  use 'frazrepo/vim-rainbow'
  use 'jiangmiao/auto-pairs'
  
  -- TokyoNightカラースキームを追加
  use 'folke/tokyonight.nvim'

  -- Treesitter: 高度なシンタックスハイライト
  use {
    'nvim-treesitter/nvim-treesitter',
    run = ':TSUpdate',
    config = function()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = "all",  -- 全ての言語に対応
        ignore_install = { "fortran" },  -- Fortranのインストールを無視
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = true, -- Vimのシンタックスハイライトも併用
        },
        indent = {
          enable = true,  -- 自動インデントのサポート
        },
        fold = {
          enable = true,  -- コードフォールディングのサポート
        }
      }
    end
  }

  -- coc.nvim: 補完機能とLSPサポート
  use {'neoclide/coc.nvim', branch = 'release'}

  -- eslintとprettierによるリントとフォーマット
  use 'MunifTanjim/eslint.nvim'
  use 'MunifTanjim/prettier.nvim'
   
  -- Indentラインを表示するプラグイン
  use {
    'lukas-reineke/indent-blankline.nvim',
    config = function()
      local ibl = require("ibl")

      -- ハイライトグループを定義
      vim.api.nvim_set_hl(0, "IndentLevel1", { fg = "#205d96", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel2", { fg = "#316aa1", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel3", { fg = "#447aad", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel4", { fg = "#5a8bb8", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel5", { fg = "#729bc4", nocombine = true })
      vim.api.nvim_set_hl(0, "IndentLevel6", { fg = "#8aaed0", nocombine = true })
      vim.api.nvim_set_hl(0, "IblScope",    { fg = "#89a7d0", nocombine = true }) 
      
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

  -- nvim-colorizer.lua: カラーコードの可視化
  use 'norcalli/nvim-colorizer.lua'
  require('colorizer').setup({
    'html',
    'css',
    'javascript',
  }, { 
    RGB = true, 
    RRGGBB = true,
    names = false, 
    RRGGBBAA = true, 
    rgb_fn = true, 
    hsl_fn = true, 
    css = true,
    css_fn = true, 
  })

  use {
        'goerz/jupytext.vim',
        config = function()
            vim.g.jupytext_fmt = 'py:percent'  -- Pythonファイルに変換する形式を設定
        end
    }
  
  -- Markdownプレビューのプラグイン
  use { 
    'iamcco/markdown-preview.nvim', 
    run = 'cd app && npm install',
    ft = { 'markdown' }
  }

  use 'neovim/nvim-lspconfig'

  use { "github/copilot.vim" }

  use 'wakatime/vim-wakatime' -- WakaTimeプラグイン
end)

-- TokyoNightカラースキームの設定
require('tokyonight').setup({
  style = "storm",
  transparent = true,
  styles = {
    comments = { italic = false },
    keywords = { italic = false },
    functions = {},
    variables = {},
    sidebars = "dark",
  },
  on_colors = function(colors)
    colors.hint = colors.orange
    colors.error = "#ff6666"
  end,
  on_highlights = function(hl, c)
    hl.TSTag = { fg = "#ff9e64", bold = true }
    hl.TSTagDelimiter = { fg = "#7aa2f7" }
    hl.TSAttribute = { fg = "#9ece6a", italic = true }
    hl.TSString = { fg = "#bb9af7" }
    hl.TSKeyword = { fg = "#f7768e", italic = true }
    hl.TSFunction = { fg = "#c0caf5" }
    hl.TSParameter = { fg = "#7dcfff" }
    hl.htmlTag = { fg = "#ff9e64", bold = true }
    hl.htmlEndTag = { fg = "#ff9e64", bold = true }
    hl.htmlTagName = { fg = "#7aa2f7" }
    hl.htmlArg = { fg = "#9ece6a", italic = true }
    hl.htmlString = { fg = "#bb9af7" }
    hl.htmlSpecialTagName = { fg = "#f7768e", italic = true }
    hl.Comment = { fg = "#5f5f87", italic = true }
  end,
})

vim.cmd('colorscheme tokyonight')

-- 背景を透明にする設定
vim.cmd [[
  augroup TransparentBG
    autocmd!
    autocmd VimEnter * hi Normal guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi NormalNC guibg=NONE ctermbg=NONE
    autocmd VimEnter * hi EndOfBuffer guibg=NONE ctermbg=NONE
  augroup END
]]

-- nvim-web-deviconsの設定
require('nvim-web-devicons').setup {
  default = true;
  -- 追加の設定が必要であればここに書きます
}


-- NERDTreeの設定
vim.api.nvim_set_keymap('n', '<C-n>', ':NERDTreeToggle<CR>', { noremap = true, silent = true })
vim.cmd([[
  autocmd VimEnter * NERDTree
  autocmd bufenter * if (winnr('$') == 1 && exists('t:NERDTreeBufName') && bufname(t:NERDTreeBufName) == bufname('%')) | quit | endif
]])
vim.g.NERDTreeShowIcons = 1  -- アイコンを表示
vim.g.NERDTreeShowHidden = 1
vim.g.webdevicons_enable = 1  -- webdeviconsを有効化
vim.g.DevIconsEnableFoldersOpenClose = 1  -- フォルダの開閉アイコンを有効化
-- vim-deviconsの設定
vim.g.WebDevIconsNerdTreeNodeDelimiter = ''  -- デリミタを空に設定
vim.g.WebDevIconsNerdTreeBeforeGlyphPadding = ''  -- アイコンの前のパディングを削除
vim.g.WebDevIconsNerdTreeAfterGlyphPadding = ' '  -- アイコンの後にスペースを追加



-- Fzfのショートカット設定
vim.api.nvim_set_keymap('n', '<C-p>', ':Files<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-f>', ':Rg<CR>', { noremap = true, silent = true })

-- PythonとC言語のインデント設定
vim.cmd([[
  autocmd FileType python setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
  autocmd FileType c setlocal expandtab shiftwidth=4 softtabstop=4 tabstop=4
]])

-- GitGutterの設定
vim.g.gitgutter_enabled = 1

-- Rainbow bracketsの設定
vim.g.rainbow_active = 1

-- Pythonファイルでスペルチェックを有効化
vim.cmd([[
  autocmd FileType python setlocal spell spelllang=en
]])

-- 検索ハイライト解除のショートカット
vim.g.mapleader = ','
vim.api.nvim_set_keymap('n', '<leader>/', ':nohlsearch<CR>', { noremap = true, silent = true })

-- coc.nvimの設定
vim.cmd('let g:coc_global_extensions = ["coc-tsserver", "coc-eslint", "coc-prettier", "coc-json", "coc-html", "coc-css"]')

-- coc.nvimの補完時のTabキーの動作
vim.api.nvim_set_keymap('i', '<Tab>', 'pumvisible() ? "\\<C-n>" : "\\<Tab>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<S-Tab>', 'pumvisible() ? "\\<C-p>" : "\\<S-Tab>"', {expr = true, noremap = true})
vim.api.nvim_set_keymap('i', '<CR>', 'pumvisible() ? coc#_select_confirm() : "\\<CR>"', {expr = true, noremap = true})

-- jj と kk を押すとインサートモードから抜けて保存
vim.keymap.set("i", "jj", "<esc>l<cmd>w<CR>")
vim.keymap.set("i", "kk", "<esc>l<cmd>w<CR>")

-- :terminal で、iモード（挿入モード）からノーマルモードに戻るための設定
vim.api.nvim_set_keymap('t', 'jj', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', 'kk', '<C-\\><C-n>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('t', '<Esc>', '<C-\\><C-n>', { noremap = true, silent = true })

-- フォーマットの設定を追加
require('prettier').setup({
  bin = 'prettier',
  filetypes = { "javascript", "typescript", "html", "css", "json", "markdown" }
})

-- 保存時に自動フォーマット
vim.cmd([[
  autocmd BufWritePre *.js,*.ts,*.jsx,*.tsx,*.json,*.html,*.css,*.md Prettier
  autocmd BufWritePre *.py lua vim.lsp.buf.format()
]])

-- coc.nvim のフォーマットショートカット
vim.api.nvim_set_keymap('n', '<leader>f', ':CocCommand prettier.formatFile<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>e', ':CocCommand eslint.executeAutofix<CR>', { noremap = true, silent = true })

vim.g.mkdp_preview_options = {
  mkit = {}, -- Markdown-itの設定
  katex = { -- KaTeXの設定
    macros = {
      ["\\RR"] = "\\mathbb{R}" -- マクロ定義例
    }
  },
  uml = {}, -- PlantUMLの設定
  maid = {}, -- Mermaidの設定
  disable_sync_scroll = 0, -- スクロール同期
  sync_scroll_type = 'middle',
  hide_yaml_meta = 1 -- YAMLメタデータを非表示にする
}

-- 水平分割でターミナルを開くショートカット
vim.api.nvim_set_keymap('n', '<Leader>th', ':split | terminal<CR>', { noremap = true, silent = true })

-- 垂直分割でターミナルを開くショートカット
vim.api.nvim_set_keymap('n', '<Leader>tv', ':vsplit | terminal<CR>', { noremap = true, silent = true })
