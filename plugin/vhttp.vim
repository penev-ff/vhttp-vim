if exists('g:vhttp_loaded_version')
  finish
endif

let g:vhttp_loaded_version = '0.0.1'

if !exists("g:vhttp_execute")
  let g:vhttp_execute = "<c-h>e"
endif

if !exists("g:vhttp_execute_last")
  let g:vhttp_execute_last = "<c-h>l"
endif

if !exists("g:vhttp_execute_get")
  let g:vhttp_execute_get = "<c-h>g"
endif

execute 'nnoremap <silent> ' g:vhttp_execute ' :<c-u>call vhttp#VHttp()<cr>'
execute 'nnoremap <silent> ' g:vhttp_execute_last ' :<c-u>call vhttp#VHttpLast()<cr>'
execute 'nnoremap <silent> ' g:vhttp_execute_get ' :<c-u>call vhttp#VHttpGET()<cr>'

command! -nargs=0 VHTTP call vhttp#VHttp()
command! -nargs=0 VHTTPLast call vhttp#VHttpLast()
command! -nargs=1 VHTTPGet call vhttp#VHttpGET(<f-args>)
command! -nargs=1 VHTTPPost call vhttp#VHttpPOST(<f-args>)
command! -nargs=1 VHTTPPut call vhttp#VHttpPUT(<f-args>)
command! -nargs=1 VHTTPDelete call vhttp#VHttpDELETE(<f-args>)