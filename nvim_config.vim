" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'gaalcaras/ncm-R'
Plug 'jalvesaq/Nvim-R'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
Plug 'tpope/markdown'
Plug 'maverickg/stan.vim'

" NERD tree will be loaded on the first invocation of NERDTreeToggle command
Plug 'scrooloose/nerdtree', { 'on': 'NERDTreeFocus' }

" Use syntax specified markdown  by leading with ```r
" https://vi.stackexchange.com/questions/23215/how-to-use-code-highlighting-and-checking-in-markdown
let g:markdown_fenced_languages = ['python', 'r']

" Enable NCM2 all the time
autocmd BufEnter R call ncm2#enable_for_buffer()

" Initialize plugin system
call plug#end()

" remap Alt- to <-
iabbrev – <-

" Use ctrl-[hjkl] to select the active split!
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" set my colorscheme
colo desert 

" set F12 to refresh the syntax
noremap <F12> <Esc>:syntax sync fromstart<CR>
inoremap <F12> <C-o>:syntax sync fromstart<CR>
	
" remapping the basic :: send line
" remapping selection :: send multiple lines
vmap <Space> <Plug>RDSendSelection
nmap <Space> <Plug>RDSendLine

" nerd tree Ctrl-N
map <C-n> :NERDTreeFocus<CR>

" press -- to have Nvim-R insert the assignment operator: <-
let R_assign_map = "--"

" mice are useful
set mouse=a

" show arguments for functions during omnicompletion
let R_show_args = 1

" Don't expand a dataframe to show columns by default
let R_objbr_opendf = 0

" lang server for R autocomplete
let g:LanguageClient_serverCommands = {
    \ 'r': ['R', '--slave', '-e', 'languageserver::run()'],
    \ }

" R output is highlighted with current colorscheme
let g:rout_follow_colorscheme = 1

" R commands in R output are highlighted
let g:Rout_more_colors = 1

" Set Tabs properly
set ts=2
set sw=2
set expandtab

" Don't align arguments with the last ( in R code
" taken from https://stackoverflow.com/questions/13597256/change-r-indentation-style-in-vim-with-vim-r-plugin
let r_indent_align_args = 0
