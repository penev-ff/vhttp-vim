# vhttp-vim

vhttp-vim is a lightweight Vim plugin that brings minimalistic simple HTTP client functionality to your editor. 

## Features

- Perform HTTP GET, POST, PUT, and DELETE requests
- Customizable headers and request body
- View response status, headers, and body
- Syntax highlighting for JSON and other response formats

## Installation

1. Plug vhttp-vim to your `.vimrc`:

```vim
call plug#begin('~/.vim/plugged')

Plug 'penev-ff/vhttp-vim'

call plug#end()
```

2. Install the plugin using the `:PlugInstall` command.

## Usage

### Performing a request

```vim
:VHTTP
```

### Execute the previous call

```vim
VHTTPLast
```

### Shortcut Keybindings

`<c-h>e`: Triggers the main HTTP request function (VHTTP).
`<c-h>l`: Repeats the last HTTP request (VHTTPLast).

### Viewing the response

The response will be displayed in a new buffer with syntax highlighting for easier readability.

## License

This project is licensed under the MIT License. Please look at the [LICENSE](LICENSE) file for details.
