# VIM

This repo contains my vim configuration, hope it will be usefull for you.  

## Installation  

You will need `vim` and `git` to be able to use this config.  

Normally if you run the `install.sh` script it will work, but if you have a problem, try to install vim plug and check if your problem is solved.  

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Oh and remove neovim, it make some problems with vim.  

## Plugins

This config has just the necessarry plugins installed:  
- [OneDark](https://github.com/joshdick/onedark.vim) onedark theme.  
- [Vim Airline](https://github.com/vim-airline/vim-airline) Vim statusline.  
- [NerdTree](https://github.com/preservim/nerdtree) to have a filetree in vim.  
- [Vim devicons](https://github.com/ryanoasis/vim-devicons) language icons for vim. 
 [Vim gitgutter](https://github.com/airblade/vim-gitgutter) to see diff between files with git.  
- [Vim fugitive](https://github.com/tpope/vim-fugitive) to be able to use some powerful git commands in git.
- [ALE](https://github.com/dense-analysis/ale) vim linter, autocompleter, a swiss knife for all the LSP things.  
- [Vim vsnip](https://github.com/hrsh7th/vim-vsnip/tree/master) vscode snippets for vim.  
- [Vim friendly snippets](https://github.com/rafamadriz/friendly-snippets) vim snippets collection in vscode format.  

## Command & keybinds

### General

- `Ctrl+h` move to the left window  
- `Ctrl+j` move to the bottom window
- `Ctrl+k` move to the upper window
- `Ctrl+l` move to the right window
- `<leader>h` remove highligthing

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

### Vim Fugitive

For help, use `:help fugitive`.  

