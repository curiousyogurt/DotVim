" This gets called if MacVim (or othre gui vim) is started
set antialias                     " Turn on font antialiasing
set guifont=Source_Code_Pro:h16   " Source Code Pro Font
set laststatus=2                  " Be sure to show lightline
set guioptions=                   " Disable all scroll bars
set guioptions-=T                 " Start without toolbar
set guioptions-=L                 " Turn off left-side scrollbar (when NERDTree is activated)
set guioptions=c                  " Use GUI tabs, not console style tabs
set guioptions=e                  " Use simple dialogues rather than pop-ups
set lazyredraw                    " Do not redraw in macros
set ttyfast                       " Improve redrawing speeds
set incsearch                     " Search as characters are entered
set guicursor=n:blinkwait700-blinkon400-blinkoff250 " Force non-insane blinking in normal mode
call HighlightColours()
