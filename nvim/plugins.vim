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
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1

Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'markdown'} " Better LaTeX conceal
set conceallevel=2
let g:tex_conceal = "abgm"

Plug 'GregBowyer/markdown-preview.nvim', { 'do': 'cd app && yarn install', 'branch': 'katex' } " Paste inline images from clipboard

Plug 'jiangmiao/auto-pairs'
Plug 'easymotion/vim-easymotion'
Plug 'unblevable/quick-scope'

Plug 'ferrine/md-img-paste.vim'
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
"" let g:mdip_imgdir = 'img'
"" let g:mdip_imgname = 'image'

" Appearance
Plug 'joshdick/onedark.vim'            " Onedark theme
Plug 'itchyny/lightline.vim'           " Themed status line

" Snippets
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'







call plug#end()