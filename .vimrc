"###############################################################################
"
" Package Mangement
"
"###############################################################################
" not vi
set nocompatible

" vundle
filetype off
set rtp+=~/.vim/bundle/vundle.vim
call vundle#begin()

" core plugins
Plugin 'gmarik/vundle.vim'
Plugin 'flazz/vim-colorschemes'

" main plugins
Plugin 'bling/vim-airline'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'godlygeek/tabular'
Plugin 'henrik/vim-indexed-search'
Plugin 'jeetsukumaran/vim-filebeagle'
Plugin 'kien/ctrlp.vim'
Plugin 'lokaltog/vim-easymotion'
Plugin 'ludovicchabant/vim-gutentags'
Plugin 'majutsushi/tagbar'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'rking/ag.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/syntastic'
Plugin 'sheerun/vim-polyglot'
Plugin 'sjl/gundo.vim'
Plugin 'szw/vim-maximizer'
Plugin 'thinca/vim-visualstar'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-dispatch'
Plugin 'tpope/vim-endwise'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" autocomplete
Plugin 'shougo/neocomplete'

" snippets
Plugin 'shougo/neosnippet'
Plugin 'shougo/neosnippet-snippets'

" investigate
" Plugin 'wellle/targets'
" Plugin 'jeetsukumaran/vim-markology'
" Plugin 'jeetsukumaran/vim-gazetteer'

" archive
" Plugin 'valloric/youcompleteme'
" Plugin 'sirver/ultisnips'
" Plugin 'honza/vim-snippets'
" Plugin 'tpope/vim-dispatch'

call vundle#end()
filetype plugin indent on

"###############################################################################
"
" Settings
"
"###############################################################################
" colorscheme desert
colorscheme solarized
let mapleader = ","
syntax on

" modify diff mode coloring
if &diff
    set diffopt+=iwhite
    syntax off
endif

set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set binary
set cmdheight=2
set complete-=i
set completeopt=menuone,preview
set equalalways
set expandtab
set fillchars+=stl:\ ,stlnc:\
set foldenable
set foldlevelstart=10
set foldmarker={,}
" set foldmethod=marker
set foldmethod=indent
set foldnestmax=3
set hidden
set history=10000
set hlsearch
set ignorecase
set incsearch
set infercase
set laststatus=2
set lazyredraw
set nowrap
set number
set numberwidth=4
set scrolljump=5
set scrolloff=3
set shiftwidth=4
set shortmess=atI
set showmode
set showmatch
set showtabline=2
set sidescroll=1
set sidescrolloff=15
set smartcase
set softtabstop=4
set splitright
" status line conflicts with Airline
" set statusline=%<%f\
" set statusline+=%w%h%m%r
" set statusline+=%{fugitive#statusline()}
" set statusline+=\ [%{&ff}/%Y]
" set statusline+=\ [%{getcwd()}]
" set statusline+=%=%-14.(%l,%c%V%)\ %p%%
set synmaxcol=1000 "
set t_Co=16
set t_ut=
set tabstop=4
set textwidth=0
set ttyfast
set virtualedit=onemore
set visualbell
set whichwrap=b,s,h,l,<,>,[,],~
set wildmenu
set wildmode=longest,list
set wrap linebreak textwidth=0

