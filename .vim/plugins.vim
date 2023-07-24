""""""""""""""""""""""""""
"         Plugins
""""""""""""""""""""""""""
" Install vim-plug if not found
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif

call plug#begin('~/.vim/plugged')

" UI & Themes
Plug 'joshdick/onedark.vim' " Onedark themes for vim
Plug 'vim-airline/vim-airline' " Vim statusline
Plug 'lambdalisue/fern.vim' " Filetree in vim
Plug 'lambdalisue/fern-renderer-devicons.vim' " Icon in fern
Plug 'ryanoasis/vim-devicons' " Devicons
Plug 'lambdalisue/fern-mapping-git.vim' " Fern git mapping
Plug 'lambdalisue/fern-git-status.vim' " Fern git status
Plug 'liuchengxu/vim-which-key' " Show leader mapping cheatsheet

" Git integration
Plug 'airblade/vim-gitgutter' " Git diff

" Autocompletion, linter, syntax
Plug 'prabirshrestha/vim-lsp' " Linter & formatter
Plug 'mattn/vim-lsp-settings' " Automatic vim-lsp installation
Plug 'prabirshrestha/asyncomplete.vim' " Autocompletion
Plug 'prabirshrestha/asyncomplete-lsp.vim' " Autocompletion & connection with vim-lsp

" Tools
Plug 'wakatime/vim-wakatime' " Wakatime

" Language
Plug 'mattn/emmet-vim', { 'for': ['html', 'css', 'js', 'vue'] } 
call plug#end()

filetype plugin indent on " Allow filetype detection, plugins, indentation

"""""""""""""""""""""""""
"	Configuration
"""""""""""""""""""""""""
" VIM airline
let g:airline_theme='onedark' " Status line color & configuration

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_symbols.colnr = ' ㏇:'
let g:airline_symbols.crypt = '🔒'
let g:airline_symbols.linenr = ' ¶'
let g:airline_symbols.maxlinenr = ''
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.spell = 'Ꞩ'
let g:airline_symbols.notexists = 'Ɇ'
let g:airline_symbols.whitespace = ' Ξ'

" VIM lsp
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_diagnostics_virtual_text_enabled = 0

" Fern
" Disable netrw.
let g:loaded_netrw  = 1
let g:loaded_netrwPlugin = 1
let g:loaded_netrwSettings = 1
let g:loaded_netrwFileHandlers = 1

let g:fern#default_hidden = 1 " Show hidden files
let g:fern#renderer = 'devicons'
let g:fern_renderer_devicons_disable_warning = 1

" Multi window select in which you open the file
function! s:init_fern() abort
  " Use 'select' instead of 'edit' for default 'open' action
  nnoremap <buffer> <Plug>(fern-action-open) <Plug>(fern-action-open:select)

  nnoremap <buffer> a <Plug>(fern-action-new-path)
  nnoremap <buffer> d <Plug>(fern-action-remove)
  nnoremap < <buffer> m <Plug>(fern-action-move)
  nnoremap <buffer> r <Plug>(fern-action-rename)
  nnoremap <buffer> v <Plug>(fern-action-open:vsplit)
  nnoremap <buffer> ga <Plug>(fern-action-git-stage)
  nnoremap <buffer> gd <Plug>(fern-action-git-unstage)
endfunction

augroup my-fern-hijack
  autocmd!
  autocmd BufEnter * ++nested call s:hijack_directory()
augroup END

function! s:hijack_directory() abort
  let path = expand('%:p')
  if !isdirectory(path)
    return
  endif
  bwipeout %
  execute printf('Fern %s', fnameescape(path))
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END

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
let g:which_key_map.l = { 
    \ 'name' : '+LSP',
    \ 'd' : 'go to definition',
    \ 'nd' : 'next diagnostic',
    \ 'pd' : 'previous diagnostic',
    \ 'f' : 'go to reference',
    \ 'r' : 'rename object',
    \ 's' : 'stop LSP server',
    \ 'p' : 'peek definition',
    \ 'a' : 'code action',
    \ 'h' : 'hover information',
    \ 'df' : 'format document',
    \ }

" Emmet
let g:user_emmet_leader_key='é'

