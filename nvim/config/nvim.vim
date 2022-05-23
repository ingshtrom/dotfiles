let g:python3_host_prog="/opt/homebrew/bin/python3"

let g:polyglot_disabled = ['csv']

" Wrap gitcommit file types at the appropriate length
filetype indent plugin on

if exists('+termguicolors')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

noremap ; :
inoremap jk <ESC>

if has("clipboard")
  set clipboard=unnamed " copy to the system clipboard
  if has("unnamedplus") " X11 support
    set clipboard+=unnamedplus
  endif
endif

" this will force the cursor to a new line when it reaches the textwidth
" parameter
"au BufRead,BufNewFile *.markdown,*.md set textwidth=100 fo+=t fo-=l
au BufRead,BufNewFile *.applescript setfiletype javascript
au BufRead,BufNewFile Brewfile setfiletype python
autocmd FileType python set shiftwidth=4 tabstop=4
autocmd FileType lua set shiftwidth=4 tabstop=4
autocmd FileType sh set shiftwidth=2 tabstop=2
autocmd FileType markdown,md set wrap
au VimLeave,VimSuspend * set guicursor=a:ver25

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
      \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
      \ quit | endif

set viminfo='100,<50,s10,h,f1 " do not lose information when restarting vim
set number
set modeline
set modelines=10
set ttyfast
set noshowmode
set encoding=utf-8
set history=700
set autoread
set so=7
set ruler
set cmdheight=2
set backspace=eol,start,indent
set ignorecase
set smartcase
set hlsearch
set incsearch
set showmatch
set mat=2
set noerrorbells
set novisualbell
set t_vb=
set t_Co=256 " recommended for onehalflight theme => https://github.com/sonph/onehalf/tree/master/vim
set belloff=all
set tm=500
syntax on
set nobackup
set nowritebackup
set noswapfile
set expandtab
set smarttab
set softtabstop=2
set shiftwidth=2
set tabstop=2
set hidden
set ai "Auto indent"
set si "Smart indent"
set mouse=a
"set shell=/usr/bin/zsh " linux
set shell=/opt/homebrew/bin/zsh " osx
set spelllang=en
set laststatus=2
set listchars=tab:»\ ,trail:¬,extends:>,precedes:<,space:·
set list
set cursorline
set nocompatible
set nowrap "wrap lines disabled
set wildignore+=node_modules/**
set wildignore+=.terraform/**
let mapleader=" "
set statusline+=%F
set shortmess+=c
set updatetime=300
set showtabline=2

let $FZF_DEFAULT_OPTS = '--bind ctrl-q:select-all+accept'

"let g:WMGraphviz_output = "svg"

"""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
"""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" Syntax for BATS (Bash Automated Testing System)
Plug 'aliou/bats.vim'
" fzf for fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
" better commenting
Plug 'scrooloose/nerdcommenter'
" Tree viewer
Plug 'scrooloose/nerdtree'

" status line in lua
Plug 'hoob3rt/lualine.nvim'

" show buffers like tabs
Plug 'akinsho/nvim-bufferline.lua'
" lots of languages
Plug 'sheerun/vim-polyglot'
" Jinja support
Plug 'lepture/vim-jinja'

" Cool icons for file types in the NERDTree
Plug 'kyazdani42/nvim-web-devicons'

" better yaml parsing for large files
Plug 'stephpy/vim-yaml'
" SaltStack syntax
Plug 'saltstack/salt-vim'
" graphviz help :)
"Plug 'wannesm/wmgraphviz.vim'
" OPA integration
Plug 'tsandall/vim-rego'

" autocomplete
Plug 'hrsh7th/nvim-compe'

" neovim 0.5.5-beta has LSP client built in now
Plug 'neovim/nvim-lspconfig'
Plug 'folke/trouble.nvim'

" open code on github easier
Plug 'tonchis/vim-to-github'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" telescope and dependencies
Plug 'tami5/sqlite.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
"Plug 'nvim-telescope/telescope-frecency.nvim'

" treesitter is awesome
Plug 'nvim-treesitter/nvim-treesitter'

" DARK_THEME
"Plug 'dracula/vim',{'as':'dracula'}
" LIGHT_THEME
Plug 'sonph/onehalf', {'rtp': 'vim/'}

" cool, but messing with my tabs and causing more headache since it cannot be
" configured
" as of 5/23/22 it started error'ing b/c the API returned text/html instead of
" application/json content-type 🤷 => turns out there was a rogue install of
" copilot which didn't get updated ever
Plug 'github/copilot.vim'

call plug#end()

" DARK_THEME
"colorscheme dracula
" LIGHT_THEME
colorscheme onehalflight

let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'haproxy': { 'left': '#' } }

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.90 } }

" NOTE: refence => https://medium.com/@crashybang/supercharge-vim-with-fzf-and-ripgrep-d4661fc853d2
" --column: Show column number
" --line-number: Show line number
" --no-heading: Do not show file headings in results
" --fixed-strings: Search term as a literal string
" --ignore-case: Case insensitive search
" --no-ignore: Do not respect .gitignore, etc...
" --hidden: Search hidden files and folders
" --follow: Follow symlinks
" --glob: Additional conditions for search (in this case ignore everything in the .git/ folder)
" --color: Search color options
command! -bang -nargs=* Find call fzf#vim#grep("rg --column --line-number --no-heading --fixed-strings --ignore-case --no-ignore --hidden --follow --glob '!.git/*' --glob '!**/.terraform/*' --glob '!node_modules/*' --glob '!vendor/*' --color 'always' ".shellescape(<q-args>), 1, <bang>0)

" fuzzy find files
noremap <Leader>O :Files<CR>
noremap <Leader>o <cmd>Telescope find_files find_command=fd,-E,.git,-E,.terraform,-I,-H,-t,f prompt_prefix=🔍<cr>
" fuzzy find string in files
noremap <Leader>P :Find<space>
noremap <Leader>p <cmd>Telescope live_grep prompt_prefix=🔍<cr>
" toggle NERDTree
noremap <Leader>h <cmd>lua require 'telescope'.extensions.file_browser.file_browser()<CR>
"noremap <Leader>o <cmd>lua require 'telescope'.extensions.frecency.frecency()<CR>
noremap <C-h> :NERDTreeToggle<CR>
noremap <Leader>nr :NERDTreeRefreshRoot<CR>
noremap <Leader>f :NERDTreeFind<CR>
noremap :bw :bd<CR>
noremap <Leader>b :Buffers<CR>

"noremap :cc :cexpr[]

" remove trailing whitespace
" while keeping cursor position
nnoremap <Leader>t :let _save_pos=getpos(".") <Bar>
      \ :let _s=@/ <Bar>
      \ :%s/\s\+$//e <Bar>
      \ :let @/=_s <Bar>
      \ :nohl <Bar>
      \ :unlet _s<Bar>
      \ :call setpos('.', _save_pos)<Bar>
      \ :unlet _save_pos<CR><CR>

nmap <silent> gh :ToGithub docker<CR>
nmap <silent> gb :Git blame<CR>

let NERDTreeShowHidden=1
let g:NERDTreeWinSize=60

nnoremap <Backspace> <C-^>
nnoremap <C-b> <C-u>

" more nvim-compe config in vscript
highlight link CompeDocumentation NormalFloat
inoremap <silent><expr> <C-c> compe#complete()
inoremap <silent><expr> <CR>  compe#confirm('<CR>')
inoremap <silent><expr> <C-e> compe#close('<C-e>')
inoremap <silent><expr> <C-f> compe#scroll({ 'delta': -4 })
inoremap <silent><expr> <C-d> compe#scroll({ 'delta': +4 })

nnoremap <silent> <leader>u :Telescope lsp_workspace_symbols query=
nnoremap <silent> <leader>i :Telescope treesitter<CR>
nnoremap <silent> <leader>d :Telescope diagnostics bufnr=0<CR>

autocmd FileType go nnoremap <silent> <leader>d :Telescope diagnostics<CR>

lua << EOF
-- telescope remappings
local actions = require('telescope.actions')
local telescope = require('telescope')
telescope.setup{
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    },
  },
  defaults = {
    file_previewer = require'telescope.previewers'.vim_buffer_cat.new,
    grep_previewer = require'telescope.previewers'.vim_buffer_vimgrep.new,
    qflist_previewer = require'telescope.previewers'.vim_buffer_qflist.new,
    color_devicons = true,
    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<C-k>"] = actions.move_selection_previous,
        ["<esc>"] = actions.close,
      },
      n = {
        ["<esc>"] = actions.close,
      },
    },
  }
}
telescope.load_extension("file_browser")
telescope.load_extension("fzf")

-- nvim-compe setup
vim.o.completeopt = "menuone,noselect"
require'compe'.setup {
enabled = true;
autocomplete = true;
debug = false;
min_length = 1;
preselect = 'enable';
throttle_time = 80;
source_timeout = 200;
incomplete_delay = 400;
max_abbr_width = 100;
max_kind_width = 100;
max_menu_width = 100;
documentation = true;

source = {
  path = true;
  buffer = true;
  calc = true;
  nvim_lsp = true;
  nvim_lua = true;
  vsnip = false;
  ultisnips = false;
  };
}


-- LSP config
local nvim_lsp = require('lspconfig')

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

--Enable completion triggered by <c-x><c-o>
buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

-- Mappings.
local opts = { noremap=true, silent=true }

-- See `:help vim.lsp.*` for documentation on any of the below functions
buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
buf_set_keymap('n', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
buf_set_keymap('n', '<leader>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
buf_set_keymap('n', '[d', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
buf_set_keymap('n', ']d', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
buf_set_keymap("n", "<space>F", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = { "gopls", "terraformls", "tsserver", "vimls", "yamlls", "pylsp" }
for _, lsp in ipairs(servers) do
  nvim_lsp[lsp].setup { on_attach = on_attach }
end

nvim_lsp.bashls.setup {
  on_attach = on_attach,
  filetypes = { "sh", "zsh" }
  }
nvim_lsp.jsonls.setup {
  on_attach = on_attach,
  commands = {
    Format = {
      function()
        vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
      end
      }
    }
  }
nvim_lsp.clangd.setup{
  on_attach = on_attach;
  cmd = { '/usr/local/opt/llvm/bin/clangd', '--background-index' };
}

nvim_lsp.dockerls.setup{}

require('nvim-treesitter.configs').setup({
  ensure_installed = "all",
  highlight = {
    enable = true,
  },
  incremental_selection = {
    enable = true
  },
  indent = {
  enable = true
  },
})

require'lualine'.setup{
options = {
  -- DARK_THEME
  -- theme = 'dracula',
  -- LIGHT_THEME
  theme = 'onelight',
  extensions = {'fugitive','nerdtree'}
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {
      'branch',
      {
          'diagnostics',
          sources = {'nvim_diagnostic'},
          sections = {'error', 'warn', 'info', 'hint'},
          symbols = {error = '', warn = '', info = '', hint = 'H '},
      },
    },
    lualine_c = {
      {'filename', path=1},
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {'filename'},
    lualine_x = {'location'},
    lualine_y = {},
    lualine_z = {}
    },
  }

require("bufferline").setup{}
EOF