" backup/persistance settings
set backup
set backupdir=~/.vim/tmp/backup//
set backupskip=/tmp/*,/private/tmp/*"
set directory=~/.vim/tmp/swap//
" set nobackup
set noswapfile
set undodir=~/.vim/tmp/undo//
" set nowritebackup
set writebackup

" persist (g)undo tree between sessions
set undofile
set undolevels=100

" ignores
" NOTE: if you have a comma at the end of these lines, they'll fail.
set wildignore=.git,.hg,*.o,*.a,*.class,*.mo,*.la,*.so,*.obj,*.swp,*.jpg,*.png,*.xpm,*.gif,*.pyc,*.swf,*.egg,*.jar,*.dump,*.gem
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,solr/**,log/**,*.psd,*.PSD,.git/**,.gitkeep,.gems/**
set wildignore+=*.ico,*.ICO,backup/**,*.sql,*.dump,*.tmp,*.min.js,*.min.css
set wildignore+=*.png,*.PNG,*.JPG,*.jpg,*.JPEG,*.jpeg,*.GIF,*.gif,*.pdf,*.PDF,*.DS_STORE
set wildignore+=coverage/**,tmp/**,rdoc/**,*.BACKUP.*,*.BASE.*,*.LOCAL.*,*.REMOTE.*,.sass-cache/**,*/.bundle/*,*node_modules/*
let g:NERDTreeIgnore=['.DS_Store', '.git']

hi link ExtraWhitespace Error

"###############################################################################
"
" Plugins
"
"###############################################################################
" airline
if !exists("g:airline_symbols")
    let g:airline_symbols = {}
endif
let g:airline_theme="solarized"
" let g:airline_powerline_fonts=1
let g:airline#extensions#branch#empty_message  =  "no .git"
" let g:airline#extensions#whitespace#enabled    =  0
let g:airline#extensions#syntastic#enabled     =  1
let g:airline#extensions#tabline#enabled       =  1
let g:airline#extensions#tabline#tab_nr_type   =  1 " tab number
let g:airline#extensions#tabline#fnamecollapse =  1 " /a/m/model.rb
let g:airline#extensions#hunks#non_zero_only   =  1 " git gutter

" ctrlp
" let g:ctrlp_user_command = 'find %s -type f'
" if executable('/home/costrum/bin/ag')
set grepprg=ag\ --nogroup\ --nocolor\ --column
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
" endif
let g:ctrlp_clear_cache_on_exit = 0
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'
let g:ctrlp_switch_buffer = 'e'
" NOTE: If %s is not a directory that already exists, it'll fail, so I can't
" do something like split %s and pass it to xargs.
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_open_new_file = 'r'
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40,results:40'
let g:ctrlp_map = ''
let g:ctrlp_prompt_mappings = {
\ 'ToggleType(1)':        [''],
\ 'ToggleType(-1)':       [''],
\ 'PrtExit()':            ['<esc>', '<c-c>'],
\ 'AcceptSelection("h")': ['<H>'],
\ 'AcceptSelection("v")': ['<V>'],
\ 'PrtBS()':              ['<c-h>', '<bs>'],
\ 'PrtCurLeft()':         ['<c-b>'],
\ 'PrtCurRight()':        ['<c-f>'],
\ 'PrtClearCache()':      [','],
\ 'PrtExpandDir()':       [''],
\ 'PrtInsert("c")':       ['<c-p>'],
\ }

" NerdTree
let g:NERDTreeChDirMode=2
let g:NERDTreeAutoDeleteBuffer=1
let g:NERDTreeHijackNetrw = 0
let g:NERDTreeShowBookmarks = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeShowHidden = 1

" YouCompleteMe
"let g:ycm_key_detailed_diagnostics = ''
"let g:ycm_key_invoke_completion = ''
"let g:ycm_complete_in_strings=0

" tagbar
let g:tagbar_autofocus=1
let g:tagbar_compact=1
let g:tagbar_show_visibility=1

" surround
vmap s S
" Key: "-"
let g:surround_45 = "<% \r %>"
" Key: "="
let g:surround_61 = "<%= \r %>"
" Key: "``"
let g:surround_33 = "```\r```"

" ag
let g:agprg="/home/costrum/bin/ag --nogroup --column"

" neocomplete
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_camel_case = 1
let g:neocomplete#enable_smart_case = 1
" Default # of completions is 100, that's crazy.
let g:neocomplete#max_list = 10
" Set minimum syntax keyword length.
let g:neocomplete#auto_completion_start_length = 3
" Plugin key-mappings
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)
inoremap <expr><c-g> neocomplete#undo_completion()
inoremap <expr><c-l> neocomplete#complete_common_string()
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y> neocomplete#close_popup()
inoremap <expr><C-e> neocomplete#cancel_popup()
" This makes sure we use neocomplete completefunc instead of
" the one in rails.vim, otherwise this plugin will crap out.
let g:neocomplete#force_overwrite_completefunc = 1
" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'
" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif
" Tell Neosnippet about the other snippets
let g:neosnippet#snippets_directory='~/.vim/bundle/neosnippet-snippets'

" Easy-motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings
let g:EasyMotion_smartcase = 1

" Gundo
let g:gundo_close_on_revert = 1

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags ts=2 sts=2 sw=2
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete ts=2 sts=2 sw=2

"###############################################################################
" Mappings
"###############################################################################
" Use control space to esc out of any mode
nnoremap <c-space> <esc>:noh<cr>
vnoremap <c-space> <esc>gV
onoremap <c-space> <esc>
cnoremap <c-space> <C-c>
inoremap <c-space> <esc>`^
" terminal uses control @...
nnoremap <c-@> <esc>:noh<cr>
vnoremap <c-@> <esc>gV
onoremap <c-@> <esc>
cnoremap <c-@> <C-c>
inoremap <c-@> <esc>`^

map     e <Plug>(easymotion-sn)
noremap : ;
noremap ; :
noremap 0 g^
noremap ^ g0
noremap $ g$
noremap j gj
noremap k gk
noremap J 3j
noremap K 3k
nnoremap x "_x
nnoremap s :w<cr>
nnoremap S :sp<cr>
nnoremap q <nop>
nnoremap Q :q<cr>
nnoremap C :call ToggleQuickfix()<cr>

nnoremap th :tabp<cr>
nnoremap tl :tabn<cr>
noremap gv `[v`]
vnoremap < <gv
vnoremap > >gv

cnoremap %% <C-R>=expand('%:h').'/'<cr>

vnoremap <c-j> :join<cr>
vnoremap <c-y> "+y
noremap <c-p> "+p
set pastetoggle=<F10>
inoremap <c-p> <F10><C-r>+<F10>
inoremap <c-h> <bs>

cnoremap <c-p> <c-r>+
cnoremap <c-v> <c-r>"
cnoremap <c-a> <Home>
cnoremap <c-e> <End>
cnoremap <c-b> <Left>
cnoremap <c-f> <Right>
cnoremap <c-j> <t_kd>
cnoremap <c-k> <t_ku>

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-h> <c-w>h
nnoremap <c-l> <c-w>l

" Use sane regexes
" nnoremap <leader>/ /\v
" vnoremap <leader>/ /\v
"
" " Use :Subvert search
" nnoremap <leader>// :S /
" vnoremap <leader>// :S /
"
" " Use regular replace
" nnoremap <leader>s :%s /
" vnoremap <leader>s :%s /
"
" " Use :Subvert replace
" nnoremap <leader>S :%S /
" vnoremap <leader>S :%S /

nnoremap <space> :NERDTreeToggle<cr>
nnoremap <leader><space> <nop>
nnoremap <leader>. :NERDTreeFind<cr>
if exists(":Tabularize")
    nnoremap <leader>a= :Tab /=<CR>
    vnoremap <leader>a= :Tab /=<CR>
    nnoremap <leader>a: :Tab /:\zs<CR>
    vnoremap <leader>a: :Tab /:\zs<CR>
endif
nnoremap <leader>b :CtrlPBuffer<cr>
nnoremap <leader>e :CtrlP .<cr>
nnoremap <leader>g :TagbarToggle<CR>
nnoremap <leader>h :nohlsearch<CR>
nnoremap <leader>i <nop>
nnoremap <leader>ic :call clearmatches()<CR>:noh<CR>
nnoremap <silent> <leader>i1 :call HiInterestingWord(1)<cr>
nnoremap <silent> <leader>i2 :call HiInterestingWord(2)<cr>
nnoremap <silent> <leader>i3 :call HiInterestingWord(3)<cr>
nnoremap <silent> <leader>i4 :call HiInterestingWord(4)<cr>
nnoremap <silent> <leader>i5 :call HiInterestingWord(5)<cr>
nnoremap <silent> <leader>i6 :call HiInterestingWord(6)<cr>
nnoremap <leader>j <nop>
nnoremap <leader>m :MaximizerToggle<CR>
nnoremap <leader>n :call RenameFile()<cr>
nnoremap <leader>o <nop>
nnoremap <leader>p <nop>
nnoremap <leader>q :qall
nnoremap <silent> <leader>r :e!<cr>
nnoremap <silent> <leader>s <nop>
nnoremap <leader>t :CtrlPTag<CR>
" session management
" let g:session_directory = "~/.vim/session"
" let g:session_autoload = "no"
" let g:session_autosave = "no"
" let g:session_command_aliases = 1
" nnoremap <leader>so :OpenSession
" nnoremap <leader>ss :SaveSession
" nnoremap <leader>sd :DeleteSession<CR>
" nnoremap <leader>sc :CloseSession<CR>
nnoremap <leader>u :GundoToggle<cr>
nnoremap <leader>V :source ~/.vimrc<cr>
nnoremap <leader>v :e ~/.vimrc<cr>
nnoremap <leader>w <nop>
nnoremap <leader>x <nop>
nnoremap <leader>y <nop>
nnoremap <leader>z <nop>
nnoremap <leader><leader>s :Ag <Space>-G="*"<S-Left><Left>
nnoremap <leader><leader>c :Ag <Space>-G="*.(css\|scss)" app<S-Left><S-Left><Left>
nnoremap <leader><leader>j :Ag <Space>-G="*.(js\|coffee)" app<S-Left><S-Left><Left>
nnoremap <leader><leader>r :Ag <Space>-G="*.(rb\|rake)"<S-Left><Left>
nnoremap <leader><leader>t :Ag <Space>-G="*_spec.rb" spec<S-Left><S-Left><Left>
nnoremap <leader><leader>v :Ag <Space>-G="*.(erb\|slim)" app<S-Left><S-Left><Left>

xmap <leader>c  <Plug>Commentary
nmap <leader>c  <Plug>Commentary
omap <leader>c  <Plug>Commentary
nmap <leader>cc <Plug>CommentaryLine
nmap <leader>cg <Plug>ChangeCommentary
nmap <leader>cu <Plug>Commentary<Plug>Commentary

"###############################################################################
"
" Auto commands
"
"###############################################################################
augroup vimrcEx
  au!

  " Automatically create parent directory on save if directory doesn't exist
  au BufWritePre * if expand("<afile>")!~#'^\w\+:/' && !isdirectory(expand("%:h")) | execute "silent! !mkdir -p ".shellescape(expand('%:h'), 1) | redraw! | endif

  " Move to the last edited location
  au BufReadPost *
      \ if line("'\"") > 0 && line("'\"") <= line("$") |
      \     execute 'normal! g`"zvzz' |
      \ endif

  " Fugitive - remove when done
  au BufReadPost fugitive://* set bufhidden=delete

  au BufWinEnter,BufRead,BufNewFile Gemfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Rakefile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Guardfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Thorfile set ft=ruby
  au BufWinEnter,BufRead,BufNewFile Gruntfile set ft=javascript
  au BufWinEnter,BufRead,BufNewFile *.fdoc set ft=yaml
  au BufWinEnter,BufRead,BufNewFile *.md set ft=markdown
  au BufWinEnter,BufRead,BufNewFile *.slim set ft=slim

  au FileType * autocmd BufWritePre <buffer> StripWhitespace

  au FileType slim set commentstring=/\ %s
  au FileType python set sw=4 sts=4 et

  if did_filetype()
    finish
  endif
  if getline(1) =~# '^#!.*/bin/env\s\+node\>'
    setfiletype javascript
  endif
  if getline(1) =~# '^#!.*/bin/env\s\+ruby\>'
    setfiletype ruby
  endif
