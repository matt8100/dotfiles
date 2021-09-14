" General
set hidden                   " keep multiple buffers open

" Editing
set mouse=a                  " enable mouse in all modes
set expandtab                " convert tab to spaces
set tabstop=4                " set tab width to 4 spaces
set softtabstop=4            " set tab width to 4 spaces
set shiftwidth=4             " set indent size on on newline
set smarttab                 " use tab behaviour on spaces
set smartindent              " enable contextual indenting

" Spellcheck
set spell                    " enable spellcheck
set spelllang=en             " set spellcheck language
inoremap <C-l> <c-g>u<Esc>[s1z=`]a<c-g>u

" Visual
set encoding=UTF-8           " set character set
set number                   " enable line numbers
set linebreak                " wrap by word
set cursorline               " highlight current cursor line

" Theme
" Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
if (empty($TMUX))
  if (has("nvim"))
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  if (has("termguicolors"))
    set termguicolors
  endif
endif
