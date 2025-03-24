" Set space as leader.
nnoremap <SPACE> <Nop>
let mapleader="\<Space>"
let maplocalleader="\\"

syntax on                   " Turn on syntax highlighting.

set mouse=a                 " Enable mouse usage (all modes).

set number                  " Precede each line with its line number.
set relativenumber          " Show line numbers relative to cursor.
set cursorline              " Highlight current line.
set signcolumn=yes:1        " Persist extra column before line numbers for signs.

set nowrap                  " Do not wrap long lines (scroll instead).
set scrolloff=5             " Minimum number of rows to keep around cursor.
set sidescrolloff=5         " Minimum number of columns to keep around cursor.

set splitbelow              " Open new panes at the bottom (e.g., terminal).
set splitright              " Open new panes on the right.

set autowrite               " Auto-save files before commands like `:!` or `:make`.
set autoread                " Auto-reload files if changed on disk.
set undofile                " Persist undo history across sessions (`~/.local/state/nvim/undo/`).

" Remove trailing whitespace and multiple newlines.
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre * %s/\n\+\%$//e

set incsearch               " Show matches while typing.
set ignorecase              " Make search case insensitive.
set smartcase               " Override `ignorecase` if pattern contains uppercase letters.
set gdefault                " Global (`/g`) substitution by default.

set termguicolors           " Enable 24-bit RGB colors.

set colorcolumn=73,81       " Show ruler at columns.

set smartindent             " Do smart autoindenting when starting a new line.
set tabstop=4               " Use 4 spaces per tab.
set expandtab               " Convert tabs to spaces.
set shiftwidth=4            " Shift (`<<`, `>>`, `=`) by 4 spaces (breaks `.editorconfig` support).
set softtabstop=-1          " Pressing `<Tab>` matches indentation width (`shiftwidth`).

autocmd FileType json setlocal colorcolumn=81
autocmd FileType markdown setlocal textwidth=72 colorcolumn=73
autocmd FileType python setlocal colorcolumn=73,89
autocmd FileType rust setlocal colorcolumn=73,101
autocmd FileType vim setlocal colorcolumn=73

autocmd FileType html,css setlocal tabstop=2 shiftwidth=2
autocmd FileType javascript,typescript setlocal tabstop=2 shiftwidth=2
autocmd FileType json setlocal tabstop=2 shiftwidth=2
autocmd FileType lua setlocal tabstop=2 shiftwidth=2
autocmd FileType yaml setlocal tabstop=2 shiftwidth=2

" Leader mappings.
noremap <Leader><Leader> <C-^>
noremap <Leader>w <Cmd>w<CR>

" Force the use of `hjkl`.
noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Up> <Nop>
noremap <Down> <Nop>

" Use left and right arrows to navigate and open buffers.
noremap <Left> <Cmd>bnext<CR>
noremap <Right> <Cmd>bprevious<CR>
noremap <Leader><Left> <Cmd>Buffers<CR>
noremap <Leader><Right> <Cmd>Explore<CR>
" Use up and down arrows to navigate and create tabs.
noremap <Up> <Cmd>tabnext<CR>
noremap <Down> <Cmd>tabprevious<CR>
noremap <Leader><Up> <Cmd>tabnew<CR>
noremap <Leader><Down> <Cmd>tabs<CR>
