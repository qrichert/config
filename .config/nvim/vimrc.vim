syntax on                   " Turn on syntax highlighting.

set mouse=a                 " Enable mouse usage (all modes).

set number                  " Precede each line with its line number.
set relativenumber          " Show line numbers relative to cursor.
set cursorline              " Highlight current line.

set nowrap                  " Do not wrap long lines (scroll instead).
set scrolloff=5             " Minimum number of rows to keep around cursor.
set sidescrolloff=5         " Minimum number of columns to keep around cursor.

set smartindent             " Do smart autoindenting when starting a new line.
set tabstop=4               " Use 4 spaces per tab.
set expandtab               " Convert tabs to spaces.
set shiftwidth=4            " Shift (`<<`, `>>`) by 4 spaces.

set splitbelow              " Open new panes at the bottom (e.g., terminal).
set splitright              " Open new panes on the right.

set autowrite               " Auto-save files before commands like `:!` or `:make`.
set autoread                " Auto-reload files if changed on disk.
set undofile                " Persist undo history across sessions.

" Remove trailing whitespace and multiple newlines.
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

set incsearch               " Show matches while typing.
set ignorecase              " Make search case insensitive.
set smartcase               " Override `ignorecase` if pattern contains uppercase letters.
set gdefault                " Global (`/g`) substitution by default.

set termguicolors           " Enable 24-bit RGB colors.

set colorcolumn=73,81,89    " Show ruler at given columns.
highlight ColorColumn ctermbg=none
highlight ColorColumn ctermfg=Darkgrey
highlight ColorColumn cterm=underline

" Force the use of `hjkl`.
noremap <Up> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
