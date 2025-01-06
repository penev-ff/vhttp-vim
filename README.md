# vhttp-vim

vhttp-vim is a Vim plugin written in Vim Script that provides HTTP client functionality directly within Vim.  
This plugin allows users to execute HTTP requests and interact with APIs without leaving the Vim editor.

## Features

- Perform HTTP GET, POST, PUT, and DELETE requests
- Customizable headers and request body
- View response status, headers, and body
- Syntax highlighting for JSON and other response formats

## Installation

1. Add the following line to your `.vimrc`:

```vim
Plug 'penev-ff/vhttp-vim'
```

2. Install the plugin using the `:PlugInstall` command.

## Usage

### Performing a GET request

To perform a GET request, use the `:HttpGet` command followed by the URL:

```vim
:HttpGet https://api.example.com/data
```

### Performing a POST request

To perform a POST request, use the `:HttpPost` command followed by the URL and request body:

```vim
:HttpPost https://api.example.com/data {"key": "value"}
```

### Viewing the response

The response will be displayed in a new buffer with syntax highlighting for easier readability.

## License

This project is licensed under the MIT License. See the [LICENSE](LICENSE) file for details.
