"NeoBundle Required
if has('vim_starting')
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif

call neobundle#begin(expand('~/.vim/bundle/'))

" ~/.pyenv/shims を $PATH に追加する
" これを行わないとpythonが正しく検索されない
set runtimepath+=~/.pyenv/shims


" plugin
"=====================================================================================
NeoBundleFetch 'Shougo/neobundle.vim'	"neobundle自体をneobundleで管理

NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neocomplete'
NeoBundle 'scrooloose/nerdtree'	"ファイルツリー表示系男子
NeoBundle 'tomtom/tcomment_vim'	"comment on/offを<c-_>でできる
NeoBundle 'nathanaelkane/vim-indent-guides'
NeoBundle 'itchyny/lightline.vim'	"ステータスライン全体拡張
"NeoBundle 'thinca/vim-quickruni'
NeoBundle 'davidhalter/jedi-vim' ,{'autoload' : {'filetype' : 'python'}}
NeoBundleLazy "lambdalisue/vim-pyenv", {
      \ "depends": ['davidhalter/jedi-vim'],
      \ "autoload": {
      \   "filetypes": ["python", "python3", "djangohtml"]
      \ }}
NeoBundle 'hynek/vim-python-pep8-indent',{'autoload' : {'filetype' : 'python'}}
NeoBundle 'jmcantrell/vim-virtualenv',{'autoload' : {'filetype' : 'python'}}

NeoBundle 'vim-jp/cpp-vim',{'autoload' : {'filetype' : 'cpp'}}
NeoBundle 'sudar/vim-arduino-syntax'


" neocomplete 
" ================================
" http://dackdive.hateblo.jp/entry/2014/08/13/130000
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplete.
let g:neocomplete#enable_at_startup = 1
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
" Set minimum syntax keyword length.
let g:neocomplete#sources#syntax#min_keyword_length = 3
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'
" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
  " For no inserting <CR> key.
  return pumvisible() ? neocomplete#close_popup() : "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()
" Close popup by <Space>.
inoremap <expr><Space> pumvisible() ? neocomplete#close_popup() :"\<Space>"


" vim-indent-guides
" ================================
let g:indent_guides_enable_on_vim_startup=1
set ts=2 sw=2 et
let g:indent_guides_start_level=2
let g:indent_guides_guide_size=1


" jedi-vim
" ================================
autocmd FileType python setlocal omnifunc=jedi#completions 
let g:jedi#force_py_version = 2  
let g:jedi#completions_enabled = 0 
let g:jedi#auto_vim_configuration = 0 
if !exists('g:neocomplete#force_omni_input_patterns') 
    let g:neocomplete#force_omni_input_patterns = {} 
endif 
" let g:neocomplete#force_omni_input_patterns.python = '\%([^. \t]\.\|^\ 
let g:neocomplete#force_omni_input_patterns.python = '\h\w*\|[^. \t]\.\w' 
" docstringは表示しない 
autocmd FileType python setlocal completeopt-=preview 


" cpp-vim
" ================================
"http://rhysd.hatenablog.com/entry/2013/12/10/233201
augroup cpp-path
  autocmd!
  autocmd FileType cpp setlocal path=.,/usr/include,/usr/local/include,/usr/lib/c++/v1
augroup END


" lightline-vim
" ================================
set laststatus=2
let g:lightline = {
\ 'colorscheme': 'wombat'
\ }
nmap <Space>m <Plug>(quickhl-manual-this)
xmap <Space>m <Plug>(quickhl-manual-this)
nmap <Space>M <Plug>(quickhl-manual-reset)
xmap <Space>M <Plug>(quickhl-manual-reset)


call neobundle#end()
