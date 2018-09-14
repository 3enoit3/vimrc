
" Don't behave like vi
set nocompatible

" Enable plugin by filetype
filetype plugin on

" Enable indentation by filetype
filetype indent on

" Syntax highlighting
syntax on

" Extend history content
set history=700

" viminfo behavior for context save
set viminfo='20,\"50

" Save and restore options (slash,unix for Windows)
set sessionoptions+=slash,unix

" Unix end of line
set fileformats=unix

" Backspace behavior: indent (over autoindent),eol (over line breaks),start(over start of insert)
set backspace=indent,eol,start

" Keep cursor on the same column when moving vertically
set nostartofline

" Special keys to move cursor
set whichwrap=<,>,[,],h,l

" Directories for backup files (write in the first possible one)
set backupdir=~/.tmp,.

" Directories for swap files (write in the first possible one)
set directory=~/.tmp,.,/tmp

" Skip prompt nmessages (intro msg)
set shortmess+=I

" Partial command in the last line of the screen (?)
set showcmd

" Briefly jump to the matching bracket
set showmatch

" Copy indent of the current line on new line
set autoindent

" Option for cindent
set nosmartindent
set cindent
set cinoptions=(0,t0,g0,:0

" Buffer is hidden when abandonned
set hidden

" Shell process (zsh is way too slow to start up on our systems (in particular with the NAS...)
set shell=/bin/sh

" Display as much as possible of the last line, show unprintable characters
set display=lastline,uhex

" Toogle paste mode, works even paste is set: http://vimdoc.sourceforge.net/htmldoc/options.html#'pastetoggle'
set pastetoggle=<F12>

" Python
let g:python_highlight_all = 1

" Line numbers
set nu

" Make
set makeprg=bms\ --no-forest\ build\ -j\ 0

" Diff : skip white spaces
set diffopt+=iwhite

" Command line completion
set wildmode=list:longest,full
set wildmenu

" Persistent undo: http://stackoverflow.com/a/22676189
if has('persistent_undo')
    let myUndoDir = expand($HOME.'/.vim/undo')

    " Create dir
    call system('mkdir -p ' . myUndoDir)

    " Activate
    let &undodir = myUndoDir
    set undofile
endif

" Minimal number of screen lines to keep below and above : http://vimdoc.sourceforge.net/htmldoc/options.html#'scrolloff'
set scrolloff=3

" Always display statusline : http://vimdoc.sourceforge.net/htmldoc/options.html#'laststatus'
set laststatus=2

" Suffixes that get lower priority when doing tab completion for filenames : http://vimdoc.sourceforge.net/htmldoc/options.html#'suffixes'
set suffixes=~,.aux,.bak,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.info,.inx,.log,.o,.obj,.out,.swp,.toc

" Leader
let g:mapleader = "\<Space>"

"" Terminal

" http://vimdoc.sourceforge.net/htmldoc/term.html
"if &term =~ "xterm"
    "256 color --
    let &t_Co=256

    " Restore screen after quitting
    " set t_ti=ESC7ESC[rESC[?47h t_te=ESC[?47lESC8

    if has("terminfo")
        let &t_Sf="\ESC[3%p1%dm"
        let &t_Sb="\ESC[4%p1%dm"
    else
        let &t_Sf="\ESC[3%dm"
        let &t_Sb="\ESC[4%dm"
    endif
"endif

"" Gvim

"if has("gui_running")
    " Font for gvim
    " set guifont=-*-lucidatypewriter-medium-r-*-*-12-*-*-*-*-*-*-*
    " set guifontset=-*-*-medium-r-normal--14-*-*-*-c-*-*-*
    " set guifont=-*-proggyclean-medium-r-*-*-12-*-*-*-*-*-*-*
    "set guifont=-*-gohufont-medium-*-14-*-*-*-*-*-*-*-*-*
    "set guifont=-*-terminesspowerline-*-*-*-*-*-*-*-*-*-*-*-*
    set guifont=Roboto\ Mono\ for\ Powerline:h10
    "set guifont=-misc-hack-medium-r-normal--12-0-0-0-m-0-iso10646-*
    "set guifont=-*-gohufont-medium-*-*-*-14-*-*-*-*-*-*-*
    "set guifont=-*-fixed-medium-*-*-*-*-*-*-*-*-*-*-*

    " Show special characters
    set encoding=utf-8

    " Removes top toolbar
    set guioptions-=T
    set guioptions-=b
    set guioptions-=m
    set guioptions-=t

    " Use mouse scrolling
    set mouse=a

    " No extra pixels between lines
    set linespace=1

    " Use tabs
    "tab ball
"else
    " Deactivate mouse scrolling support as default (to allow copy by selection)
"    set mouse=

    " No extra pixels between lines
"   set linespace=0
"endif

" Mouse

" Support for mouse mode: http://vimdoc.sourceforge.net/htmldoc/options.html#'ttymouse'
" set ttymouse=xterm2

" Use mouse in SELECT mode and not VISUAL, to be able to immediately overwrite
set selectmode+=mouse

"" Select

" Use shift-key to start selection
set keymodel=startsel

" Use SElECT mode for shift-key selections, to be able to immediately overwrite
set selectmode+=key

"" Tabs

" Number of space for a tab: http://vimdoc.sourceforge.net/htmldoc/options.html#'tabstop'
set tabstop=4

" http://vimdoc.sourceforge.net/htmldoc/options.html#'softtabstop'
set softtabstop=4

" Number of spaces for autoindent: http://vimdoc.sourceforge.net/htmldoc/options.html#'shiftwidth'
set shiftwidth=4

" Keep indent aligned on shiftwidth: http://vimdoc.sourceforge.net/htmldoc/options.html#'shiftwidth'
set shiftround

" Use shiftwidth for <tab>: http://vimdoc.sourceforge.net/htmldoc/options.html#'smarttab'
" set smarttab

" Use space for <tab>: http://vimdoc.sourceforge.net/htmldoc/options.html#'expandtab'
set expandtab

" Show tabs and trailing spaces: http://vimdoc.sourceforge.net/htmldoc/options.html#'listchars'
set listchars=tab:>-,trail:-,extends:+,precedes:+

"" Folding : http://vimdoc.sourceforge.net/htmldoc/fold.html

" Disable folding by default
set nofoldenable

" Base folding on code
set foldmethod=manual

" Close even single lines
set foldminlines=0

"" Search

" Incremental search: http://vimdoc.sourceforge.net/htmldoc/options.html#'incsearch'
set incsearch

" Match case in search (useful for completion): http://vimdoc.sourceforge.net/htmldoc/options.html#'noignorecase'
set noignorecase

" Highlight all matches: http://vimdoc.sourceforge.net/htmldoc/options.html#'hlsearch'
set hlsearch

"" Formatting

" Maximum width of a line (0 - using wrapmargin): http://vimdoc.sourceforge.net/htmldoc/options.html#'textwidth'
set textwidth=0

" Keep long lines in insert mode; auto-wrap long comment lines: http://vimdoc.sourceforge.net/htmldoc/options.html#'formatoptions'
set formatoptions+=cl


""""""""""""
" Import

let $MYVIMDIR=expand("<sfile>:h")

" plugins
source $MYVIMDIR/.vimrc.plugins

" functions
source $MYVIMDIR/.vimrc.functions


""""""""""""
" Colors
" My favorite green for the background: 47 79 79
colorscheme mycolors

" Trailing
highlight ExtraWhitespace ctermbg=red guibg=yellow
match ExtraWhitespace /\s\+$/


""""""""""""
" Commands

" Show cursorline
command! CursorLine :set cursorline!

" Issue file complete path in the shell
command! OutputFile :!echo "%"

" Count matches
command! Count :%s///gn

" Light diff
command! Diff :w !diff --ignore-all-space --ignore-blank-lines % -
command! CVSDiff :w !cvs diff --ignore-all-space --ignore-blank-lines %
command! HGDiff :w !hg diff --ignore-all-space --ignore-blank-lines %

" Grok calls
command! G :call system("firefox \"http://grok/RDM/search?q=".expand("<cword>")."&project=MDW&defs=&refs=&path=EZT%2FServer&hist=\" &")

" Prevent case issues when saving
command! W :w
command! Wq :wq
command! WQ :wq

" Quick leave
command! Q :qa
command! QQ :qa!

" Clean python tabs
command! PythonClean :%s/  /\t/g

" My doc
command! Doc :sp ~/.vim/doc.txt

" Highlight members
command! HighlightMembers /\H_\w\+

" Vimrc
command! SourceVimrc :source $MYVIMRC
command! ViewVimrc :sp $MYVIMRC

" Close all buffers
command! Clean :bufdo bd


""""""
" Maps

" set/unset paste mode
"nmap ,p :set invpaste<CR>

" Select pasted text: http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap gp `[v`]

" Switch easily between buffers
map <f7> :bp<CR>
map <f8> :bn<CR>
map <A-,> :bp<CR>
map <A-.> :bn<CR>

" Auto insert curly braces on Control-F
imap <C-F> {<CR>}<C-O>O

" In Visual mode, backspace deletes selection
vnoremap <BS> d

" Don't lose selection when shifting sidewards
xnoremap < <gv
xnoremap > >gv

" Quickly edit your macros
nnoremap <leader>m :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Shortcuts for autocompletion
inoremap <C-L> <C-X><C-L>

" Fold
map z<Left> zc
map z<Right> zo
map z<Up> zk
map z<Down> zj

" Motion
map <C-Up> <C-U>
map <C-Down> <C-D>
map <C-K> <C-U>
map <C-J> <C-D>
"map <A-Up> 3k
"map <A-Down> 3j
"map <S-Up> { -- used for selection
"map <S-Down> } -- used for selection

map <C-Left> ^
map <C-Right> $
map <A-Left> B
noremap <A-Right> W
map <S-Left> ge
map <S-Right> e

" Insert newlines without entering insert mode
"map <leader>o o<Esc>k
map <leader><down> O<Esc>j

"vnoremap H d"_XP`[v`]
"vnoremap H d"_XP`[v`]
"vnoremap J :m '>+1<CR>gv=gv
"vnoremap J d"_ddP`[v`]
"vnoremap K :m '<-2<CR>gv=gv
"vnoremap K c<esc>p`[v`]
"vnoremap L c<space><esc>p`[v`]

