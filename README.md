# VIM

This repo contains my vim configuration, hope it will be useful for you.

## Installation

You will need `vim` and `git` to be able to use this configuration.  
  
Normally if you run the `install.sh` script it will work, but if you have a
problem, try to install vim plug and check if your problem is solved.  
  
**Since VIM 9.1.0327, vim can now read config from $XDG_CONFIG_HOME/vim**  

```sh
git clone https://git.arka.rocks/Oxbian/vimrc.git ~/config/vim  
```

## Plugins

This config has just the necessary plugins installed:

### Themes

- [OneDark](https://github.com/joshdick/onedark.vim) onedark theme.

### Graphics utilities

- [Vim which key](https://github.com/liuchengxu/vim-which-key) show leader
keybinds in a GUI.
- [Vim gitgutter](https://github.com/airblade/vim-gitgutter) to see diff between
files with git.
- [Css color](https://github.com/ap/vim-css-color) preview css colors. (searching better plugins for all viewing all colors codes)

### LSP

- [CoC](https://github.com/neoclide/coc.nvim) a LSP plugin that work like VsCode
LSP, and in Node (yeah I don't like it too but no choice...).

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
Key binds:

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
- `D` delete a file

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

### Coc (Linter, Formatter, Snippets)

For help, use `:help coc`.  
Key binds:

- `<leader>gd` go to the definition,
- `<leader>gn` go to the next diagnostic,
- `<leader>gp` go to the previous diagnostic,
- `<leader>gr` go to the reference,
- `<leader>gR` rename element,
- `<leader>gy` type definition,
- `<leader>gi` go to implementation,
- `<leader>gh` documentation,
- `<leader>gf` format document.

## Snippets

To have snippets autocompletion, I use Coc snippets settings.
The `install.sh` script add the `coc-settings.json` file to the right place for
having all snippets filepath configured.

Moreover, you'll need to install in vim a Coc Extension:

```vim
:CocInstall coc-snippets
```

## Linters & fixers

The following table shows the extensions I use for linting.  
You can install them with 

```vim
:CocInstall <extension>
```

| Language   | Coc Extension    |
|:----------:|:----------------:|
| JSON       | coc-json         |
| Markdown   | coc-markdownlint |
| PHP        | coc-phpls        |
| HTML       | coc-html         |
| CSS        | coc-css          |
| Javascript | coc-tsserver     |

## Formatter

By default my `coc-settings.json` add autoformatting on save on each filetype,
you just need a LSP server for the filetype.

But if it's not working you could use vim formatting `ggvG=`, `=` is vim command
for formatting text.

## VM

To code on a virtual machine, I use sshfs, it just mount the system of the vm
on my machine and tada!  

```bash
sudo mkdir /mnt/vm
sudo sshfs -o allow_other -p 22 user@localhost:/home/user/ /mnt/vm/
```
