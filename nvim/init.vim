set number
set nocompatible
set hidden
set linebreak

setlocal spell
set spelllang=nl,en_gb
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

"Plugins
call plug#begin('~/AppData/Local/nvim/plugged')

Plug 'joshdick/onedark.vim'
Plug 'sheerun/vim-polyglot'
Plug 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

Plug 'itchyny/lightline.vim'
Plug 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_math = 1

Plug   'KeitaNakamura/tex-conceal.vim', {'for': 'markdown'}
set conceallevel=2
let g:tex_conceal = "abgm"

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }
Plug 'ferrine/md-img-paste.vim'
autocmd FileType markdown nmap <buffer><silent> <leader>p :call mdip#MarkdownClipboardImage()<CR>
" there are some defaults for image directory and image name, you can change them
" let g:mdip_imgdir = 'img'
" let g:mdip_imgname = 'image'

call plug#end()

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

syntax on
colorscheme onedark
