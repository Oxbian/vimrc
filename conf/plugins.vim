""""""""""""""""""""""""""
"         Plugins
""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.config/vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.config/vim/plugged')

" UI & Themes
Plug 'joshdick/onedark.vim' " Onedark themes for vim
Plug 'liuchengxu/vim-which-key' " Show leader mapping cheatsheet

" Git integration
Plug 'airblade/vim-gitgutter' " Git diff

" Autocompletion, linter, syntax
Plug 'dense-analysis/ale'

" Tools
Plug 'ap/vim-css-color' " rgb, hex color preview

call plug#end()

filetype plugin indent on " Allow filetype detection, plugins, indentation

"""""""""""""""""""""""""
"	Configuration
"""""""""""""""""""""""""
" LSP
let g:ale_python_auto_virtualenv = 1
let g:ale_completion_enabled = 1
let g:ale_floating_preview = 1 " Show hover doc & detail in a popup
let g:ale_fix_on_save = 1

" Stop linting when writing
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 0
let g:ale_hover_cursor = 1
let g:ale_set_balloons = 1 " Show error when mouse over it

" Linters and fixers (don't forget to setup LSP as linters)
let g:ale_linters = {
\   'python': ['pylsp', 'flake8', 'pylint', 'mypy']
\}

let g:ale_fixers = {
\   'python': ['black', 'isort', 'autopep8']
\}

" Netrw (filetree built-in vim)
let g:netrw_keepdir = 0 " Reload buffer usefull when moving or removing file
let g:netrw_winsize = 10 " Size of filetree buffer
let g:netrw_banner = 0 " Removing netrw banner
let g:netrw_localcopydircmd = 'cp -r' " Changing copy command to add recursive copy

" Statusline
let g:currentmode={
	\ 'n'  : 'NORMAL ',
	\ 'v'  : 'VISUAL ',
	\ 'V'  : 'V·Line ',
	\ "\<C-V>" : 'V·Block ',
	\ 'i'  : 'INSERT ',
	\ 'R'  : 'R ',
	\ 'Rv' : 'V·Replace ',
	\ 'c'  : 'Command ',
	\}

" Getting numbers of errors in ALE
function! LinterStatus() abort
    let l:counts = ale#statusline#Count(bufnr(''))

    let l:all_errors = l:counts.error + l:counts.style_error
    let l:all_non_errors = l:counts.total - l:all_errors

    return l:counts.total == 0 ? 'OK' : printf(
    \   '%dW %dE',
    \   all_non_errors,
    \   all_errors
    \)

endfunction
set laststatus=2
set statusline=
" VIM Mode
set statusline+=\ %{toupper(g:currentmode[mode()])}%{&spell?'[SPELL]':''}\|
" File (path, modified, readonly ? )
set statusline+=%h\ %F
set statusline+=%{&modified?'\ [+]':''}
set statusline+=%{&readonly?'\ ':''}
" Filetype
set statusline+=%=%y
set statusline+=\ \|\ %{&fileencoding?&fileencoding:&encoding}
set statusline+=\ \|\ [%{&fileformat}\]
set statusline+=\ \|\ %{LinterStatus()}
" Line count and percentage
set statusline+=\ \|\ %l:%c
set statusline+=\ [%p%%]\ 


" Which Key
call which_key#register('<Space>', "g:which_key_map")
let g:which_key_map =  {}

" Buffer key help
let g:which_key_map.b = { 
    \ 'name' : '+buffer',
    \ 'd' : 'current buffer close',
    \ 'a' : 'close all buffers',
    \ 'n' : 'go to next buffer',
    \ 'p' : 'go to previous buffer', 
    \ }

" Tab key help
let g:which_key_map.t = { 
    \ 'name' : '+tab',
    \ 't<leader>' : 'go to next tab',
    \ 'n' : 'open new tab',
    \ 'o' : 'close other tabs',
    \ 'c' : 'close current tab',
    \ 'm' : 'move tab after another',
    \ 'l' : 'switch between this & last tab',
    \ 'e' : 'open new tab with current buffer',
    \ }

" Spell key help
let g:which_key_map.s = { 
    \ 'name' : '+spell',
    \ 's' : 'toggle spell check',
    \ 'n' : 'next spell word',
    \ 'p' : 'previous spell word',
    \ 'a' : 'add word in dict',
    \ '?' : 'list word alternatives',
    \ }

" Hunk key help
let g:which_key_map.h = { 
    \ 'name' : '+git hunk',
    \ 'l' : 'remove highlight',
    \ 'p' : 'go previous hunk',
    \ 'n' : 'go next hunk',
    \ 't' : 'enable/disable gitgutter',
    \ 's' : 'stage hunk',
    \ 'u' : 'undo hunk',
    \ 'P' : 'preview hunk',
    \ }

" LSP key help
" Activer WhichKey pour ALE
let g:which_key_map.g = { 
    \ 'name' : '+LSP',
    \ 'd' : [':ALEGoToDefinition', 'go to definition'],
    \ 'n' : [':ALENext', 'next diagnostic'],
    \ 'p' : [':ALEPrevious', 'previous diagnostic'],
    \ 'r' : [':ALEFindReferences', 'go to reference'],
    \ 'R' : [':ALERename', 'rename object'],
    \ 'y' : [':ALEType', 'type definition'],
    \ 'i' : [':ALEGoToImplementation', 'go to implementation'],
    \ 'h' : [':ALEHover', 'documentation'],
    \ 'f' : [':ALEFix', 'format document'],
    \ }
