let g:vhttp_config = {
    \ 'method': 'GET',
    \ 'url': '',
    \ 'body': '',
    \ }

let s:VHTTP_REQUEST_BODY_ALLOWED = 1
let s:VHTTP_REQUEST_BODY_NOT_ALLOWED = 0

function! vhttp#VHttp()
  let method = vhttp#input#PromptHTTPMethod()
  if method == ''
    call vhttp#output#OutputErrorOut('The supported methods are: ' .. vhttp#http#SupportedMethodsAsStr())
    return
  endif

  let url = vhttp#input#PromptURL()
  for supported_method in vhttp#http#SupportedMethods()
    if method == supported_method
        let functionName = 'vhttp#VHttp' .. supported_method
        call call(functionName, [ url ])
        return
    endif
  endfor
endfunction

function! vhttp#VHttpLast()
  if g:vhttp_config.url == ''
    call vhttp#output#OutputErrorOut("A request still have not been made!")
    return
  endif

  call s:ExecuteRequest()
endfunction

function! vhttp#VHttpGET(url)
  call s:ConfigureVHttp('GET', a:url, s:VHTTP_REQUEST_BODY_NOT_ALLOWED)
  call s:ExecuteRequest()
endfunction

function! vhttp#VHttpPOST(url)
  call s:ConfigureVHttp('POST', a:url, s:VHTTP_REQUEST_BODY_ALLOWED)
  call s:ExecuteRequest()
endfunction

function! vhttp#VHttpPUT(url)
  call s:ConfigureVHttp('PUT', a:url, s:VHTTP_REQUEST_BODY_ALLOWED)
  call s:ExecuteRequest()
endfunction

function! vhttp#VHttpDELETE(url)
  call s:ConfigureVHttp('DELETE', a:url, s:VHTTP_REQUEST_BODY_ALLOWED)
  call s:ExecuteRequest()
endfunction

function! s:ConfigureVHttp(method, url, bodyAllowed)
  let g:vhttp_config.method = a:method
  let g:vhttp_config.url = a:url

  if a:bodyAllowed
    let optionalBody = vhttp#input#PromptOptionalBody()
    if optionalBody[0] == 'ERROR'
      call vhttp#output#OutputErrorOut(optionalBody[1])
      return
    endif
  
    let g:vhttp_config.body = optionalBody[1]
  endif
endfunction

function! s:ExecuteRequest()
  if !executable('curl')
    call vhttp#output#OutputErrorOut("Curl was not found on this machine! Please, install it to use the plugin.")
    return
  endif

  if g:vhttp_config.method == ''
    call vhttp#output#OutputErrorOut('Invalid HTTP Method: ' .. g:vhttp_config.method)
    return
  endif

  if g:vhttp_config.url == ''
    call vhttp#output#OutputErrorOut('Invalid URL: ' .. g:vhttp_config.url)
    return
  endif

  let curl = printf('curl --fail --silent --show-error --verbose --user-agent "VHTTP/%s" -X %s -d %s %s',
            \ g:vhttp_loaded_version,
            \ g:vhttp_config.method,
            \ shellescape(g:vhttp_config.body),
            \ shellescape(g:vhttp_config.url))

  let result = system(curl)
  if v:shell_error
    call vhttp#output#OutputErrorOut(result)
    return ''
  endif

  call vhttp#output#OutputDisplayResult(result)
endfunction
