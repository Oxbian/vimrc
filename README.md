# VIM

This repo contains my vim configuration, hope it will be useful for you.

## Installation

You will need `vim` and `git` to be able to use this configuration.

Normally if you run the `install.sh` script it will work, but if you have a problem, try to install vim plug and check if your problem is solved.

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Oh and remove neovim, it make some problems with vim.

## Plugins

This config has just the necessary plugins installed:

### Themes

- [OneDark](https://github.com/joshdick/onedark.vim) onedark theme.
- [Vim Airline](https://github.com/vim-airline/vim-airline) Vim statusline.

### Graphics utilities

- [Fern](https://github.com/lambdalisue/fern.vim) to have a file tree in vim.
- [Fern renderer devicons](https://github.com/lambdalisue/fern-renderer-devicons.vim) to have devicons in fern.
- [Fern git mapping](https://github.com/lambdalisue/fern-mapping-git.vim) to add git stage & unstage in fern.
- [Fern git status](https://github.com/lambdalisue/fern-git-status.vim.git) show file git status in fern.
- [Vim which key](https://github.com/liuchengxu/vim-which-key) show leader keybinds in a GUI.
- [Vim devicons](https://github.com/ryanoasis/vim-devicons) language icons for vim.
- [Vim gitgutter](https://github.com/airblade/vim-gitgutter) to see diff between files with git.

### LSP

- [Vim-lsp](https://github.com/prabirshrestha/vim-lsp) linter & formatter for language.
- [Vim-lsp settings](https://github.com/mattn/vim-lsp-settings) easily setup lsp servers for languages.
- [Asyncomplete](https://github.com/prabirshrestha/asyncomplete.vim) async autocompletion
- [Asyncomplete & lsp-vim](https://github.com/prabirshrestha/asyncomplete-lsp.vim) use vim-lsp as source for autocompletion lsp server.
- [Vim Wakatime](https://github.com/wakatime/vim-wakatime) to have wakatime time tracking in vim. 

### Languages utilities

- [Vim emmet](https://github.com/mattn/emmet-vim) html snippets & utilities to write html faster.


## Command & keybinds

### General

- `<leader>hl` remove highlighting

#### Window

- `Ctrl+h` move to the left window,
- `Ctrl+j` move to the bottom window,
- `Ctrl+k` move to the upper window,
- `Ctrl+l` move to the right window,

#### Buffer

- `<leader>bd` close the current buffer,
- `<leader>ba` close all the buffers,
- `<leader>bn` go to the next buffer,
- `<leader>bp` go to the precedent buffer,

#### Tabs

- `<leader>tn` open a new tab,
- `<leader>to` close all other tabs,
- `<leader>tc` close current tab page,
- `<leader>tm` move the tab after another,
- `<leader>t<leader>` go to the next tab,
- `<leader>tl` toggle between this tab and the last accessed tab,
- `<leader>te` open a new tab with the current buffer,

#### Spell check

- `<leader>ss` toggle / untoggle spellchecking,
- `<leader>sn` go to the next word to spellcheck,
- `<leader>sp` go to the previous word to spellcheck,
- `<leader>sa` add a word into the dictionary,
- `<leader>s?` show the list of alternatives for the word,

More help at `:help spell`

### Fern

For help, use `:help fern`.
Keybinds:
- `Ctrl+f` open the treeview in the current window,
- `ga` stage a file from git,  
- `gd` unstage a file from git,
- `cp` copy node name (file, folder..),
- `cP` copy node path,
- `a` create a file or folder,  
- `d` delete a file or folder,
- `r` rename a file or folder,
- `m` move a file or folder.  

### Vim Gutter

For help, use `:help gitgutter`.  
Keybinds:
- `<leader>hp` go to the previous hunk,
- `<leader>hn` go to the next hunk,
- `<leader>hP` to preview hunk,
- `<leader>hs` to stage hunk,
- `<leader>hu` to undo hunk,
- `<leader>ht` to toggle GitGutter.

Hunks are the difference between your file and the git file.

### LSP

For help, use `:help vim-lsp`.  
Keybinds:
- `<leader>ld` go to the definition,
- `<leader>lnd` go to the next diagnostic,
- `<leader>lpd` go to the previous diagnostic,
- `<leader>lf` go to the reference,
- `<leader>lr` rename element,
- `<leader>ls` stop lsp server,
- `<leader>lp` peek a view to the definition,
- `<leader>la` code action,
- `<leader>lh` lsp hover,
- `<leader>ldf` format document.

### Emmet

For help, use `:help emmet`.  
Keybinds:  
- `<Alt-e>,` to create tags from an expression,  
- `<Alt-e>;` to create a tag from a word,  
- `<Alt-e>u` to update a tag,   
- `<Alt-e>d` to select a tag and the content of a block,   
- `<Alt-e>D` to select the content of a block,  
- `<Alt-e>n` to jump snippet next edit point,  
- `<Alt-e>N` to jump snippet previous edit point,  
- `<Alt-e>i` to add width and height on image tag,   
- `<Alt-e>m` to join multiline in one line,  
- `<Alt-e>k` to remove the content of a block,  
- `<Alt-e>j` to split join tag,  
- `<Alt-e>/` to comment a block,  
- `<Alt-e>a` to create an anchor (a href),  
- `<Alt-e>A` make quoted text from an url,  
- `<Alt-e>c` to convert a code block into html.  

## Linters & fixers

### Python

For using python linters & fixers, you will need to setup a virtual env & install the linters & fixers.

```bash
python -m venv .venv
source .venv/bin/activate
pip install python-lsp-server[all]
```
