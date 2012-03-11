set nocompatible

if has("win32")
  source $VIMRUNTIME/vimrc_example.vim
  source $VIMRUNTIME/mswin.vim
  behave mswin

  set diffexpr=MyDiff()
  function MyDiff()
      let opt = '-a --binary '
      if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
      if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
      let arg1 = v:fname_in
      if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
      let arg2 = v:fname_new
      if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
      let arg3 = v:fname_out
      if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
      let eq = ''
      if $VIMRUNTIME =~ ' '
          if &sh =~ '\<cmd'
              let cmd = '""' . $VIMRUNTIME . '\diff"'
              let eq = '"'
          else
              let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
          endif
      else
          let cmd = $VIMRUNTIME . '\diff'
      endif
      silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
  endfunction

endif

" ------------------------------
"  vundle bundle
" ------------------------------
filetype off

set rtp+=$home/.vim/bundle/vundle/
call vundle#rc()

" let Vundle manage Vundle
" required! 
Bundle 'gmarik/vundle'

" My Bundles here:
"
" original repos on github
" Bundle 'tpope/vim-fugitive'
" Bundle 'Lokaltog/vim-easymotion'
" Bundle 'rstacruz/sparkup', {'rtp': 'vim/'}
" Bundle 'tpope/vim-rails.git'
" vim-scripts repos
Bundle 'winmanager'
Bundle 'taglist.vim'
Bundle 'minibufexplorerpp'
" Bundle 'L9'
" Bundle 'FuzzyFinder'
" non github repos
" Bundle 'git://git.wincent.com/command-t.git'
" ...

filetype plugin indent on     " required! 
"
" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

" ------------------------------
"  my settings
"  first set window layout

set guioptions-=T
set guioptions-=m

" set window position
if has("gui_running")
    winpos 200 100
    set lines=35 columns=110
endif

" 标签页只显示文件名
function ShortTabLabel ()
    let bufnrlist = tabpagebuflist (v:lnum)
    let label = bufname (bufnrlist[tabpagewinnr (v:lnum) -1])
    let filename = fnamemodify (label, ':t')
    return filename
endfunction
set guitablabel=%{ShortTabLabel()}

" set status bar
set ruler
set showcmd
set scrolloff=1

colorscheme lucius

set nobackup
set nu
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab
set cindent
set autoindent

" set search
set incsearch
set hlsearch
set ignorecase

set tags=D:\jumeiwei\tags

nmap <C-tab> :tabn<CR>
nmap <C-S-TAB> :tabp<CR>
nmap <F4> :bd<CR>

" tag list
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

" window manager
let g:winManagerWindowLayout='FileExplorer|TagList'
nmap wm :WMToggle<CR>

" mini buffer
let g:miniBufExplMapCTabSwitchBufs=1
