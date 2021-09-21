" Bootstrap vim-plug
let data_dir = has('nvim') ? stdpath('config') : '~/AppData/Local/nvim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin('~/AppData/Local/nvim/plugged')

" Text
Plug 'sheerun/vim-polyglot'            " On-demand language packs
Plug 'plasticboy/vim-markdown'         " Markdown addons
let g:vim_markdown_folding_disabled = 1
"let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1

Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'markdown'} " Better LaTeX conceal
set conceallevel=2
let g:tex_nospell = 1 " Disable spellcheck inside math
let g:tex_conceal = "abgm"

Plug 'GregBowyer/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'branch': 'katex' } " Preview markdown in browser
let g:mkdp_auto_start = 1

Plug 'cohama/lexima.vim'
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'

Plug 'ferrine/md-img-paste.vim' " Paste inline images from clipboard
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
"" let g:mdip_imgdir = 'img'
"" let g:mdip_imgname = 'image'

" Appearance
Plug 'joshdick/onedark.vim'            " Onedark theme
Plug 'itchyny/lightline.vim'           " Themed status line

" Snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
let g:coc_snippet_prev = '<s-tab>'








call plug#end()