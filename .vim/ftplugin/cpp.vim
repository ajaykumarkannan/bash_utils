syntax on
set nu
set tabstop=2
set smartindent
set shiftwidth=2
set hlsearch
set backspace=indent,eol,start
set cindent
set cinoptions=(0,u0,U0,g0
set cursorline
set laststatus=2
set nowrap

highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Save folding
set viewoptions=folds
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview 
