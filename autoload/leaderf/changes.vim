

function! leaderf#changes#source(args) abort
    let changes = split(execute('changes'), "\n")
    let result = reverse(changes[1:])
    if result[0] == '>'
        let result = result[1:]
    endif
    return [changes[0]] + result
endfunction

function! leaderf#changes#accept(line, args) abort
    if a:line !~ '^[> \t]'      " Title
        return
    endif
    let line_num = matchstr(a:line, '^.\{-}\d\+\s\+\zs\d\+')
    if line_num == ''
        return
    endif
    let col_num = matchstr(a:line, '^.\{-}\d\+\s\+\d\+\s\+\zs\d\+')
    call cursor(line_num, col_num)
endfunction

function! leaderf#changes#preview(orig_buf_nr, orig_cursor, line, args) abort
    if a:line !~ '^[> \t]'      " Title
        return []
    endif

    let line_num = matchstr(a:line, '^.\{-}\d\+\s\+\zs\d\+')
    if line_num == ''
        return []
    endif

    return [a:orig_buf_nr, line_num, '']
endfunction

function! leaderf#changes#bang_enter(orig_buf_nr, orig_cursor, args) abort
    call search('^>')
    redraw
    "norm! zz
endfunction
