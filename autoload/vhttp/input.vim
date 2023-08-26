function! vhttp#input#PromptHTTPMethod()
  let input_method = trim(toupper(input('HTTP Method: ')))

  if !vhttp#http#IsMethodSupported(input_method)
    return ''
  endif

  return input_method
endfunction

function! vhttp#input#PromptURL()
  let input_url = trim(input('URL: '))

  return input_url
endfunction

function! vhttp#input#PromptOptionalBody()
  if confirm("Will you send body?", "&Yes\n&No") != 1
    return ["OK", ""]
  endif

  let input_body_file = input("Body file: ", "", "file")
  if !filereadable(input_body_file)
    return ["ERROR", "Failed to load file " .. input_body_file]
  endif

  let input_body = readfile(input_body_file)
  let input_body = join(input_body, "\n")

  return ["OK", input_body]
endfunction
