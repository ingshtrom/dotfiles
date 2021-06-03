let g:python_host_prog="/usr/local/bin/python2"
let g:python3_host_prog="/usr/local/bin/python3"

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

"au BufRead,BufNewFile *.markdown,*.md set textwidth=80 fo+=t fo-=l
au BufRead,BufNewFile *.applescript setfiletype javascript
au BufRead,BufNewFile Brewfile setfiletype python
autocmd FileType python set shiftwidth=4 tabstop=4
autocmd FileType lua set shiftwidth=4 tabstop=4
autocmd FileType sh set shiftwidth=2 tabstop=2
autocmd FileType markdown,md set wrap
"autocmd User CocStatusChange,CocDiagnosticChange call lightline#update() " force lightline update on CoC changes
"autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
au VimLeave,VimSuspend * set guicursor=a:ver25

" If another buffer tries to replace NERDTree, put it in the other window, and bring back NERDTree.
autocmd BufEnter * if bufname('#') =~ 'NERD_tree_\d\+' && bufname('%') !~ 'NERD_tree_\d\+' && winnr('$') > 1 |
    \ let buf=bufnr() | buffer# | execute "normal! \<C-W>w" | execute 'buffer'.buf | endif

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
set shiftwidth=2
set tabstop=2
set hidden
set ai "Auto indent"
set si "Smart indent"
set mouse=a
"set shell=/usr/bin/zsh " linux
set shell=/usr/local/bin/zsh " osx
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

"let g:WMGraphviz_output = "svg"

"""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
"""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" fzf for fuzzy finding
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': { -> fzf#install() } }
"Plug 'junegunn/fzf.vim'
" global search and replace
"Plug 'yegappan/greplace'
" better commenting
Plug 'scrooloose/nerdcommenter'
" Tree viewer
Plug 'scrooloose/nerdtree'
" git status in your Tree viewer
"Plug 'Xuyuanp/nerdtree-git-plugin'
" status line at the bottom
Plug 'itchyny/lightline.vim'
" show buffers like tabs
Plug 'bling/vim-bufferline'
" linting and fixing stuff
"Plug 'dense-analysis/ale'
" lots of languages
Plug 'sheerun/vim-polyglot'
" Jinja support
Plug 'lepture/vim-jinja'
" Cool icons (once I patch my font) for file types in the NERDTree
Plug 'kyazdani42/nvim-web-devicons'
" better yaml parsing for large files
Plug 'stephpy/vim-yaml'
" SaltStack syntax
Plug 'saltstack/salt-vim'
" graphviz help :)
"Plug 'wannesm/wmgraphviz.vim'
" OPA integration
Plug 'tsandall/vim-rego'

" awesome autocompletion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
"
" coc.nvim for LSP client support
" Use release branch (recommend)
"Plug 'neoclide/coc.nvim', {'branch': 'release'}

" autocomplete
Plug 'hrsh7th/nvim-compe'

" neovim 0.5.5-beta has LSP client built in now
Plug 'neovim/nvim-lspconfig'

" open code on github easier
Plug 'tonchis/vim-to-github'

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" telescope and dependencies
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" colorscheme
Plug 'mhartington/oceanic-next'

call plug#end()

let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'haproxy': { 'left': '#' } }

" enable deoplete
let g:deoplete#enable_at_startup = 1

