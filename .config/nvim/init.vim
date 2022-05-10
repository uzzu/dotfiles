" Appearance
"colorscheme molokai
set t_Co=256
syntax on
set title
set number
set ruler
set wrap
set showcmd
set showmatch
set scrolloff=10
set wildmenu
set laststatus=2
set statusline=%<%F\ %m%r%h%w%y%{'['.(&fenc!=''?&fenc:&enc).(&bomb?':BOM':'').']['.&ff.']'}%=%4v(0x%04.4B)\ %l/%L(%P)
set list
set listchars=tab:>-,extends:<,trail:- ",eol:<
highlight JpSpace cterm=underline ctermfg=Blue guifg=Blue
autocmd BufRead,BufNew * match JpSpace /＿/

" Encoding
set termencoding=utf-8
set fileencodings=utf-8,iso-2022-jp,cp932,euc-jp
set enc=utf-8
set ff=unix
autocmd BufNewFile,BufReadPost * set fileencoding=utf-8

" Indent
set tabstop=4
set autoindent
set expandtab
set smartindent
set shiftwidth=4
set softtabstop=4
set smarttab
set paste


" Completion
set ignorecase
set smartcase
set wrapscan
set noincsearch
set hlsearch
set complete+=k

" normal mode keymap
nnoremap j gj
nnoremap k gk
nnoremap f 10j
nnoremap b 10k
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <C-n> gt
nnoremap <C-p> gT
nnoremap ,s :%s/<C-v><C-m>//<CR>
nnoremap ,,s :$s/\s*$//<CR>
nnoremap <leader>i1 :set softtabstop=1<CR>:set shiftwidth=1
nnoremap <leader>i2 :set softtabstop=2<CR>:set shiftwidth=2
nnoremap <leader>i4 :set softtabstop=4<CR>:set shiftwidth=4

" auto install.
if &compatible
  set nocompatible
endif

let s:dein_dir = expand('~/.cache/dein')
let s:dein_repo_dir = s:dein_dir . '/repos/github.com/Shougo/dein.vim'

if &runtimepath !~# '/dein.vim'
  if !isdirectory(s:dein_repo_dir)
    execute '!git clone https://github.com/Shougo/dein.vim' s:dein_repo_dir
  endif
  execute 'set runtimepath^=' . fnamemodify(s:dein_repo_dir, ':p')
endif

if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir)

  let g:rc_dir    = expand('~/.config/nvim/')
  let s:toml      = g:rc_dir . 'dein.toml'
  let s:lazy_toml = g:rc_dir . 'dein_lazy.toml'

  call dein#load_toml(s:toml,      {'lazy': 0})
  call dein#load_toml(s:lazy_toml, {'lazy': 1})

  call dein#end()
  call dein#save_state()
endif
filetype plugin indent on
syntax enable

