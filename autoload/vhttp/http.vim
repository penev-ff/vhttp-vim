" HEAD, CONNECT, OPTIONS, TRACE are not supported yet
let s:SUPPORTED_HTTP_METHODS = ['GET', 'POST', 'PUT', 'DELETE']

function! vhttp#http#IsMethodSupported(method)
  for supported_method in s:SUPPORTED_HTTP_METHODS
    if a:method == supported_method
      return 1
    endif
  endfor

  return 0
endfunction

function! vhttp#http#SupportedMethods() 
  return s:SUPPORTED_HTTP_METHODS
endfunction

function! vhttp#http#SupportedMethodsAsStr() 
  return join(s:SUPPORTED_HTTP_METHODS, ', ')
endfunction