""" Lightline Configuration
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode' ],
  \             [ 'readonly', 'expandedfilename', 'modified' ] ]
  \ },
  \ 'tabline': {
  \   'left': [ ['bufferline'] ]
  \ },
  \ 'component_expand': {
  \   'bufferline': 'LightlineBufferline',
  \ },
  \ 'component_type': {
  \   'bufferline': 'tabsel',
  \ },
  \ 'component_function': {
  \   'expandedfilename': 'ExpandedFilename'
  \ },
  \ }

function! ExpandedFilename()
  return expand('%')
endfunction

function! LightlineBufferline()
  call bufferline#refresh_status()
  return [ g:bufferline_status_info.before, g:bufferline_status_info.current, g:bufferline_status_info.after]
endfunction

set showtabline=2

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
"noremap <Leader>o :Files<CR>
noremap <Leader>o <cmd>Telescope find_files find_command=fd,-E,.git,-H prompt_prefix=🔍<cr>
" fuzzy find string in files
"noremap <Leader>p :Find<space>
noremap <Leader>p <cmd>Telescope live_grep<cr>
" search and mark all strings across all files
"noremap <Leader>s :Gsearch<space>
" replace all marked strings across all files
"noremap <Leader>r :Greplace<CR>
" toggle NERDTree
noremap <C-h> :NERDTreeToggle<CR>
noremap <Leader>nr :NERDTreeRefreshRoot<CR>
noremap <Leader>f :NERDTreeFind<CR>
noremap :bw :bd<CR>
" remove trailing whitespace
" while keeping cursor position
"nnoremap <silent> <F2> :let _s=@/ <Bar> :%s/\s\+$//e <Bar> :let @/=_s <Bar> :nohl <Bar> :unlet _s <CR>
nnoremap <Leader>t :let _save_pos=getpos(".") <Bar>
    \ :let _s=@/ <Bar>
    \ :%s/\s\+$//e <Bar>
    \ :let @/=_s <Bar>
    \ :nohl <Bar>
    \ :unlet _s<Bar>
    \ :call setpos('.', _save_pos)<Bar>
    \ :unlet _save_pos<CR><CR>

set background=dark
colorscheme OceanicNext

"inoremap <C-j> <C-n>
"nnoremap <C-j> <C-n>
"inoremap <C-k> <C-p>
"nnoremap <C-k> <C-p>

" Use <c-space> to trigger completion.
"inoremap <silent><expr> <c-space> coc#refresh()

" format buffer contents
"command! -nargs=0 Format :call CocAction('format')
"noremap <Leader>f :Format<CR>
"autocmd FileType terraform,tf noremap <Leader>f :!terraform fmt -write=true '%:p'<CR>

" rename symbol under cursor
"nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
"nnoremap <silent> K :call <SID>show_documentation()<CR>

"function! s:show_documentation()
"  if (index(['vim','help'], &filetype) >= 0)
"    execute 'h '.expand('<cword>')
"  else
"    call CocAction('doHover')
"  endif
"endfunction

" GoTo code navigation.
"nmap <silent> gd <Plug>(coc-definition)
"nmap <silent> gy <Plug>(coc-type-definition)
"nmap <silent> gi <Plug>(coc-implementation)
"nmap <silent> gr <Plug>(coc-references)
nmap <silent> gh :ToGithub docker<CR>
nmap <silent> gb :Git blame<CR>


" Mappings for CoCList
" Show all diagnostics.
"nnoremap <silent><nowait> <Leader>d  :<C-u>CocList diagnostics<cr>
"" Manage extensions.
"nnoremap <silent><nowait> <Leader>e  :<C-u>CocList extensions<cr>
"" Show commands.
"nnoremap <silent><nowait> <Leader>c  :<C-u>CocList commands<cr>
"" Find symbol of current document.
"nnoremap <silent><nowait> <Leader>i  :<C-u>CocList outline<cr>
"" Search workspace symbols.
"nnoremap <silent><nowait> <Leader>u  :<C-u>CocList -I symbols<cr>
"" Do default action for next item.
"nnoremap <silent><nowait> <Leader>nn  :<C-u>CocNext<CR>
"" Do default action for previous item.
"nnoremap <silent><nowait> <Leader>np  :<C-u>CocPrev<CR>
"" Resume latest coc list.
"nnoremap <silent><nowait> <Leader>nc  :<C-u>CocListResume<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
"xmap <leader>a  <Plug>(coc-codeaction-selected)
"nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
"nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
"nmap <leader>qf  <Plug>(coc-fix-current)

" Use <C-l> for trigger snippet expand.
"imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
"vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
"let g:coc_snippet_next = '<C-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
"let g:coc_snippet_prev = '<C-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
"imap <C-j> <Plug>(coc-snippets-expand-jump)

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


lua << EOF


-- telescope remappings
local actions = require('telescope.actions')
require('telescope').setup{
  defaults = {
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
local servers = { "gopls", "jsonls", "terraformls", "tsserver", "vimls", "yamlls" }
for _, lsp in ipairs(servers) do
nvim_lsp[lsp].setup { on_attach = on_attach }
end

-- require'lspconfig'.jsonls.setup {
--     commands = {
--       Format = {
--         function()
--           vim.lsp.buf.range_formatting({},{0,0},{vim.fn.line("$"),0})
--         end
--       }
--     }
-- }
EOF