vnoremap J <esc>'<i<cr><esc>gv
vnoremap K <esc>'>ji<cr><esc>gv

" Visually select text, then search for it, forwards or backwards
" See <url:http://vim.sf.net/tips/tip.php?tip_id=780>
vmap <silent> * :<C-U>let old_reg=@"<cr>
            \gvy/<C-R><C-R>=substitute(
            \escape(@", '\\/.*$^~[]'), "[ \t\n]\\+", '\\_s\\+', 'g')<CR><CR>
            \:let @"=old_reg<cr>
vmap <silent> # :<C-U>let old_reg=@"<cr>
            \gvy?<C-R><C-R>=substitute(
            \escape(@", '\\?.*$^~[]'), "[ \t\n]\\+", '\\_s\\+', 'g')<CR><CR>
            \:let @"=old_reg<cr>

"" Ctrl-X,C,V

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V> "+gP
map <S-Insert> "+gP

cmap <C-V> <C-R>+
cmap <S-Insert> <C-R>+

" Pasting blockwise and linewise selections is not possible in Insert and
" Visual mode without the +virtualedit feature.  They are pasted as if they
" were characterwise instead.
" Uses the paste.vim autoload script.

exe 'inoremap <script> <C-V>' paste#paste_cmd['i']
exe 'vnoremap <script> <C-V>' paste#paste_cmd['v']

vmap <Leader>y "+y
vmap <Leader>d "+d
nmap <Leader>p "+p
nmap <Leader>P "+P
vmap <Leader>p "+p
vmap <Leader>P "+P

imap <S-Insert> <C-V>
vmap <S-Insert> <C-V>

" Use SHIFT-W to do what CTRL-V used to do (not working with CTRL-Q)
noremap <S-W> <C-V>

" Do not use Ex mode: http://stackoverflow.com/questions/1269689/to-disable-entering-ex-mode-in-vim
map Q <nop>

" Search with * but stay in place
map <leader>s mR*`R
map <leader>S *``viw

" Bookmark
map <leader>b :let @+='@' . expand("%:p") . ":" . line(".") . ":" . getline(".")<cr>
map <leader>o :execute substitute(getline("."), '^.\{-}@\s*\(.\{-}\)\s*:\s*\(\d\+\)\s*:\(.*\)$', 'edit +\2 \1', '')<cr>

" Buffers
" simulate key pressed (t as if typed) to activate autocompletion
map <leader>t :call feedkeys(":b \<tab>\<tab>", "t")<cr>


""""""""""""
" Autocommands

" Syntax
autocmd Syntax cpp call EnhanceCppSyntax()
autocmd Syntax tts call EnhanceTTSSyntax()

autocmd BufEnter *.java set cindent

" File types
autocmd BufEnter *.i setf cpp
autocmd BufEnter *.mdl setf sql
autocmd BufEnter *.play,*.play.log,*.play.comp.log,*.ref,*.gsv setf edifact
autocmd BufEnter *.edi,*.edi.log,*.edi.rep,*.rgr setf edifact
autocmd BufEnter *.cmt setf cmt
autocmd BufEnter Make* setf make
autocmd BufEnter *.scn setf tts
autocmd BufRead,BufNewFile */regression/*.sh setf tts

" Jump to last position in the file, see <url:vimhelp:last-position-jump>
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" See <url:vimhelp::cw> (with bugfix and enhancement by me)
autocmd BufReadPost quickfix setlocal modifiable
            \ | let g:qf_tmp=@/
            \ | silent %s/^/\=line(".")." "/
            \ | let @/=g:qf_tmp
            \ | setlocal nomodifiable

" In a comment, explicitely disable auto comment after insert <new line>, and normal o/O
autocmd FileType * setlocal formatoptions-=r formatoptions-=o

" Open simultaneous edit in readonly
augroup NoSimultaneousEdits
    autocmd!
    autocmd SwapExists * :let v:swapchoice = 'o'
augroup END

" Delete spaces at the end (http://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git)
" autocmd BufWritePre * :%s/\s\+$//e

