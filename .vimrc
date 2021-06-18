" Ben award vimrc
" https://gist.github.com/benawad/b768f5a5bbd92c8baabd363b7e79786f

" Specify a directory for plugins
:set autoindent
:set smartindent
:set autoread
:set number
:set autowriteall
:set showcmd

" path config
:set path+=**
:set wildmenu
:set wildignore+=**/node_modules/** 
:set wildignore+=**/dist/**
:set tabstop=2
:set termguicolors
:set bg=dark
:syntax on

"
" split config
:set splitbelow splitright

" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'neoclide/coc.nvim' , { 'branch' : 'release' } " for code completion
Plug 'pangloss/vim-javascript'    " JavaScript support
Plug 'leafgarland/typescript-vim' " TypeScript syntax
Plug 'jparise/vim-graphql'        " GraphQL syntax
Plug 'ryanoasis/vim-devicons'
Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
Plug 'sbdchd/neoformat'
Plug 'vim-airline/vim-airline'

" svelte plugins
Plug 'evanleck/vim-svelte'
Plug 'codechips/coc-svelte', {'do': 'npm install'}
Plug 'Shougo/context_filetype.vim'

" theme
Plug 'morhetz/gruvbox'

Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'peitalin/vim-jsx-typescript'

call plug#end()

" vim-airline for buffer names
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
nnoremap <Leader>[ :bprevious<CR>
nnoremap <Leader>] :bnext<CR>
inoremap <Leader>s <Esc>:w<CR> 
nnoremap <Leader>s <Esc>:w<CR>

" inoremap <c-s> <c-o>:Update<CR>

colorscheme gruvbox
let g:gruvbox_termcolors=16

" prettier config
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" coc.nvim server
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-pairs',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]


" KEY MAPPING

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" coc-explorer keybinding
nmap <space>e :CocCommand explorer<CR>

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" context_filetype config
if !exists('g:context_filetype#same_filetypes')
  let g:context_filetype#filetypes = {}
endif

let g:context_filetype#filetypes.svelte =
\ [
\   {'filetype' : 'javascript', 'start' : '<script>', 'end' : '</script>'},
\   {
\     'filetype': 'typescript',
\     'start': '<script\%( [^>]*\)\? \%(ts\|lang="\%(ts\|typescript\)"\)\%( [^>]*\)\?>',
\     'end': '',
\   },
\   {'filetype' : 'css', 'start' : '<style \?.*>', 'end' : '</style>'},
\ ]

let g:ft = ''

" lint and fix current file
noremap <leader>lf :make --fix % <cr>:cwindow<cr>:redraw!<cr>

" set filetypes as typescriptreact
autocmd BufNewFile,BufRead *.tsx,*.jsx set filetype=typescriptreact

" dark red
hi tsxTagName guifg=#E06C75
hi tsxComponentName guifg=#E06C75
hi tsxCloseComponentName guifg=#E06C75

" orange
hi tsxCloseString guifg=#F99575
hi tsxCloseTag guifg=#F99575
hi tsxCloseTagName guifg=#F99575
hi tsxAttributeBraces guifg=#F99575
hi tsxEqual guifg=#F99575

" yellow
hi tsxAttrib guifg=#F8BD7F cterm=italic
