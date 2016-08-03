" VIM CONF FILE
" Please take care of me.
" Started on July 19, 2015
" 
" 


" VIM Global Settings
syntax enable
set nocompatible

" Bundle
" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
" call vundle#begin()
" Bundle 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
" call vundle#end()
filetype plugin indent on    " required


" Adding ignore.vim
" Ignore file regex for various plugins
source ~/.vim/ignore.vim

" Adding Pathogen
" pathogen is a plugin and runtime manipulator
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" This unsets the "last search pattern" register by hitting return
" After your search, hit return and it will clear the search highlighting
nnoremap <CR> :noh<CR><CR>

" Speed up response to ESC key
set notimeout
set ttimeout
set timeoutlen=100

" Auto-Continue Commenting
set formatoptions+=cro

" Enable the slate theme for vim
" located in 
" /usr/share/vim/vim74/colors/slate.vim
colorscheme slate


" Sets tabbing appropriately. 
" Which is to tab with a 4-space wide
" single character.
set tabstop=4
set softtabstop=0
set shiftwidth=4
set expandtab
set smarttab
set autoindent


" Comments blocks of code
" Allows you to type ,cc and ,cu to
" comment in vim according to the environment
autocmd FileType c,cpp,java,scala let b:comment_leader = '\/\/ '
autocmd FileType js               let b:comment_leader = '\/\/ '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" Installing Powerline for Vim
set rtp+=/Users/ctesta/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
set nocompatible
set t_Co=256
let g:minBufExplForceSyntaxEnable = 1
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
if ! has('gui_running')
   set ttimeoutlen=10
   augroup FastEscape
      autocmd!
      au InsertEnter * set timeoutlen=0
      au InsertLeave * set timeoutlen=1000
   augroup END
endif
set laststatus=2 " Always display the statusline in all windows
set guifont=Inconsolata\ for\ Powerline:h14
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" General key remappings:
" Maps H and L to start and end of row
map H ^
map L $

" More natural split opening
set splitbelow
set splitright

" Delete key should act like it's supposed to! 
set backspace=2
