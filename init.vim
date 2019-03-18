call plug#begin('~/.local/share/nvim/plugged')

Plug 'scrooloose/nerdtree'

Plug 'tyrannicaltoucan/vim-quantum'

Plug 'junegunn/goyo.vim'

Plug 'derekwyatt/vim-scala'

Plug 'prabirshrestha/async.vim'
Plug 'prabirshrestha/asyncomplete-lsp.vim'
Plug 'prabirshrestha/asyncomplete.vim'
Plug 'prabirshrestha/vim-lsp'
Plug 'ryanolsonx/vim-lsp-python'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'

Plug 'itchyny/vim-cursorword'

Plug 'hdima/python-syntax'

Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'kshenoy/vim-signature'
Plug 'ntpeters/vim-better-whitespace'
Plug 'majutsushi/tagbar'
Plug 'jiangmiao/auto-pairs'
" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'
Plug 'sonph/onehalf', {'rtp': 'vim/'}
call plug#end()

" Configuration for vim-scala
au BufRead,BufNewFile *.sbt set filetype=scala

" Configuration for vim-lsc
let g:lsc_enable_autocomplete = v:false
let g:lsc_server_commands = {
  \  'scala': {
  \    'command': 'metals-vim',
  \    'log_level': 'Log'
  \  },
  \  'python': ['pyls', '-v'],
  \}
let g:lsc_auto_map = {
  \  'GoToDefinition': 'gd',
  \}

if executable('go-langserver')
    au User lsp_setup call lsp#register_server({
        \ 'name': 'go-langserver',
        \ 'cmd': {server_info->['go-langserver', '-gocodecompletion']},
        \ 'whitelist': ['go'],
        \ })
endif

" Set theme:
set background=dark
set termguicolors
colorscheme quantum

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" set leader to ;
let mapleader=";"

" Use system clipboard
set clipboard=unnamedplus

" Set hybrid line numbers
set number relativenumber

" F2 to toggle line numbers
nnoremap <F2> :set number! relativenumber!<CR>
" <leader> + F2 to toggle relative line numbers
nnoremap <leader> <F2> :set relativenumber!<CR>

" Use ;; to exit insert mode
inoremap ;; <Esc>

" Highlight trailing white spaces
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/

" Highlight lines longer then 80 char.
highlight OverLength ctermbg=red ctermfg=white guibg=#592929
match OverLength /\%81v.\+/

" Show hidden chars:
setlocal list listchars=eol:¬,tab:├─,trail:~,extends:>,precedes:<,space:.

" Natural split opening
set splitbelow
set splitright

" Easier split navigations
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Change spell check style and enable spell check for some files
hi clear SpellBad
hi SpellBad cterm=underline
" autocmd BufRead,BufNewFile *.md setlocal spell
autocmd FileType latex,tex,md,markdown setlocal spell

" Toggle Tagbar with F8
nmap <F8> :TagbarToggle<CR>

" My custom color schema easy on the eyes
hi Comment ctermfg=Gray
hi Number ctermfg=Yellow
hi String ctermfg=Blue
hi NonText ctermfg=DarkGray

nmap <leader>sp :call <SID>SynStack()<CR>
function! <SID>SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

autocmd FileType markdown setlocal textwidth=79

set colorcolumn=80
autocmd FileType markdown setlocal textwidth=79
autocmd FileType rst setlocal textwidth=79
autocmd FileType scala set colorcolumn=101

" Enable mouse:
set mouse=a

" Switch system clipboard/internal clipboard
nnoremap <F11> :let &clipboard=(empty(&clipboard) ? 'unnamedplus' : '')<CR>:echo "clipboard set to '" . &clipboard . "'"<CR>

map <F10> :echo "hi<" . synIDattr(synID(line("."),col("."),1),"name") . '> trans<'
\ . synIDattr(synID(line("."),col("."),0),"name") . "> lo<"
\ . synIDattr(synIDtrans(synID(line("."),col("."),1)),"name") . ">"<CR>

" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR><Paste>

" Configure indent to use 4 spaces.
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" ctrl-p ripgrep working dir
nnoremap <C-p> :Rg<Cr>
map <C-n> :NERDTreeToggle<CR>
