# Cheat.vim

Downloads cheat sheets from https://cht.sh and dispaly them in a tab.

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
entering an optional search query (skip it with either `<Return>` or `<Esc>` ).
It do its best to add syntax highlighting to the cheatsheets. When done press
`q` to quit the tab. For the first prompt, you can autocomplete with `<Tab>`. If
your language/utility is not appeared in the automplete, assign
`g:cheat#languages` and/or `g:cheat#utils` to a custom list that contains all
the languages/utilities you. for example:

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

## Installation

- vim-plug:
```vim
  Plug 'reverseila/vim-cheat'
```
- packer.nvim:
```vim
  use 'reverseila/vim-cheat'
```

### Dependencies

The only dependency is the `curl` utility.

## Notes

The default list of languages is all languages that neovim supports. The default
utilities will be completed subsequently.
