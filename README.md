# vhttp-vim

vhttp-vim is a lightweight Vim plugin that brings minimalistic and simple HTTP client functionality to your editor. 

## Installation

1. Plug vhttp-vim to your `.vimrc`:

```vim
call plug#begin('~/.vim/plugged')

Plug 'penev-ff/vhttp-vim'

call plug#end()
```

2. Install the plugin using the `:PlugInstall` command.

## Usage

### Execute a request

```vim
:VHTTP
```

### Execute the previous request

```vim
:VHTTPLast
```

### Shortcut Keybindings

`<c-h>e`: Triggers the main HTTP request function (VHTTP).  
`<c-h>l`: Repeats the last HTTP request (VHTTPLast).  

### Viewing the response

The response is displayed in a new buffer with syntax highlighting.

## License

This project is licensed under the MIT License. Please look at the [LICENSE](LICENSE) file for details.
