"=====================================================================================
"	orion3939's vimrc
"	Can't use on Windows.
"=====================================================================================
if has('vim_starting')
	"vi 互換モード対策
	if &compatible
		set nocompatible
	endif
endif

" ~/.pyenv/shimsを$パスに追加
let $PATH = "~/.pyenv/shims:".$PATH

" ファイルタイプ識別を一旦無効化
filetype off
filetype plugin indent off

" 設定ファイルは~/dotfiles/vim-settings/に記述する。
" ここですべての~/dotfiles/vim-settings/*.vimファイルを読み込む。
set runtimepath+=~/dotfiles/
runtime! vim-settings/*.vim
  
augroup FileTypeIndent
  autocmd! 
	autocmd BufNewFile,BufRead *.cpp  setlocal shiftwidth=4 tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.c  setlocal shiftwidth=4 tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.py  setlocal shiftwidth=4 tabstop=4 softtabstop=4
	autocmd BufNewFile,BufRead *.rb  setlocal shiftwidth=2 tabstop=2 softtabstop=2
augroup END

" end sequence
"=====================================================================================
syntax on	"色分け
filetype on	"ファイルタイプの識別
filetype indent on
filetype plugin on

set backspace=indent,eol,start
NeoBundleCheck
