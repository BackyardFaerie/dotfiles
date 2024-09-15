source $VIMRUNTIME/defaults.vim

"Highlight Searched Text
set hlsearch

"Highlight Search Results as They are Typed
set incsearch

"Case Sensitive Search
set noignorecase

"Case Sensitive Search Only When Search Contains At Least One Capital Letter
set smartcase

"Disable Saving Files Before Changing to Another One
set noautowrite

"Syntax Highlighting
syntax on

"Set Syntax Highlighting Theme
colorscheme pablo

"Show Hybrid Line Numbers
set number

augroup numtoggle
	autocmd!
	autocmd BufEnter,FocusGained,InsertLeave,WinEnter * if &nu && mode() != "i" | set rnu | endif
	autocmd BufLeave,FocusLost,InsertEnter,WinLeave * if &nu | set nornu | endif
augroup END

"Set Title to filename
set titlestring=%f
set title

"Display Cursor Position
set ruler

"Confirm for Actions e.g Quit without Write
set confirm

"Enable Spellchecking
set spell

"Highlight Cursor's Current Line
set cursorline

"Swap j and k for navigation (Commented out because after using it for a bit
"it got confusing and was cringe)
"noremap k j|noremap <C-w>k <C-w>j|noremap <C-w><C-k> <C-w>j
"noremap j k|noremap <C-w>j <C-w>k|noremap <C-w><C-j> <C-w>k

set foldmethod=manual
nnoremap <space> za

call plug#begin()

Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'vimwiki/vimwiki'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }

call plug#end()

syntax enable
filetype plugin indent on

set nocompatible

"Vimwiki Markdown Enable
let g:vimwiki_list = [{'path': '~/vimwiki/',
			\ 'syntax': 'markdown', 'ext': '.wiki'}]

"I Cursor in Insert Mode
    let &t_SI = "\e[6 q" " Vertical bar in insert mode
    let &t_EI = "\e[2 q" " Block in normal mode
