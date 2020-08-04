packadd minpac
call minpac#init()

" --------------------------------------------------
" Plugins Via Minpac:
" --------------------------------------------------
call minpac#add('k-takata/minpac', {'type': 'opt'})	    " Tell minpac to update itself; opt loads it first

" Colourschemes
call minpac#add('cocopon/iceberg.vim')			        " Iceberg colour scheme
call minpac#add('itchyny/lightline.vim')        	    " Lightline status line
call minpac#add('gkeep/iceberg-dark')                   " Iceberg colours for Lightline

" Writing
call minpac#add('reedes/vim-litecorrect')               " Autocorrection for vim
call minpac#add('reedes/vim-lexical')                   " Better spelling/thesaurus
call minpac#add('reedes/vim-pencil')                    " Friendlier text editing
call minpac#add('junegunn/goyo.vim')                    " Writeroom for vim

" Functionality
call minpac#add('justinmk/vim-sneak')		            " Better search motions
call minpac#add('tpope/vim-fugitive')                   " Fugitive Git plugin
call minpac#add('airblade/vim-gitgutter')               " GitGutter
call minpac#add('SirVer/ultisnips')                     " Snippets engine
call minpac#add('honza/vim-snippets')                   " Snippets
call minpac#add('mbbill/undotree')                      " Access the undo tree
call minpac#add('scrooloose/nerdcommenter')             " NERDCommenter
call minpac#add('scrooloose/nerdtree')                  " NERDTree
call minpac#add('luochen1990/rainbow')                  " Rainbow parentheses
call minpac#add('tpope/vim-repeat')                     " Plugins can use '.'

" Utilities
call minpac#add('xolox/vim-misc')                       " Support for notes
call minpac#add('xolox/vim-notes')                      " Notes for vim
call minpac#add('vimoutliner/vimoutliner')              " Vim Outliner (votl)
call minpac#add('mhinz/vim-startify')                   " Startify startup screen

" Filetypes
call minpac#add('lervag/vimtex')                        " Support for LaTeX
call minpac#add('vim-pandoc/vim-pandoc')                " Support for Pandoc
call minpac#add('vim-pandoc/vim-pandoc-syntax')         " Support for Pandoc syntax
"call minpac#add('tpope/vim-fireplace')                  " Support for Clojure

" Clojure/Racket
"call minpac#add('Olical/conjure')
"call minpac#add('liuchengxu/vim-clap')
call minpac#add('tpope/vim-sexp-mappings-for-regular-people')
call minpac#add('guns/vim-sexp')
call minpac#add('tpope/vim-surround')
call minpac#add('w0rp/ale')
call minpac#add('liquidz/vim-iced')
call minpac#add('eraserhd/parinfer-rust')               " Parinfer

" Enable vim-iced's default key mapping
" This is recommended for newbies
let g:iced_enable_default_key_mappings = v:true
"let g:sexp_insert_after_wrap = v:false

" Easy utility commands for minpac
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()

" --------------------------------------------------
" Colorschemes:
" --------------------------------------------------
"set termguicolors                                      " 24-bit true colour
let g:lightline = { 'colorscheme': 'icebergDark' }      " Iceberg-dark colorscheme for lightline
colorscheme iceberg                                     " Iceberg colorscheme for vim (order matters)

" Highlight colours; gui* is set in case termguycolors is set above
function! HighlightColours()
	highlight clear SpellBad
	highlight SpellBad guifg=LightRed ctermfg=Red ctermbg=None
	highlight clear SpellCap
	highlight SpellCap guifg=DarkRed ctermfg=DarkRed ctermbg=None cterm=None
	highlight clear SpellRare
	highlight SpellRare guifg=Green ctermfg=Green ctermbg=None cterm=None
	highlight clear SpellLocal
	highlight SpellLocal guifg=DarkGreen ctermfg=DarkGreen ctermbg=None cterm=None
	highlight clear Search
	highlight Search guifg=Yellow ctermfg=Yellow ctermbg=None
	highlight clear IncSearch
	highlight IncSearch gui=underLine guifg=Yellow cterm=underLine ctermfg=Yellow ctermbg=None
	highlight clear Sneak
	highlight Sneak guifg=Magenta ctermfg=Magenta ctermbg=None
endfunction

" Override the highlights with HighlightColours() when colourscheme is called
augroup MyHighlightColours
    autocmd!
    autocmd ColorScheme * call HighlightColours()
augroup END

" --------------------------------------------------
" Appearance:
" --------------------------------------------------
set noshowmode                      			" Hide INSERT/VISUAL messages (done by lightline)
set number                          			" Line numbers
set cursorline                      			" Highlight the current line
set showmatch                                   " Highlight matching parentheses/brackets
set relativenumber                              " Relative line numbers 
set scrolloff=15                                " Keep cursor centred
set list listchars=tab:\ \ ,trail:·             " Mark trailing spaces with '·'

" --------------------------------------------------
" Searching:
" --------------------------------------------------
set ignorecase                      			" Searches are case insensitive...
set smartcase                       			" ... unless they contain capitals

