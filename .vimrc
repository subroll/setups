"----[ start plugins ]-------------------------------------
call plug#begin('~/.vim/plugged')

" theme
Plug 'dracula/vim', { 'as': 'dracula' }

" ui 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" git
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'

" nerd tree 
Plug 'scrooloose/nerdtree'

" git in nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin'

" editor plugin
Plug 'Raimondi/delimitMate' "automatically close of quotes, parenthesis, brackets, etc.
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } " autocomplete
else
  Plug 'Shougo/deoplete.nvim' " autocomplete
  Plug 'roxma/nvim-yarp' " remote plugin
  Plug 'roxma/vim-hug-neovim-rpc' " rpc
endif
Plug 'ervandew/supertab'
Plug 'SirVer/ultisnips'

" language plugin
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'deoplete-plugins/deoplete-go', { 'do': 'make'}
Plug 'plasticboy/vim-markdown', { 'for': 'markdown' } | Plug 'davinche/godown-vim'

" initialize plugin system
call plug#end()

"----[ end plugins ]---------------------------------------

"----[ general settings ]----------------------------------
syntax on
set title relativenumber
set ignorecase smartcase
set encoding=utf-8 nobomb
set tabstop=4 shiftwidth=4 expandtab
set nobackup noswapfile nowritebackup nocompatible
set autoindent smartindent
set updatetime=500 timeoutlen=1000 ttimeoutlen=0
set balloondelay=250
set signcolumn=yes
set backspace=2
set list
set listchars=tab:\|\ ,trail:·
set completeopt-=preview
colorscheme dracula
filetype plugin on
filetype indent on
" if has("patch-8.1.1904")
"   set completeopt+=popup
"   set completepopup=align:menu,border:off,highlight:Pmenu
" endif

" keep cursor in center of screen
set scrolloff=40 showmode showcmd hidden wildmode=list:longest

"----[ delimitMate settings ]------------------------------
let delimitMate_expand_cr = 1

"----[ airline settings ]----------------------------------
let g:airline#extensions#tabline#enabled = 1
" let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
" let g:airline_left_sep = '»'
" let g:airline_left_sep = '▶'
" let g:airline_right_sep = '«'
" let g:airline_right_sep = '◀'
" let g:airline_symbols.linenr = '␊'
" let g:airline_symbols.linenr = '␤'
" let g:airline_symbols.linenr = '¶'
" let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
" let g:airline_symbols.paste = 'Þ'
" let g:airline_symbols.paste = '∥'
" let g:airline_symbols.whitespace = 'Ξ'
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
let g:airline_theme='dracula'

"----[ deoplete settings ]---------------------------------
let g:deoplete#enable_at_startup = 1
let g:deoplete#sources#go#gocode_binary = $GOPATH.'/bin/gocode'
call deoplete#custom#option({
\ 'auto_complete_delay': 0,
\ 'auto_refresh_delay': 10,
\})

"----[ git gutter settings ]-------------------------------
highlight GitGutterAdd    guifg=#009900 guibg=NONE ctermfg=2 ctermbg=NONE
highlight GitGutterChange guifg=#bbbb00 guibg=NONE ctermfg=3 ctermbg=NONE
highlight GitGutterDelete guifg=#ff2222 guibg=NONE ctermfg=1 ctermbg=NONE

"----[ vim-go settings ]-----------------------------------
let g:go_bin_path = $GOPATH.'/bin'
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_list_type = 'quickfix'
let g:go_auto_sameids = 1
let g:go_auto_type_info = 1
let g:go_metalinter_autosave = 1
let g:go_highlight_functions = 1
let g:go_gocode_propose_source = 1
let g:go_gocode_unimported_packages = 1
" let g:go_metalinter_autosave_enabled = ['vet', 'golint', 'errcheck']
autocmd BufNewFile,BufRead *.go setlocal noexpandtab tabstop=4 shiftwidth=4

"----[ supertab settings ]---------------------------------
let g:SuperTabDefaultCompletionType = '<c-n>'

"----[ markdown settings ]---------------------------------
let g:vim_markdown_conceal = 0
let g:vim_markdown_folding_disabled = 1

"----[ godown settings ]-----------------------------------
let g:godown_autorun = 1
let g:godown_port = 7331

"----[ key mappings ]--------------------------------------
" map : to ; in normal mode to aviod pressing SHIFT
nnoremap ; :

" NERDTree toggle
nnoremap <C-g> :NERDTreeToggle<CR>

" Ultisnips
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
