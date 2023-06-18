"""""""""""""""""""""""""""""
"	Keymaps
"""""""""""""""""""""""""""""

" Window movement
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

" Remove highlighting
nnoremap <leader>h :nohlsearch<CR> 

" Save file
nnoremap <C-s> :w!<CR>

" NerdTree
nnoremap <C-f> :NERDTreeToggle<CR>

" GitGutter
let g:gitgutter_enabled=1 " Enable by default gitgutter
nnoremap <leader>d :GitGutterToggle<CR> 
nnoremap <leader>hs :GitGutterStageHunk<CR>
nnoremap <leader>hu :GitGutterUndoHunk<CR>
nnoremap <leader>hp :GitGutterPreviewHunk<CR>


