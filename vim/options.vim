" Search options
set incsearch " Search for partial typed match
set ignorecase " Search not case sensitive
set smartcase " Search for pattern if contains uppercase
set hlsearch " Highlight all match search pattern

" Graphics options
syntax on " Show syntax color
set background=dark " Set vim style as dark
colorscheme onedark " Set colorscheme as onedark
set number " Show line number
set relativenumber " Show relative line number
set cursorline " Select the current line
set showmatch " Show matching brackets when overred
set laststatus=2 " Fix for tabline
set noshowmode " Disable the -- INSERTION -- default comment
set so=7 " Set 7 lines to the cursor - when moving vertically

" Mouse options
set mouse=a " Allow the mouse to do all the editing
set ruler " Show the cursor position on the tagline

" Indent options
set tabstop=4 " Size of a tab
set shiftwidth=4 " Number of space for each indent
set softtabstop=0 " Useless indent
set noexpandtab " Vim will automatically use tab
set smartindent " Do clever indenting
set copyindent " Copy indent style of the file
set preserveindent " Preserve indent style
" Automatic options
set autowrite " Automatically write the file on certain actions
set autoread " Automatically read extern changes on the file

" System
if has('unnamedplus') " ALlow OS & vim clipboard sync
	set clipboard=unnamedplus
endif
set undofile " Save undo history
set history =500 " Max line vim remember
set updatetime=500 " Delay before vim write swap file, lower better for gitgutter

" Autocomplete
set completeopt=menu,menuone,popup,noselect,noinsert " Show a pop up for command completion
set wildmenu " Turn on wildmenu

" Avoid garbled characters in Chinese language windows OS
let $LANG='en' " Setting lang as en
set langmenu=en " Setting menu lang as en
" This delete all the defined menu
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=.git\*,.hg\*,.svn\*
else
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
endif

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Don't redraw while executing macros (good performance config)
set lazyredraw

" How many tenths of a second to blink when matching brackets
set mat=2

" Set utf8 as standard encoding and en_US as the standard language
set encoding=utf8

" Use Unix as the standard file type
set ffs=unix,dos,mac

" Turn backup off, since most stuff is in SVN, git etc. anyway...
set nobackup
set noswapfile

" Timeout 
set timeoutlen=500
