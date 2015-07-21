" VIM CONF FILE
" Please take care of me.
" Started on July 19, 2015


" VIM Global Settings
syntax enable
filetype plugin indent on


" Adding Pathogen
" pathogen is a plugin and runtime manipulator
" https://github.com/tpope/vim-pathogen
execute pathogen#infect()

" Adding keybinding for NERDTree
" https://github.com/scrooloose/nerdtree
map <C-n> :NERDTreeToggle<CR>


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

