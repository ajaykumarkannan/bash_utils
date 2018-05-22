" Global settings for all files (but may be overridden in ftplugin).
" Set the tab stops
set tabstop=2
set shiftwidth=2
set expandtab

" Indentation based on the plugin type
filetype plugin on
filetype indent on
syntax on
set hlsearch
" set cursorline
hi Visual term=reverse cterm=reverse ctermbg=black
" hi CursorLine cterm=None ctermbg=black
" set nocursorline
set nu
set ignorecase
set smartcase
set incsearch
set showcmd
set path=.,,/usr/include

let g:tex_flavor='latex'

au BufNewFile,BufRead *.cl so <sfile>:h/.vim/ftplugin/opencl.vim
augroup filetype
  au! BufRead,BufNewFile *.ll     set filetype=llvm
augroup END
augroup filetype
  au! BufRead,BufNewFile *.td     set filetype=tablegen
augroup END

" Change mapping of commands and search to use commandline-history mode
" nnoremap : q:i
" nnoremap / q/i
" nnoremap ? q?i

" Key mappings for buffers
map <C-t>b :buffers<cr>
map <C-t><left> :bprevious<cr>
map <C-t><right> :bnext<cr>

" Key Mappings for buffers
map <C-t>b :buffers<cr>

" Tell vim to remember certain things when we exit
"  '10  :  marks will be remembered for up to 10 previously edited files
"  "100 :  will save up to 100 lines for each register
"  :20  :  up to 20 lines of command-line history will be remembered
"  %    :  saves and restores the buffer list
"  n... :  where to save the viminfo files
set viminfo='10,\"100,:100,%,n~/.viminfo

" Remove trailing space function
function! RemoveTrailingSpace()
  if !&binary && &filetype != 'diff'
    normal mz
    normal Hmy
    %s/\s\+$//e
    normal 'yz<CR>
    normal `z
  endif
endfunction

" Function to restore the cursor in vim
function! ResCur()
    if line("'\"") <= line("$")
        normal! g`"
        return 1
    endif
endfunction

augroup resCur
    autocmd!
    autocmd BufWinEnter * call ResCur()
augroup END

let Tex_FoldedSections=""
let Tex_FoldedEnvironments=""
let Tex_FoldedMisc=""

" Show status line even when just one window
set ls=2
set statusline=%f%r%m%=%c,%l/%L
" Increase the tab limit for vim
set tabpagemax=100

" Search for currently highlighted string using
vnoremap // y/<C-R>"<CR>

" Remove all trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Fix backspace
set backspace=indent,eol,start

" Add + for wrapped lines
set showbreak=+

" CtrlP
set runtimepath^=~/.vim/ctrlp.vim
let g:ctrlp_by_filename = 1
let g:ctrlp_regexp = 1
let g:ctrlp_max_files = 0
let g:ctrlp_extensions = ['tag']
let g:ctrlp_use_caching = 1
let g:ctrlp_clear_cache_on_exit = 0
set wildignore+=*.o,*.d

" ACP
autocmd WinEnter *.xml: AcpDisable
autocmd WinLeave *.xml: AcpEnable

" Enable ctags upwards traversal
set tags=tags;/
" Ctags better match - match if only one, else provide list
nnoremap <C-]> g<C-]>

" Background Color
set background=dark
" set background=light

" Save folding
" autocmd BufWinLeave *.* mkview
" autocmd BufWinEnter *.* silent loadview

" configure airline
if !exists('g:airline_symbols')
   let g:airline_symbols = {}
endif
" let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline = 1
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 2
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline#extensions#tabline#show_splits = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tab_type = 1
let g:airline#extensions#tabline#close_symbol = '×'
let g:airline#extensions#tabline#show_close_button = 0

" Highlight Tabs
highlight SpecialKey ctermfg=1
set list
set listchars=tab:T>

" TagbarToggle
nmap <F8> :TagbarToggle<CR>

