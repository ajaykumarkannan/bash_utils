syntax on
setlocal tabstop=4
setlocal shiftwidth=4
setlocal formatoptions=croql
setlocal softtabstop=4
setlocal nu
setlocal hlsearch
setlocal cursorline
setlocal laststatus=2
setlocal autoindent
setlocal expandtab

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Save folding
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
