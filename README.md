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

### Graphics utilities

- [Vim which key](https://github.com/liuchengxu/vim-which-key) show leader keybinds in a GUI.
- [Vim gitgutter](https://github.com/airblade/vim-gitgutter) to see diff between files with git.

### LSP

- [Vim-lsp](https://github.com/prabirshrestha/vim-lsp) linter & formatter for language.
- [Vim-lsp settings](https://github.com/mattn/vim-lsp-settings) easily setup lsp servers for languages.
- [Asyncomplete](https://github.com/prabirshrestha/asyncomplete.vim) async autocompletion
- [Asyncomplete & lsp-vim](https://github.com/prabirshrestha/asyncomplete-lsp.vim) use vim-lsp as source for autocompletion lsp server.
- [Vim Wakatime](https://github.com/wakatime/vim-wakatime) to have wakatime time tracking in vim. 

### Languages utilities



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

### Treeview

For help, use `:help netrw`.
Keybinds:
- `Ctrl+f` open the treeview buffer at the left,
- `gh` show/hide hidden files,
- `gp` change permission of local file
- `I` show netrw banner,
  
- `j/k` movement,
- `-` go up one dir,
- `<enter>` go down one dir,
  
- `d` create a directory,
- `%` create a file,
- `R` rename/move a file,

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

## Linters & fixers

### Python

For using python linters & fixers, you will need to setup a virtual env & install the linters & fixers.

```bash
python -m venv .venv
source .venv/bin/activate
pip install python-lsp-server[all]
```

## VM

To code on a virtual machine, I use sshfs, it just mount the system of the vm on my machine and tada!  

```bash
sudo mkdir /mnt/vm
sudo sshfs -o allow_other -p 22 user@localhost:/home/user/ /mnt/vm/
```

