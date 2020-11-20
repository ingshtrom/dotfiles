let g:python2_host_prog="$HOME/.dotfiles/python/pyenv/versions/neovim2/bin/python"
let g:python3_host_prog="$HOME/.dotfiles/python/pyenv/versions/neovim3/bin/python"

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

au BufRead,BufNewFile *.markdown,*.md set textwidth=80 fo+=t fo-=l
au BufRead,BufNewFile *.applescript setfiletype javascript
au BufRead,BufNewFile Brewfile setfiletype python
autocmd FileType python set shiftwidth=4 tabstop=4
autocmd FileType lua set shiftwidth=4 tabstop=4
autocmd FileType sh set shiftwidth=2 tabstop=2
autocmd User CocStatusChange,CocDiagnosticChange call lightline#update() " force lightline update on CoC changes
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')
au VimLeave,VimSuspend * set guicursor=a:ver25

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

" coc.nvim recommended setting :shrug:
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif


let g:WMGraphviz_output = "svg"

"""""""""""""""""""""""""""""""""""""""""""""
"" Plugins
"""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
" fzf for fuzzy finding
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" global search and replace
Plug 'yegappan/greplace'
" go stuff for go dev, I guess
"Plug 'fatih/vim-go'
" better commenting
Plug 'scrooloose/nerdcommenter'
" Tree viewer
Plug 'scrooloose/nerdtree'
" git status in your Tree viewer
Plug 'Xuyuanp/nerdtree-git-plugin'
" status line at the bottom
Plug 'itchyny/lightline.vim'
" show buffers like tabs
Plug 'bling/vim-bufferline'
" linting and fixing stuff
"Plug 'dense-analysis/ale'
" lots of languages
Plug 'sheerun/vim-polyglot'
" Jinja
Plug 'lepture/vim-jinja'
" Cool icons (once I patch my font) for file types in the NERDTree
Plug 'ryanoasis/vim-devicons'
" better yaml parsing for large files
Plug 'stephpy/vim-yaml'
" SaltStack syntax
Plug 'saltstack/salt-vim'
" HashiCorp Configuration Language (HCL)
Plug 'fatih/vim-hclfmt'
" graphviz help :)
Plug 'wannesm/wmgraphviz.vim'
" EditorConfig formatting
Plug 'editorconfig/editorconfig-vim'
" OPA integration
Plug 'tsandall/vim-rego'
" awesome autocompletion
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
" Use release branch (recommend)
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'hashivim/vim-terraform'

" Git in your gutter!
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'

" Snippets!
Plug 'SirVer/ultisnips'

" ColorSchemes
"Plug 'NLKNguyen/papercolor-theme'
"Plug 'connorholyday/vim-snazzy'
Plug 'challenger-deep-theme/vim', { 'as': 'challenger-deep' }
call plug#end()

let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' }, 'haproxy': { 'left': '#' } }

" enable deoplete
let g:deoplete#enable_at_startup = 1
" use ALE to provide suggestions as well!
" TODO: couldn't get to work
"call deoplete#custom#option('sources', {
"\ '_': ['ale'],
"\})

""" Lightline Configuration
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode' ],
  \             [ 'cocstatus', 'readonly', 'expandedfilename', 'modified' ] ]
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
  \   'expandedfilename': 'ExpandedFilename',
	\   'cocstatus': 'coc#status'
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

let g:terraform_align=1
let g:terraform_fmt_on_save=1

" Formatting settings
" -- use ALEFix for everything, except Terraform,
"   which we will use TerraformFmt for
"let g:ale_fix_on_save = 1
"let g:ale_fixers = {
"      \ '*': ['trim_whitespace'],
"      \ 'sh': ['shfmt', 'trim_whitespace'],
"      \ 'yaml': ['prettier', 'trim_whitespace'],
"      \ 'terraform': ['terraform', 'trim_whitespace'],
"      \ 'html': ['prettier', 'html-beautify', 'tidy'],
"      \ 'hcl': ['terraform', 'trim_whitespace'],
"      \ 'python': ['reorder-python-imports', 'autopep8'],
"      \ 'go': ['gofmt', 'goimports']
"      \ }
"noremap <Leader>f :ALEFix<CR>

let g:fzf_layout = { 'window': { 'width': 0.95, 'height': 0.90 } }

"command! FZFMru call fzf#run({
"\  'source':  v:oldfiles,
"\  'sink':    'e',
"\  'options': '--no-sort --exact'})

""nnoremap <c-p> :FZFMru<CR>
"nnoremap <leader>o :FZF --no-sort --exact<CR>
"nnoremap <leader>m :FZFMru<CR>

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
noremap <Leader>o :Files<CR>
" fuzzy find string in files
noremap <Leader>p :Find<space>
" search and mark all strings across all files
noremap <Leader>s :Gsearch<space>
" replace all marked strings across all files
noremap <Leader>r :Greplace<CR>
" toggle NERDTree
noremap <C-h> :NERDTreeToggle<CR>
noremap <Leader>nr :NERDTreeRefreshRoot<CR>
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
colorscheme challenger_deep
let g:lightline.colorscheme='challenger_deep'

" CoC Configuration
"
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-n>"
inoremap <C-j> <C-n>
inoremap <C-k> <C-p>

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" format buffer contents
command! -nargs=0 Format :call CocAction('format')
noremap <Leader>f :Format<CR>
autocmd FileType terraform,tf noremap <Leader>f :TerraformFmt<CR>

" rename symbol under cursor
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <Leader>d  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <Leader>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <Leader>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <Leader>i  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <Leader>u  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <Leader>nn  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <Leader>np  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <Leader>nc  :<C-u>CocListResume<CR>

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

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
