autocmd VimEnter * source ~/.vimrc

" Don't try to be vi compatible
set nocompatible

" Helps force plugins to load correctly when it is turned back on below
filetype off

" TODO: Load plugins here (pathogen or vundle)
" Turn on syntax highlighting
syntax on

" For plugins to load correctly
filetype plugin indent on

" TODO: Pick a leader key
" let mapleader = ","
" Security
set modelines=0

" Show line numbers
set number

" Smart dir behaviour that keeps current folder in the file i'm editting
set autochdir

" Show file stats
set ruler

" Encoding
set encoding=utf-8

" Whitespace
set wrap
set textwidth=79
set formatoptions=tcqrn1
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab
set noshiftround
set autoindent
set smartindent

" Cursor motion
set scrolloff=3
set backspace=indent,eol,start
set matchpairs+=<:> " use % to jump between pairs
runtime! macros/matchit.vim

" Move up/down editor lines
nnoremap j gj
nnoremap k gk

" My remap
map :Wq :wq
map :WQ :wq
map :W  :w

" Allow hidden buffers
set hidden

" Rendering
set ttyfast

" Status bar
set laststatus=2

" Last line
set showmode
set showcmd

" highlight current line
set cursorline

" Searching
"nnoremap / /\v
"vnoremap / /\v

" Real time highlighting
set incsearch

" Case sensitive only with capital letters
set smartcase

" Show the matching {[()]}
set showmatch

" Paste with correct indentation
set pastetoggle=<F2>

"map <leader><space> :let @/=''<cr> " clear search

" Remap help key.
inoremap <F1> <ESC>:set invfullscreen<CR>a
nnoremap <F1> :set invfullscreen<CR>
vnoremap <F1> :set invfullscreen<CR>

" Highlight matching pairs of brackets. Use the '%' character to jump between them.
set matchpairs+=<:>

" Textmate holdouts
" Formatting
map <leader>q gqip

" Visualize tabs and newlines
set listchars=tab:▸\ ,eol:¬

" Uncomment this to enable by default:
" set list " To enable by default
" Or use your leader key + l to toggle on/off
map <leader>l :set list!<CR> " Toggle tabs and EOL

call plug#begin()
Plug 'preservim/nerdtree'
Plug 'jiangmiao/auto-pairs'
Plug 'sonph/onehalf', {'rtp': 'vim'}
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'junegunn/vim-easy-align'  "Alling
call plug#end()

" Start interactive EasyAlign in visual mode (e.g. vipga)
" Select in visual mode, :EasyAlign, = (if you want to align by =)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Enable enhanced C++ syntax highlighting
let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1

inoremap <c-b> <Esc>:NERDTreeToggle<cr>
nnoremap <c-b> <Esc>:NERDTreeToggle<cr>

execute pathogen#infect()

" Color scheme (terminal)
"set t_Co=256
set background=dark
"let g:solarized_termcolors=256
"let g:solarized_termtrans=1

" Enable automatic file type recognition for specific file extensions
au BufNewFile,BufRead *.h, *.hpp, *.c, *.cpp, *.cc set filetype=cpp

" Set normal commentary for cpp, c and java
autocmd FileType c,cpp,cs,java setlocal commentstring=//\ %s

" Display all matches when tab complete.
set wildmenu

" My abbreviations
iabbr cout std::cout << << std::endl;
iabbr canvas TCanvas *c = new TCanvas("c","c",0,0,500,450);

" Highlight comments differently
hi cInclude ctermfg=166
hi StorageClass ctermfg=166
hi Comment ctermfg=79
hi String  ctermfg=123
hi Keyword ctermfg=202
hi Statement ctermfg=202
hi Type    ctermfg=214
hi Number  ctermfg=184
high LineNr ctermfg=45
syntax match STLconstant /std/
highlight STLconstant ctermfg=208
hi PreCondit ctermfg=172


syn match cUserFunction "\<\h\w*\>\(\s\|\n\)*("me=e-1
hi def link cUserFunction Function
hi Function ctermfg=178

" Popup Menu: auto completion
hi Pmenu ctermbg=123
hi PmenuSel ctermbg=195
hi PmenuSbar ctermbg=green
hi PmenuThumb ctermbg=166

hi cOperator ctermfg=15
"syntax match STL /std::\w\+/
"hi STL ctermfg=172
"syntax match STL /std::\w\+/
hi cpp_function ctermfg=46
hi UserDefinedType ctermfg=34
hi Macro ctermfg=172

"
"
" Python
"
"

"python with virtualenv support
"py << EOF
"import os
"import sys
"if 'VIRTUAL_ENV' in os.environ:
 " project_base_dir = os.environ['VIRTUAL_ENV']
 " activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
 " execfile(activate_this, dict(__file__=activate_this))
"EOF

