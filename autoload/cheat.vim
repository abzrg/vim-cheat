" List of all possibel languages and tools that you might look up
let s:languages = [
            \ 'c', 'cpp', 'java', 'objc',
            \ 'lua', 'python', 'javascript', 'elisp', 'lisp',
            \ 'haskell', 'rust', 'erlang', 'erl', 'bash', 'zsh', ]
let s:utils = [
            \ 'find', 'xargs', 'chmod',
            \ 'sed', 'grep', 'awk',
            \ 'rm', 'cp', 'mv', 'mkdir', 'ls',
            \ 'tar', 'unrar', 'unzip', '7z',
            \ 'cron', 'at', 'batch',
            \ 'lsblk', 'mkfs', 'chroot', 'chown', 'chmod', 'umask',
            \ 'userdel', 'adduser', 'deluser', 'useradd', 'groupadd', 'chsh',
            \ 'ffmpeg', 'youtube-dl', 'mpv',
            \ 'systemd', 'runit',
            \ 'xinit', 'startx',
            \ 'git',
            \]
" g:cheat#list is a custom list provided by the user
let s:list = g:cheat#list + s:languages + s:utils
" Remove any duplicates
" source: https://stackoverflow.com/a/6630950/13041067
let s:unduplist=filter(copy(s:list), 'index(s:list, v:val, v:key+1)==-1')

" Remove trailing white spaces
function! cheat#tidy() abort
    let _s=@/
    silent! %s/\s\+$//e
    " Suppress the 'Hit enter to continue' message
    redraw!
    let @/=_s
    nohl
endfunction

function! cheat#queryLanguages(A, L, P) abort
    " Note that in order to have the completion list intact you must copy it
    " instead of changing it
    " source: https://dev.to/pbnj/how-to-get-make-target-tab-completion-in-vim-4mj1
    return filter(copy(s:unduplist), 'v:val =~ "^' . a:A . '"')
endfunction

function! cheat#cheat() abort
    " Prompt the user for a language or a tool
    echoh Question
    let l:selected = join(split(input('lang/tool> ', "", "customlist,cheat#queryLanguages")), '+')
    " Check if the user chosed an item
    if empty(l:selected) != 0
        return
    endif
    let l:query = join(split(input('query> ')), '+')
    echoh None

    " Construct the url
    if l:query ==# ""
        " If no query provided
        let l:url = 'cht.sh/' . l:selected
    else
        if index(s:unduplist, l:selected, v:true) == '-1'
            " Utility
            let l:url = 'cht.sh/' . l:selected . '~' . l:query
        else
            " Language
            let l:url = 'cht.sh/' . l:selected . '/' . l:query
        endif
    endif
    " Construct the curl command
    let l:command = 'curl -s -c /tmp/somefileforcurlcookies ' . l:url

    " Grab the output of curl and put into a variable
    let l:content = system('curl -s' . l:command . '| sed ''s/\x1b\[[0-9;]*[a-zA-Z]//g''' )

    " Remove the cookie jar
    call system('rm /tmp/somefileforcurlcookies')

    " After downloading text, create a new scratch buffer in a new tab
    if &buftype ==# 'nofile'
        enew
    else
        tabnew
    endif
    setlocal
                \ bufhidden=wipe
                \ buftype=nofile
                \ nobuflisted
                \ nolist
                \ noswapfile
                \ norelativenumber
                \ nonumber
                \ signcolumn=no
    " To quit this window only press q
    nnoremap <buffer><silent> q :bd<CR>

    " Dump the final content in the buffer
    -1 put =l:content

    " Make this buffer Readonly
    setlocal readonly nomodifiable nomodified

    call cheat#tidy()

    " Immediately go to the top of the buffer
    norm gg
endfunction
