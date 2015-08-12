" VIM CONF FILE
" Please take care of me.
" Started on July 19, 2015


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

" Adding Pathogen
" pathogen is a plugin and runtime manipulator
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Adding keybinding for NERDTree
" https://github.com/scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>

" This unsets the "last search pattern" register by hitting return
" After your search, hit return and it will clear the search highlighting
nnoremap <CR> :noh<CR><CR>

" Mapping ,y to saving selection to a file based copy/paste board
" and ,p to pasting from that and clearing the file
vmap <silent> ,y y:new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
nmap <silent> ,y :new<CR>:call setline(1,getregtype())<CR>o<Esc>P:wq! ~/reg.txt<CR>
map <silent> ,p :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>p
map <silent> ,P :sview ~/reg.txt<CR>"zdddG:q!<CR>:call setreg('"', @", @z)<CR>P




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


" Comments blocks of code
" Allows you to type ,cc and ,cu to
" comment in vim according to the environment
autocmd FileType c,cpp,java,scala let b:comment_leader = '// '
autocmd FileType sh,ruby,python   let b:comment_leader = '# '
autocmd FileType conf,fstab       let b:comment_leader = '# '
autocmd FileType tex              let b:comment_leader = '% '
autocmd FileType mail             let b:comment_leader = '> '
autocmd FileType vim              let b:comment_leader = '" '
noremap <silent> ,cc :<C-B>silent <C-E>s/^/<C-R>=escape(b:comment_leader,'\/')<CR>/<CR>:nohlsearch<CR>
noremap <silent> ,cu :<C-B>silent <C-E>s/^\V<C-R>=escape(b:comment_leader,'\/')<CR>//e<CR>:nohlsearch<CR>


" Installing Powerline
" set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
" set encoding=utf-8
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8
" source /usr/local/lib/python2.7/site-packages/powerline/bindings/vim/plugin/powerline.vim
" set laststatus=2

" set guifont=Inconsolata\ for\ Powerline:h15
" let g:Powerline_symbols = 'fancy'
" set encoding=utf-8
" set t_Co=256
" set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
" set termencoding=utf-8
"
set rtp+=/Users/ctesta/Library/Python/2.7/lib/python/site-packages/powerline/bindings/vim
 
" These lines setup the environment to show graphics and colors correctly.
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
