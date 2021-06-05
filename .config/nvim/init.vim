""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" auto-install vim-plug
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
endif

call plug#begin('~/.config/nvim/autoload/plugged')

    " File Explorer
    Plug 'preservim/nerdtree'
    
    " Auto pairs for '(' '[' '{'
    Plug 'jiangmiao/auto-pairs'

    Plug 'lervag/vimtex'
    Plug 'sheerun/vim-polyglot'
    Plug 'tpope/vim-fugitive'
    Plug 'tpope/vim-rhubarb'
    Plug 'psf/black', { 'branch': 'stable' }
    Plug 'pangloss/vim-javascript'

    Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install'  }
    Plug 'preservim/nerdcommenter'
    Plug 'kyoz/purify', { 'rtp': 'vim' }
    Plug 'gosukiwi/vim-atom-dark'
    Plug 'dracula/vim', { 'as': 'dracula' }
    Plug 'sakhnik/nvim-gdb', { 'do': ':!./install.sh' }

    " Fuzzy finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'

    " COC - autocompletion and linting
    " Install all extensions with
    " :CocInstall coc-json coc-rust-analyzer coc-eslint coc-prettier coc-tsserver coc-sh coc-pyright coc-clangd
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Rust language support
    Plug 'rust-lang/rust.vim'

    " Syntastic
    Plug 'vim-syntastic/syntastic'

    " Tagbar
    Plug 'preservim/tagbar'

    " Modern database interface for Vim
    Plug 'tpope/vim-dadbod'

    " Golang support
    Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

    "Plug 'vim-airline/vim-airline'
    
    "File type icons to Vim plugins
    Plug 'ryanoasis/vim-devicons'

    call plug#end()
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Global variables
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Custom commands
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! -nargs=0 Pret :CocCommand prettier.formatFile

command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(
    \ {'options': ['--layout=reverse'], 'source': 'fdfind --exclude "node_modules"',
    \ 'sink': 'tabedit'}), <bang>0)

command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \   'rg --column --line-number --no-heading --color=always --smart-case
  \   --glob "!node_modules"
  \   --glob "!locale/**"
  \   --glob "!docs/**"
  \   --glob "!corporate/**"
  \   --glob "!frontend_tests/**"
  \   --glob "!zerver/migrations/**"
  \   --glob "!zerver/tests/**"
  \   --glob "!templates/**"
  \   --type-not md
  \   --type-not svg
  \   -- '.shellescape(<q-args>), 1,
  \   fzf#vim#with_preview(), <bang>0)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

"" Theme
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
    set termguicolors
endif

" Change cursor back to normal
augroup RestoreCursorShapeOnExit
    autocmd!
    autocmd VimLeave * set guicursor=a:ver25 " a:hor20 for underscore cursor
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""
" For colorscheme
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
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
filetype plugin indent on
hi Comment cterm=italic
hi Normal     ctermbg=NONE guibg=NONE
hi LineNr     ctermbg=NONE guibg=NONE
hi SignColumn ctermbg=NONE guibg=NONE
hi Comment guifg=#5C6370 ctermfg=59

" Theme
"colorscheme purify
colorscheme dracula
set background=dark

" Line length for Black formatter in python.
let g:black_linelength=100
""""""""""""""""""""""""""""""""""""""""""""""""""

" set leader key
let mapleader = ","
set timeoutlen=10000 " Set timeout length to 5000 ms
let g:loaded_matchparen=1
syntax enable                           " Enables syntax highlighing
set hidden                              " Required to keep multiple buffers open
set encoding=utf-8                      " The encoding displayed
set pumheight=10                        " Makes popup menu smaller
set fileencoding=utf-8                  " The encoding written to file
set ruler              			        " Show the cursor position all the time
set cmdheight=2                         " More space for displaying messages
set iskeyword+=-                      	" treat dash separated words as a word text object"
set mouse=a                             " Enable your mouse
set splitbelow                          " Horizontal splits will automatically be below
set splitright                          " Vertical splits will automatically be to the right
set t_Co=256                            " Support 256 colors
set conceallevel=0                      " So that I can see `` in markdown files
set tabstop=4                           " Insert 4 spaces for a tab
set shiftwidth=4                        " Change the number of space characters inserted for indentation
set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
set expandtab                           " Converts tabs to spaces
set smartindent                         " Makes indenting smart
set autoindent                          " Good auto indent
set laststatus=0                        " Always display the status line
set number                              " Line numbers
set showtabline=2                       " Always show tabs
set noshowmode                          " We don't need to see things like -- INSERT -- anymore
set nobackup                            " This is recommended by coc
set nowritebackup                       " This is recommended by coc
set updatetime=300                      " Faster completion
set timeoutlen=500                      " By default timeoutlen is 1000 ms
set clipboard=unnamedplus
set formatoptions-=cro                  " Stop newline continution of comments
set autochdir                           " Your working directory will always be the same as your working directory
set cmdheight=1                         " Removes the extra statusline below the command statusline

