# Cheat.vim

Downloads cheat sheets from https://cht.sh and display them in a tab.

## How to use

You can either issue a command or use a mapping,

```vim
" Use following command in command mode
:Cheat
```

```vim
" Create a mapping
nnoremap <leader>c :Cheat<CR>
```

## How it works

It prompts you twice, first for providing a language/utility, and then for
entering an optional search query (skip it with either `<Return>` or `<Esc>`).
It do its best to add syntax highlighting to the cheat sheets. When done press
`q` to quit the tab. For the first prompt, you can auto-complete with `<Tab>`.
If your language/utility is not appeared in the auto-complete, assign
`g:cheat#languages` and/or `g:cheat#utils` to a custom list. For example:

```vim
let g:cheat#languages = [
  \ 'typescript'
  \ 'swift'
  \ 'kotlin'
\ ]

let g:cheat#utils = [
  \ 'bat'
  \ 'jq'
  \ 'delta'
\ ]
```

The default list of languages is all the languages neovim/vim supports. The
default utilities will be completed as time goes.

## Installation

Install using your favorite package manager, or use Vim's built-in package
support:

```sh
mkdir -p ~/.vim/pack/user/start
cd ~/.vim/pack/user/start
git clone https://github.com/reverseila/vim-cheat
vim -u NONE -c "helptags vim-cheat/doc" -c q
```

### Dependencies

The only dependencies are `curl` and `sed`.

## Credits

Thanks to [ThePrimeagen](https://github.com/ThePrimeagen). The idea of creating
this (my first plugin!) comes from a
[video](https://www.youtube.com/watch?v=hJzqEAf2U4I) of him.

Thanks to [Tim Pope](https://github.com/tpope). To write the help
file and create the structure of this plugin I studied his
[commentary](https://github.com/tpope/vim-commentary) plugin.
