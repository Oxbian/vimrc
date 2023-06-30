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

- [OneDark](https://github.com/joshdick/onedark.vim) onedark theme.
- [Vim Airline](https://github.com/vim-airline/vim-airline) Vim statusline.
- [NerdTree](https://github.com/preservim/nerdtree) to have a file tree in vim.
- [Vim devicons](https://github.com/ryanoasis/vim-devicons) language icons for vim.
- [Vim nerdtree syntax highlighting](https://github.com/tiagofumo/vim-nerdtree-syntax-highlight) nerdtree syntax highlighting
- [Vim gitgutter](https://github.com/airblade/vim-gitgutter) to see diff between files with git.
- [ALE](https://github.com/dense-analysis/ale) vim linter, autocompleter, a Swiss knife for all the LSP things.  
- [Asyncomplete](https://github.com/prabirshrestha/asyncomplete.vim) async autocompletion
- [Asyncomplete ALE](https://github.com/andreypopp/asyncomplete-ale.vim) LSP server for asyncomplete & ALE

## Command & keybinds

### General

- `<leader>hl` remove highlighting

#### Window

- `Ctrl+h` move to the left window
- `Ctrl+j` move to the bottom window
- `Ctrl+k` move to the upper window
- `Ctrl+l` move to the right window

#### Buffer

- `<leader>bd` close the current buffer
- `<leader>ba` close all the buffers
- `<leader>l` go to the next buffer
- `<leader>h` go to the precedent buffer

#### Tabs

- `<leader>tn` open a new tab
- `<leader>to` close all other tabs
- `<leader>tc` close current tab page
- `<leader>tm` move the tab after another
- `<leader>t<leader>` go to the next tab
- `<leader>tl` toggle between this tab and the last accessed tab
- `<leader>te` open a new tab with the current buffer

#### Spell check

- `<leader>ss` toggle / untoggle spellchecking
- `<leader>sn` go to the next word to spellcheck
- `<leader>sp` go to the previous word to spellcheck
- `<leader>sa` add a word into the dictionary
- `<leader>s?` show the list of alternatives for the word

More help at `:help spell`

### NerdTree

For help, use `:help NERDTree`.
Keybinds:
- `Ctrl+f` open or close the nerdtree window

### Vim Gutter

For help, use `:help gitgutter`.
Keybinds:
- `[c` & `]c` to jump between hunks,
- `<leader>hp` to preview hunk,
- `<leader>hs` to stage hunk,
- `<leader>hu` to undo hunk,
- `<leader>d` to toggle GitGutter.

Hunks are the difference between your file and the git file.

## Linters & fixers

### Python

For using python linters & fixers, you will need to setup a virtual env & install the linters & fixers.

```bash
python -m venv .venv
source .venv/bin/activate
pip install flake8 pylint pydocstyle bandit mypy black isort
```
