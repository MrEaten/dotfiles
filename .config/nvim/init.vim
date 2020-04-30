""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" LOAD PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

    Plug 'drewtempelmeyer/palenight.vim'
	Plug 'jackguo380/vim-lsp-cxx-highlight'
	Plug 'lazywei/vim-matlab'
    Plug 'terryma/vim-multiple-cursors'
    Plug 'lervag/vimtex' 
    Plug 'MortenStabenau/matlab-vim'
    Plug 'scrooloose/nerdtree'
    Plug 'ryanoasis/vim-devicons'
    Plug 'christoomey/vim-tmux-navigator'
    Plug 'adelarsq/vim-matchit'
    Plug 'easymotion/vim-easymotion'
    Plug 'Mizux/vim-colorschemes'
    Plug 'morhetz/gruvbox'
	Plug 'nathanaelkane/vim-indent-guides'
	Plug 'kien/rainbow_parentheses.vim'
	Plug 'mhinz/vim-startify'
	Plug 'itchyny/lightline.vim'
	Plug 'ap/vim-css-color'
	Plug 'francoiscabrol/ranger.vim'
	Plug 'rbgrouleff/bclose.vim'
	Plug 'edkolev/tmuxline.vim'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
	Plug 'neoclide/coc-vimtex'
	Plug 'junegunn/fzf.vim'
	Plug 'preservim/nerdcommenter'

call plug#end()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" BASICS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set leader key to space
:let mapleader=(' ')

" set smartcase search
" if Upper-Case letters are used in search the search is case sensitive
" otherwise it is not
set smartcase

"set nocompatible with old-school vi
set nocompatible

" set textwidth marker
set textwidth=80
set colorcolumn=+1 

" encoding 
set encoding=utf-8

" activate mouse
set mouse=a

" define tab as 4 spaces and auto indent
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
" set expandtab
autocmd FileType py set expandtab

" setup linenumbering
:set number 
:set relativenumber 


" wildmode / autocomplete 
set wildmode=longest,list,full

" set statusline to always on
set laststatus=2
" format statusline 
" replaced by lightline
" set statusline=\ %f%m%r%h%w\ %=%({%{&ff}\|%{(&fenc==\"\"?&enc:&fenc).((exists(\"+bomb\")\ &&\ &bomb)?\",B\":\"\")}%k\|%Y}%)\ %([%l,%v][%p%%]\ %)

" set split to open to the right and below
set splitbelow splitright

" file search
set path+=/usr/include/,**
set wildmenu

" I forgot what these do
tab sball
set switchbuf=usetab,newtab

" set ctags
set tags+=/usr/include/tags,/usr/local/tags

" set colorscheme
" use dark version of gruvbox
set background=dark
" use 256 colors
set t_Co=256
" set colorscheme, requires gruvbox to be installed
colorscheme gruvbox
" no idea what this is for
hi Normal guibg=NONE ctermbg=NONE
" check if terminal supports colorschem
if (has("termguicolors"))
  set termguicolors
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" KEYBINDINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" move between splits
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>wh <C-w>h
nnoremap <leader>wj <C-w>j
nnoremap <leader>wk <C-w>k
nnoremap <leader>wl <C-w>l
" move splits
nnoremap <leader>wH <C-w>H
nnoremap <leader>wJ <C-w>J
nnoremap <leader>wK <C-w>K
nnoremap <leader>wL <C-w>L
" resize splits
" equalize
nnoremap <leader>w= <C-w>=
" widen horizontal
nnoremap <leader>w\| <C-w>\|
" widen vertical
nnoremap <leader>w_ <C-w>_
" rotate splits
nnoremap <leader>wr <C-w>r
" switch splits
nnoremap <leader>wx <C-w>x
" move split to new tab page
nnoremap <leader>wT <C-w>T

" yank, cut and copy with standard bindings (in V-Mode)
vnoremap <C-c> "+y
vnoremap <C-x> "+d
map <C-p> "+P

" General shortcuts
" new tab
nnoremap <leader>tt :tabe<CR>
nnoremap <leader>tn :tabe<CR>
" new vertical split
nnoremap <leader>wv :vs<CR>
" new horizontal split
nnoremap <leader>ws :sp<CR>
" NERDTREE explorer
nnoremap <leader>n :NERDTreeToggleVCS<CR>
" close frame
nnoremap <leader>wq :q<CR>

