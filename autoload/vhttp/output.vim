function! vhttp#output#OutputErrorOut(message) abort
  echo ''
  redraw
  echoerr a:message
endfunction

function! vhttp#output#OutputDisplayResult(result) abort
  if a:result == ''
    return
  endif

  vnew response
  setlocal buftype=nofile
  setlocal bufhidden=hide
  setlocal noswapfile
  setlocal filetype=html

  call setline(1, split(a:result, "\n"))
endfunction
