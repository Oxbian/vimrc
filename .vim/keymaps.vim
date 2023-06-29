"""""""""""""""""""""""""""""
"	Keymaps
"""""""""""""""""""""""""""""

""""""""""""""""""""
" Window movement
""""""""""""""""""""

" Go to the bottom window
noremap <C-j> <C-w>j

" Go to the top window
noremap <C-k> <C-w>k

" Go to the right window
noremap <C-l> <C-w>l

" Go to the left window
noremap <C-h> <C-w>h

""""""""""""""""""""""""
" Remove highlighting
""""""""""""""""""""""""

nnoremap <leader>hl :nohlsearch<CR>

" Save file
nnoremap <C-s> :w!<CR>

""""""""""""""""""""""""""
" Buffer
"""""""""""""""""""""""""

" Close the current buffer
map <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
map <leader>ba :bufdo bd<cr>

" Go to the next buffer
map <leader>l :bnext<cr>

" Go to the previous buffer
map <leader>h :bprevious<cr>

""""""""""""""""""""""""""""
" Tabs
"""""""""""""""""""""""""""

" Open a new tab
map <leader>tn :tabnew<cr>

" Close all others tab
map <leader>to :tabonly<cr>

" Close current tab page
map <leader>tc :tabclose<cr>

" Move tabs after another
map <leader>tm :tabmove

" Go to the next tab
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

""""""""""""""""""""""""
" NerdTree
"""""""""""""""""""""""

" Toggle nerdtree
nnoremap <C-f> :NERDTreeToggle<CR>

""""""""""""""""""""
" GitGutter
""""""""""""""""""""
let g:gitgutter_enabled=1 " Enable by default gitgutter

" Enable / Disable GitGutter
nnoremap <leader>d :GitGutterToggle<CR>

" Stage Hunk in Git
nnoremap <leader>hs :GitGutterStageHunk<CR>

" Undo Hunk
nnoremap <leader>hu :GitGutterUndoHunk<CR>

" Preview Hunk
nnoremap <leader>hp :GitGutterPreviewHunk<CR>

" Always show the status line
set laststatus=2

"""""""""""""""""""""
" Spell
"""""""""""""""""""""

" Toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

" Next word to spellcheck
map <leader>sn ]s

" Previous word to spellcheck
map <leader>sp [s

" Add word into the spellcheck dictionnary
map <leader>sa zg

" show the list of alternatives for the word
map <leader>s? z=

"""""""""""""""""""
" LSP
"""""""""""""""""""
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