au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vim alternatively you can run :source $MYVIMRC

cmap w!! w !sudo tee %
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""""" Mappings """""""""""""""""""""""""""""""""""
function Format()
    let l:filename = expand('%:t')
    :execute "!clang-format -i --style=file --fallback-style=google " . filename
endfunction

function Run()
    let l:filename = expand('%:t')
    let l:filename_without_extension = expand('%:r')
    let l:output_file = join(["./", filename_without_extension, ".out"], "")
    
    if &filetype ==# "cpp"
        :execute "!g++ -DGANPA -Wall -Wextra -pedantic -std=c++17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wduplicated-cond -Wcast-qual -Wcast-align -o" output_file filename "&&" output_file "< input"

    elseif &filetype ==# "c"
        :execute "!gcc -DGANPA -Wall -Wextra -pedantic -std=c17 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wshift-overflow=2 -Wduplicated-cond -Wcast-qual -Wcast-align -o" output_file filename "&&" output_file "< input"

    elseif &filetype ==# "rust"
        :execute "!rustc --edition=2018 -O --verbose -o" output_file filename "&&" output_file

    elseif &filetype ==# "python"
        :execute "!python3 " . filename

    elseif &filetype ==# "javascript"
        :execute "!node " . filename
    endif
endfunction

"map <C-b> :w <bar> call Run()<CR>
map <C-b> :call Run()<CR>

" NERDTree mappings
map <C-n> :NERDTreeToggle<CR>

" Markdown preview
map <C-m> <Plug>MarkdownPreviewToggle

" Better nav for omnicomplete
inoremap <expr> <c-j> ("\<C-n>")
inoremap <expr> <c-k> ("\<C-p>")

" Use alt + hjkl to resize windows
nnoremap <M-j>    :resize -2<CR>
nnoremap <M-k>    :resize +2<CR>
nnoremap <M-h>    :vertical resize -2<CR>
nnoremap <M-l>    :vertical resize +2<CR>

" Easy CAPS
inoremap <c-u> <ESC>viwUi
nnoremap <c-u> viwU<Esc>

" TAB in general mode will move to text buffer
nnoremap <TAB> :bnext<CR>
" SHIFT-TAB will go back
nnoremap <S-TAB> :bprevious<CR>

" Alternate way to quit
noremap <C-c> :q!<CR>
" Alternate way to save
noremap <C-s> :w<CR>
" Alternate way to save and quit
nnoremap <C-q> :wq!<CR>

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

" Better tabbing
vnoremap < <gv
vnoremap > >gv

" Better window navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

nnoremap <Leader>o o<Esc>^Da
nnoremap <Leader>O O<Esc>^Da

" FZF shortcuts
nnoremap <C-p> :Files<CR>
nnoremap <C-t> :Buffers<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Exit Vim if NERDTree is the only window left.
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
    \ quit | endif
let g:NERDTreeWinSize=26
let g:NERDTreeShowHidden=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader key mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <silent> <Leader>f :call Format()<CR>

" Hide search highlighs
nmap <Leader>h :noh<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid, when inside an event handler
" (happens when dropping a file on gvim) and for a commit message (it's
" likely a different one than last time).
autocmd BufReadPost *
  \ if line("'\"") >= 1 && line("'\"") <= line("$") && &ft !~# 'commit'
  \ |   exe "normal! g`\""
  \ | endif



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCustomDelimiters = {
            \ 'c': { 'left': '// ' },
            \ }

" FZF
if exists('$TMUX')
  let g:fzf_layout = { 'tmux': '-p90%,90%' }
else
  let g:fzf_layout = { 'window': { 'width': 1.0, 'height': 0.9 } }
endif


" Syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1

" Syntastic checkers
let g:syntastic_python_checkers = ['flake8']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_cpp_checkers = ['clang-tidy']

" Additional arguments to a checker
let g:syntastic_python_flake8_args = "--ignore=E501"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugin remaps
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDCommenter
nmap <C-_> <plug>NERDCommenterToggle
" To remap in NERDCommenter, map the original command to something else. 
nmap <leader>cc <plug>NERDCommenterToggle
nmap <leader>cq <plug>NERDCommenterComment


" COC
nmap <silent> <Leader>e <Plug>(coc-codeaction-cursor)
nmap <silent> <Leader>d <Plug>(coc-definition)

" Format files
nnoremap <silent> <C-f> :call CocActionAsync('format')<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
