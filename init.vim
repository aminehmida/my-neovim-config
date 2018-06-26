call plug#begin('~/.local/share/nvim/plugged')

Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'airblade/vim-gitgutter'
Plug 'scrooloose/nerdcommenter'
Plug 'kshenoy/vim-signature'
Plug 'ntpeters/vim-better-whitespace'

call plug#end()

" YouCompleteMe and UltiSnips compatibility, with the helper of supertab
" (via http://stackoverflow.com/a/22253548/1626737)
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SuperTabCrMapping                = 0
let g:UltiSnipsExpandTrigger           = '<tab>'
let g:UltiSnipsJumpForwardTrigger      = '<tab>'
let g:UltiSnipsJumpBackwardTrigger     = '<s-tab>'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

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

" Map CTRL+v to vsplit and <leader>+CTRL+v to split
:nnoremap <c-v> :vsplit 
:nnoremap <leader><c-v> :split 

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
