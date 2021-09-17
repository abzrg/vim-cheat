" cheat.vim -- Grabs cheatsheets from <https://cht.sh>
" Maintainer:   Ali Bozorgzadeh <https://github.com/reverseila/>
" Version:      1.0

if exists('g:loaded_cheat')
    finish
endif
let g:loaded_cheat = 1

" If you cannot find your specific language/utilities in the autocomplete, add
" them in this array
let g:cheat#languages = []
let g:cheat#utils = []

" A command wrapper for the main function
command! Cheat :call cheat#cheat()

" Choose a binding for this plugin
nnoremap <unique> <leader>c :call cheat#cheat()<CR>