" --------------------------------------------------
" Functionality:
" --------------------------------------------------
let mapleader = ','                             " Leader is a comma
let maplocalleader = ','                        " Localleader is a comma
set ts=4 sts=4 sw=4 expandtab                   " convert tabs to spaces
set nrformats-=octal                            " Ignore leading zeros (octals) in <C-a>/<C-x>
"set clipboard+=unnamedplus                     " Set unnamed clipboard to system
set timeoutlen=500                              " Shorten time waiting to complete a mapped sequence
set mouse=n                                     " Recognise mouse clicks and scrolling in normal mode
set undofile                                    " Persistent undo after exit

" --------------------------------------------------
" Functionality For Plugins:
" --------------------------------------------------
let g:lexical#spelllang = ['en_ca']             " Lexical: Canadian english spelling
let g:sneak#s_next = 1                          " eneak: Clever-s
let g:notes_suffix = '.txt'                     " Notes: filename extension
let g:notes_directories = ['~/Documents/Notes'] " Notes: directory
let g:UltiSnipsEditSplit='vertical'             " Ultisnips:  Split vertically on :UltiSnipsEdit
let g:UltiSnipsSnippetDirectories=[$HOME.'/.vim/pack/minpac/start/ultisnips',$HOME.'/.vim/snips'] " Where to look for snippets (may be a list)
let g:ale_linters_explicit = 1                  " Only turn on ALE if we have a linter by filetype
let g:tex_flavor = 'latex'                      " Default tex flavour for vimtex

" Better key bindings for UltiSnipsExpandTrigger
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"

" Turn off rainbow parentheses, except when explicitly turned on
let g:rainbow_active = 1

" --------------------------------------------------
" Folding:
" --------------------------------------------------
set foldenable                                  " Enable folding
set foldmethod=indent                           " Fold based on indent level
set foldlevelstart=10                           " Open most folds to start

" --------------------------------------------------
" Custom Commands:
" --------------------------------------------------
" Remove search highlighting: 1
" Trigger list of recent notes: 2
" Trigger un_dotree: 3
" Activate nerdtree: 4
" Comment toggle using nerdcommenter: 5
" Writing mode using Goyo and full screen: 6 / else with Goyo only
" Restore writing mode: 7
" Fix syntax highlighting (when vim loses track): 8
" Fix the last spelling error wth c-f (in insert mode): 9
" Fix the last spelling error wth c-f (in normal mode): 10
" Toggle on/off rainbow parentheses: 11
" Write a file: 12
" Write a file and quit: 13
" Start fzf: 14

nnoremap <leader>sc      :noh<CR>
nnoremap <leader>rn      :RecentNotes<CR>
nnoremap <leader>u       :UndotreeToggle<CR>
noremap  <leader>n       :NERDTreeToggle<CR>
nmap     <c-_>           <leader>ci<Down>
vmap     <c-_>           <leader>ci
nnoremap <leader>go      :Goyo<CR>
nnoremap <leader>go!     :Goyo<CR>:Goyo<CR>:call HighlightColours()<CR>
nnoremap <leader>sh      :syntax sync fromstart<CR>
imap     <c-f>           <c-g>u<Esc>[s1z=`]a<c-g>u
nmap     <c-f>           [s1z=``
nnoremap <leader>rp      :RainbowToggle<CR>
nnoremap <leader>w       :w<CR>
nnoremap <leader>wq      :wq!<CR>
nnoremap <C-p>           :<C-u>FZF<CR>


" Explanation for <c-f>:
" <c-g>u : sets undo break
" <Esc>  : normal mode
" [s     : choose last spelling mistake
" 1z=    : choose first suggestion
" `]a    : jump back and append
" <c-g>u : set undo break
" ``     : move cursor back (normal; use instead of <c-o> in nvim)

" --------------------------------------------------
" Features For Filetypes:
" --------------------------------------------------
set rtp+=/usr/local/opt/fzf         " Add fzf to the runtime path

" --------------------------------------------------
" Features For Filetypes:
" --------------------------------------------------
function! Text() " Activate writing features

    let user_dict = {
      \ 'structure': ['sturcture'],
      \ }

    call litecorrect#init(user_dict)
    call lexical#init()
    call pencil#init({'wrap': 'soft', 'autoformat': 0})
    set spell spelllang=en_ca wrap linebreak nolist
endfunction

augroup FileTypeConfiguration
  autocmd!

  " Text and Markdown files
  autocmd FileType text call Text()
  autocmd FileType markdown call Text()
  autocmd FileType markdown call HighlightColours()

  " Outliner files
  autocmd FileType votl call Text()
  autocmd FileType votl call HighlightColours()

  " LaTeX files
  autocmd FileType tex call Text()
  autocmd FileType tex set conceallevel=0
  autocmd FileType tex RainbowToggleOn
  autocmd FileType tex nnoremap <leader>wc :VimtexCountWords<CR>  " Wordcount for LaTeX
  autocmd FileType tex nnoremap <leader>wc! :VimtexCountWords!<CR> " Detailed wordcount for LaTeX

  " Clojure files
  "\ 'clojure': ['clj-kondo', 'joker']
  autocmd FileType clojure let g:ale_linters = {'clojure': ['clj-kondo']}
  autocmd FileType clojure ALEEnable
  " Release ,w mapping and set round_head/tail_wrap_element to e/E
  autocmd FileType clojure let g:sexp_mappings = {'sexp_round_head_wrap_element': '<leader>e',
                                                \ 'sexp_round_tail_wrap_element': '<leader>E'}
  autocmd FileType clojure let g:sexp_enable_insert_mode_mappings = 0

augroup END

call HighlightColours()