augroup END

"###############################################################################
"
" Functions
"
"###############################################################################
" Fix Visual Paste
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction

function! s:Repl()
    let s:restore_reg = @"
    return "p@=RestoreRegister()\<cr>"
endfunction
vnoremap <silent> <expr> p <sid>Repl()

function! RenameFile()
    let old_name = expand('%')
    let new_name = input('New file name: ', expand('%'), 'file')
    if new_name != '' && new_name != old_name
        exec ':saveas ' . new_name
        exec ':silent !rm ' . old_name
        redraw!
    endif
endfunction

function! GetBufferList()
  redir =>buflist
  silent! ls
  redir END
  return buflist
endfunction

function! BufferIsOpen(bufname)
  let buflist = GetBufferList()
  for bufnum in map(filter(split(buflist, '\n'), 'v:val =~ "'.a:bufname.'"'), 'str2nr(matchstr(v:val, "\\d\\+"))')
    if bufwinnr(bufnum) != -1
      return 1
    endif
  endfor
  return 0
endfunction

function! ToggleQuickfix()
  if BufferIsOpen("Quickfix List")
    cclose
  else
    copen
  endif
endfunction

" Visual Mode */# from Scrooloose
function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

" Text Highlighter = <leader>h[1-4]
function! HiInterestingWord(n)
    " Save our location.
    normal! mz
    " Yank the current word into the z register.
    normal! "zyiw
    " Calculate an arbitrary match ID.  Hopefully nothing else is using it.
    let mid = 86750 + a:n
    " Clear existing matches, but don't worry if they don't exist.
    silent! call matchdelete(mid)
    " Construct a literal pattern that has to match at boundaries.
    let pat = '\V\<' . escape(@z, '\') . '\>'
    " Actually match the words.
    call matchadd("InterestingWord" . a:n, pat, 1, mid)
    " Move back to our original location.
    normal! `z
endfunction

hi def InterestingWord1 guifg=#000000 ctermfg=16 guibg=#ffa724 ctermbg=214
hi def InterestingWord2 guifg=#000000 ctermfg=16 guibg=#aeee00 ctermbg=154
hi def InterestingWord3 guifg=#000000 ctermfg=16 guibg=#8cffba ctermbg=121
hi def InterestingWord4 guifg=#000000 ctermfg=16 guibg=#b88853 ctermbg=137
hi def InterestingWord5 guifg=#000000 ctermfg=16 guibg=#ff9eb8 ctermbg=211
hi def InterestingWord6 guifg=#000000 ctermfg=16 guibg=#ff2c4b ctermbg=195

highlight search ctermfg=white ctermbg=3423513

" better retab
fu! Retab()
  :retab
  :%s/\s\+$//
endfunction

