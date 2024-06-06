"""""""""""""""""""""""""""""
"	Keymaps
"""""""""""""""""""""""""""""

let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Treat long paragraph as a line
map j gj
map k gk

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
noremap <leader>bd :Bclose<cr>:tabclose<cr>gT

" Close all the buffers
noremap <leader>ba :bufdo bd<cr>

" Go to the next buffer
noremap <leader>bn :bnext<cr>

" Go to the previous buffer
noremap <leader>bp :bprevious<cr>

""""""""""""""""""""""""""""
" Tabs
"""""""""""""""""""""""""""

" Open a new tab
noremap <leader>tn :tabnew<cr>

" Close all others tab
noremap <leader>to :tabonly<cr>

" Close current tab page
noremap <leader>tc :tabclose<cr>

" Move tabs after another
noremap <leader>tm :tabmove

" Go to the next tab
noremap <leader>t<leader> :tabnext<cr>

" Let 'tl' toggle between this and the last accessed tab
let g:lasttab = 1
nnoremap <leader>tl :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

" Opens a new tab with the current buffer's path
" Super useful when editing files in the same directory
noremap <leader>te :tabedit <C-r>=escape(expand("%:p:h"), " ")<cr>/

" Switch CWD to the directory of the open buffer
noremap <leader>cd :cd %:p:h<cr>:pwd<cr>

" Specify the behavior when switching between buffers
try
  set switchbuf=useopen,usetab,newtab
  set stal=2
catch
endtry

" Return to last edit position when opening files (You want this!)
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

""""""""""""""""""""""""
" Netrw
"""""""""""""""""""""""

" Toggle tree view
nnoremap <C-f> :Lexplore<CR>

""""""""""""""""""""
" GitGutter
""""""""""""""""""""

let g:gitgutter_enabled=1 " Enable by default gitgutter

" Go to the previous hunk
nnoremap <leader>hp <Plug>(GitGutterPrevHunk)

" Go to the next hunk
nnoremap <leader>hn <Plug>(GitGutterNextHunk)

" Enable / Disable GitGutter
nnoremap <leader>ht <Plug>(GitGutterToggle)

" Stage Hunk in Git
nnoremap <leader>hs <Plug>(GitGutterStageHunk)

" Undo Hunk
nnoremap <leader>hu <Plug>(GitGutterUndoHunk)

" Preview Hunk
nnoremap <leader>hP :GitGutterPreviewHunk<CR>

" Always show the status line
set laststatus=2

"""""""""""""""""""""
" Spell
"""""""""""""""""""""

" Toggle and untoggle spell checking
noremap <leader>ss :setlocal spell!<cr>

" Next word to spellcheck
noremap <leader>sn ]s

" Previous word to spellcheck
noremap <leader>sp [s

" Add word into the spellcheck dictionary
noremap <leader>sa zg

" show the list of alternatives for the word
noremap <leader>s? z=

"""""""""""""""""""
" LSP
"""""""""""""""""""
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : 
                                           \"\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
let g:coc_snippet_next = '<tab>'

nmap <silent> gp <Plug>(coc-diagnostic-prev)
nmap <silent> gn <Plug>(coc-diagnostic-next)

" GoTo code navigation
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> gh :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming
nmap <leader>gR <Plug>(coc-rename)

" Formatting selected code
xmap <leader>gf  <Plug>(coc-format-selected)
nmap <leader>gf  <Plug>(coc-format-selected)