" setup spellchecking
map <F6> :set nospell<CR>
map <F7> :setlocal spell spelllang=de_de<CR> 
map <F8> :setlocal spell spelllang=en_gb<CR> 


" navigate with double leader (,) 
inoremap ,, <Esc>/<++><Enter>"_c4l
vnoremap ,, <Esc>/<++><Enter>"_c4l
map ,, <Esc>/<++><Enter>"_c4l

" change working directory to current file directory
nnoremap <leader>cd <ESC>:cd %:p:h<CR>

" open ranger file explorer
nnoremap <leader>fe <ESC>:ranger<CR>
" search for file
" below working directory
nnoremap <leader>ff <ESC>:Files<CR>
" below home directory
nnoremap <leader>. <ESC>:Files ~<CR>
" below root
nnoremap <leader>fr <ESC>:Files /<CR>

nnoremap <leader>fp <ESC>:Files <c-r>=expand("/")<CR>
nnoremap <leader>fc <ESC>:Files ~/.config/<CR>
nnoremap <leader>fl <ESC>:Files ~/.local/<CR>
nnoremap <leader>ls <ESC>:Buffers<CR>
nnoremap <leader>b/ <ESC>:Lines<CR>
nnoremap <leader>/ <ESC>:BLines<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" PLUGINS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

  let g:lightline = {
        \ 'component_function': {
        \   'filetype': 'MyFiletype',
        \   'fileformat': 'MyFileformat',
        \ }
        \ }
  
  function! MyFiletype()
    return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : 'no ft') : ''
  endfunction
  
  function! MyFileformat()
    return winwidth(0) > 70 ? (&fileformat . ' ' . WebDevIconsGetFileFormatSymbol()) : ''
  endfunction

" disable standard ranger keybindings
let g:ranger_map_keys = 0

" Set lightline theme (vim statusbar)
let g:lightline = {
      \ 'colorscheme': 'gruvbox',
      \ }
" Set tmux statusbar to lightline theme
" execute command 'Tmuxline lightline tmux'
" and 'TmuxlineSnapshot filename'
" then source in tmux.conf
let g:tmuxline_separators = {
    \ 'left' : '',
    \ 'left_alt': '>',
    \ 'right' : '',
    \ 'right_alt' : '<',
    \ 'space' : ' '}


" set nerdtree window size
let NERDTreeWinSize=22 

" vimtex setup
let g:tex_flavor="latex"
" use zathura pdf viewer
let g:vimtex_view_method="zathura"
" use neovim-remote for backward call from zathura
let g:vimtex_compiler_progname = 'nvr'

" activate Indent Guides
let g:indent_guides_enable_on_vim_startup = 1

" CtrlP config
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_show_hidden = 1

" easymotion leader rebinding
" map <Leader>e <Plug>(easymotion-prefix)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" FILETYPES
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" set syntax of pdf_tex files (created by inkscape export to pdf with latex
autocmd BufNewFile,BufRead *.pdf_tex set syntax=tex

" snippets for latex
" begin / end environment
autocmd FileType tex inoremap ,be \begin{multiple_cursors_point}<Enter><++><Enter>\end{multiple_cursors_point}<Enter><Esc>3k<Esc>:.,.+2 MultipleCursorsFind multiple_cursors_point<Enter>c
" fraction
autocmd FileType tex inoremap ,fra \frac{<++>}{<++>} <++><Esc>0<Esc>/<++><Enter>"_c4l

" R Mardown shortcuts
" compile and open Rmarkdown to pdf
autocmd Filetype rmd map <F5> :w<enter>:!echo<space>"require(rmarkdown);<space>render('<c-r>%')"<space>\|<space>R<space>--vanilla<enter>

autocmd FileType json syntax match Comment +\/\/.\+$+
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""" Conqueror of Completion (CoC) Setup
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-clangd',
  \ 'coc-python',
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ ]

" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300


" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <leader>[g <Plug>(coc-diagnostic-prev)
nmap <leader>]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>cf  <Plug>(coc-format-selected)
nmap <leader>cf  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Introduce function text object
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

