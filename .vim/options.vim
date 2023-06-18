" Mapping
let mapleader =" " " Set mapleader

" Search options
set incsearch " Search for partial typed match
set ignorecase " Search not case sensitive
set smartcase " Search for pattern if contains uppercase
set hlsearch " Highlight all match search pattern

" Graphics options
syntax on " Show syntax color
set background=dark
colorscheme onedark
set number " Show line number
set cursorline " Select the current line
set showmatch " Show matching brackets when overred
set laststatus =2 " Fix for tabline
set noshowmode " Disable the -- INSERTION -- default comment
set so =7 " Set 7 lines to the cursor - when moving vertically
set cmdheight=1 " Height of the command bar
set regexpengine=0 " Set regular expression engine automatically

" Mouse options
set mouse = "a" " Allow the mouse to do all the editing
set ruler " Show the cursor position on the tagline

" Indent options
set softtabstop =4 " Size of a tab
set shiftwidth =4 " Number of space for each indent
set noexpandtab " Vim will automatically use tab
set smarttab " Add tab smartly
set autoindent " Automatically set the indent of a new line
set smartindent " Do clever indenting

" Automatic options
set autowrite " Automatically write the file on certain actions
set autoread " Automatically read extern changes on the file

" System
if has('unnamedplus') " ALlow OS & vim clipboard sync
    set clipboard = "unnamedplus"
endif
set undofile " Save undo history
set history =500 " Max line vim remember
set updatetime=500 " Delay before vim write swap file, lower better for gitgutter

" Autocomplete
set completeopt = "menuone,noselect" " Show a pop up for command completion
set wildmenu " Turn on wildmenu

" Avoid garbled characters in Chinese language windows OS
let $LANG='en'
set langmenu=en
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

set hid " A buffer becomes hidden when it is abandoned

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" For regular expressions turn magic on
set magic

" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Properly disable sound on errors on MacVim
if has("gui_macvim")
    autocmd GUIEnter * set vb t_vb=
endif

" Add a bit extra margin to the left
set foldcolumn=1

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set nowb
set noswapfile

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

map <leader>l :bnext<cr>
map <leader>h :bprevious<cr>

" Useful mappings for managing tabs
map <leader>tn :tabnew<cr>
map <leader>to :tabonly<cr>
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove
map <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nmap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()


" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
map <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif


""""""""""""""""""""""""""""""
" => Status line
""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=2

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=

