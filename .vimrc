
" Don't behave like vi
set nocompatible


"""""""""""""""""""""""""""" Vundle

filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=$HOME/.vim/bundle/Vundle.vim
"set rtp+=$HOME/.vim_vundle/bundle/Vundle.vim
"let path='$HOME/.vim_bundle/bundle'
"call vundle#rc('$HOME/.vim_bundle/bundle')
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
" call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" Keep Plugin commands between vundle#begin/end.

" include plugins
" !modify this file on windows if you want to add a plugin!
source $HOME/.vimrc.vundle_plugins

" Add your plugins above (see https://github.com/VundleVim/Vundle.vim - step 3) "


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

"""""""""""""""""""""""""""" Vundle


" Portability
if has("win32")
    let $VIMFILES=expand("$VIM/vimfiles")
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
else " Assume Unix
    let $VIMFILES=expand("$HOME/.vim")
endif

" let g:mapleader = `
"let g:mapleader = "\"
let g:mapleader = "\<Space>"

" Syntax highlighting
syntax on

" Enable plugin by filetype
filetype plugin on

" Enable indentation by filetype
filetype indent on

""""""
" Terminal : http://vimdoc.sourceforge.net/htmldoc/term.html
if &term =~ "xterm"
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

    " In/out termcap mode
    set t_ti=[?47h
    set t_te=[?47l
endif

" Various options


" Extend history content
set history=700

" viminfo behavior for context save
set viminfo='20,\"50

" Save and restore options (slash,unix for Windows)
set sessionoptions+=slash,unix

" Unix end of line
set fileformat=unix

" Backspace behavior: indent (over autoindent),eol (over line
" breaks),start(over start of insert)
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


""""""
" CamelCase motion
" (motion inside multipleCaseId https://github.com/bkad/CamelCaseMotion)

" Activate plugin
call camelcasemotion#CreateMotionMappings('<leader>')

" i<leader>w also includes next upper case char in the selection ("CamelC"): let <leader>iw selects the inside word only ("Camel")
vmap <leader>iw <Esc>l<leader>bv<leader>e
omap <leader>iw :normal v<leader>iw<CR>

""""""
" Easymotion

" sneak
map ;s <Plug>(easymotion-s2)

map ;w <Plug>(easymotion-w)
map ;b <Plug>(easymotion-b)

map ;j <Plug>(easymotion-j)
map ;k <Plug>(easymotion-bd-k)
" keep cursor in place
let g:EasyMotion_startofline = 0

map <leader>w <Plug>(easymotion-bd-w)
map <leader>j <Plug>(easymotion-bd-jk)


""""""
" Gvim

if has("gui_running")
    " Font for gvim
    " set guifont=-*-lucidatypewriter-medium-r-*-*-12-*-*-*-*-*-*-*
    " set guifontset=-*-*-medium-r-normal--14-*-*-*-c-*-*-*
    " set guifont=-*-proggyclean-medium-r-*-*-12-*-*-*-*-*-*-*
    "set guifont=-*-gohufont-medium-*-14-*-*-*-*-*-*-*-*-*
    "set guifont=-*-terminesspowerline-*-*-*-*-*-*-*-*-*-*-*-*
    "set guifont=Roboto\ Mono\ for\ Powerline\ 12
    "set guifont=-misc-hack-medium-r-normal--12-0-0-0-m-0-iso10646-*
    set guifont=-*-gohufont-medium-*-*-*-14-*-*-*-*-*-*-*
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

    " Disable tooltips (in particular for Tagbar)
    set noballooneval

    " Remove "Thanks for flying Vim"
    "set notitle
    set titlestring=%t
else
    " Deactivate mouse scrolling support as default (to allow copy by selection)
    set mouse=

    " No extra pixels between lines
    set linespace=0

    " Deactivate vim-airline to use my_rstatusline (file position slider)
    let g:loaded_airline = 1
endif


"""""""
" Mouse

" Support for mouse mode: http://vimdoc.sourceforge.net/htmldoc/options.html#'ttymouse'
set ttymouse=xterm2

" Mouse toggle
nmap ,m :call ToggleMouse()<CR>

" Do not use Ex mode: http://stackoverflow.com/questions/1269689/to-disable-entering-ex-mode-in-vim
map Q <nop>

" Toogle paste mode, works even paste is set: http://vimdoc.sourceforge.net/htmldoc/options.html#'pastetoggle'
set pastetoggle=<F12>

" Use mouse in SELECT mode and not VISUAL, to be able to immediately overwrite
set selectmode+=mouse


"""""""
" Select

" Use shift-key to start selection
set keymodel=startsel

" Use SElECT mode for shift-key selections, to be able to immediately overwrite
set selectmode+=key


""""""
" Tabs

" Number of space for a tab: http://vimdoc.sourceforge.net/htmldoc/options.html#'tabstop'
set tabstop=4

" http://vimdoc.sourceforge.net/htmldoc/options.html#'softtabstop'
set softtabstop=4

" Number of spaces for autoindent: http://vimdoc.sourceforge.net/htmldoc/options.html#'shiftwidth'
set shiftwidth=4

" Keep indent aligned on shiftwidth: http://vimdoc.sourceforge.net/htmldoc/options.html#'shiftwidth'
set shiftround

" Use shiftwidth for <tab>: http://vimdoc.sourceforge.net/htmldoc/options.html#'smarttab'
"set smarttab

" Use space for <tab>: http://vimdoc.sourceforge.net/htmldoc/options.html#'expandtab'
set expandtab

" Show tabs and trailing spaces: http://vimdoc.sourceforge.net/htmldoc/options.html#'listchars'
set listchars=tab:>-,trail:-
set listchars+=extends:+,precedes:+

""""""
" Maps

" Toggle listed chars
"nmap ,l :set invlist<CR>

" Format a paragraph (needs tw!=0)
map & gqap

" Switch between header and implementation files
"nmap ,f :CPP2H<CR>

" Reload .vimrc
"nmap ,s :source $MYVIMRC<CR>

" Open .vimrc in a splitted window
"nmap ,v :sp $MYVIMRC<CR>

" set/unset paste mode
"nmap ,p :set invpaste<CR>

" Select pasted text: http://vim.wikia.com/wiki/Selecting_your_pasted_text
nnoremap gp `[v`]

" Switch easily between buffers
map <f7> :bp<CR>
map <f8> :bn<CR>
map <A-,> :bp<CR>
map <A-.> :bn<CR>

map <f3> :tabp<CR>
map <f4> :tabn<CR>

" Auto insert curly braces on Control-F
imap <C-F> {<CR>}<C-O>O

" In Visual mode, backspace deletes selection
vnoremap <BS> d

" Don't lose selection when shifting sidewards
xnoremap <  <gv
xnoremap >  >gv

" Quickly edit your macros
nnoremap <leader>m  :<c-u><c-r><c-r>='let @'. v:register .' = '. string(getreg(v:register))<cr><c-f><left>

" Show cursorline
command! CursorLine :set cursorline!

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
map <A-Up> 3k
map <A-Down> 3j
"map <S-Up> { -- used for selection
"map <S-Down> } -- used for selection

map <C-Left> ^
map <C-Right> $
map <A-Left> B
noremap <A-Right> W
map <S-Left> ge
map <S-Right> e

" Buffer switch hpp/cpp
map <leader>s :FSHere<CR>

" Insert newlines without entering insert mode
"map <leader>o o<Esc>k
map <leader>o O<Esc>j


"""""""
" Folding : http://vimdoc.sourceforge.net/htmldoc/fold.html

" Disable folding by default
set nofoldenable

" Base folding on code
set foldmethod=manual

" Close even single lines
set foldminlines=0

""""""
" Search

" Incremental search: http://vimdoc.sourceforge.net/htmldoc/options.html#'incsearch'
set incsearch

" Match case in search (useful for completion): http://vimdoc.sourceforge.net/htmldoc/options.html#'noignorecase'
set noignorecase

" Highlight all matches: http://vimdoc.sourceforge.net/htmldoc/options.html#'hlsearch'
set hlsearch

" Minimal number of screen lines to keep below and above : http://vimdoc.sourceforge.net/htmldoc/options.html#'scrolloff'
set scrolloff=3

" Always display statusline : http://vimdoc.sourceforge.net/htmldoc/options.html#'laststatus'
set laststatus=2

""""""
" Formatting

" Maximum width of a line (0 - using wrapmargin): http://vimdoc.sourceforge.net/htmldoc/options.html#'textwidth'
set textwidth=0

" Keep long lines in insert mode; auto-wrap long comment lines: http://vimdoc.sourceforge.net/htmldoc/options.html#'formatoptions'
set formatoptions+=cl

" In a comment, explicitely disable auto comment after insert <new line>, and normal o/O
autocmd FileType * setlocal formatoptions-=r formatoptions-=o


" Suffixes that get lower priority when doing tab completion for filenames : http://vimdoc.sourceforge.net/htmldoc/options.html#'suffixes'
set suffixes=~,.aux,.bak,.bbl,.blg,.brf,.cb,.dvi,.idx,.ilg,.ind,.info,.inx,.log,.o,.obj,.out,.swp,.toc

""""""
" Abbreviations : http://vimdoc.sourceforge.net/htmldoc/map.html#Abbreviations

" Misc
noreabbrev teh the
noreabbrev aps pas
iabbrev yalp abcdefghijklmnopqrstuvwxyz
iabbrev yALP ABCDEFGHIJKLMNOPQRSTUVWXYZ
iabbrev cad c'est-à-dire
iabbrev qqn quelqu'un

" Expand #i to #include <.h> or #include ".h". The latter is chosen
" if the character typed after #i is a dquote
" if the character is > #include <> is inserted (standard C++ headers w/o .h)
iab #i <C-R>=SmartInclude()<CR>


""""""
" Fixed Ack.vim plugin
let g:ack_default_options = " -H --nocolor --nogroup --column"


"""""""
" Functions

" Diff
function! s:DiffWithSaved()
    " see <url:http://vim.sf.net/tips/tip.php?tip_id=1030>
    let filetype=&ft
    diffthis
    " new | r # | normal 1Gdd - for horizontal split
    vnew | r # | normal 1Gdd
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! DiffX call s:DiffWithSaved()

function! s:DiffWithCheckedOut()
    "  let cvs_version = BASE
    "  if a:version != ''
    "    let cvs_version = a:version
    "  fi
    "  echomsg a:cvs_version

    let filetype=&ft
    diffthis
    " new | r # | normal 1Gdd - for horizontal split
    vnew | r !cvs up -pr BASE #
    normal 1Gd6d
    diffthis
    exe "setlocal bt=nofile bh=wipe nobl noswf ro ft=" . filetype
endfunction
com! CVSDiffX call s:DiffWithCheckedOut()

" Highlights
function! EnhanceCppSyntax()
    "syn match cppFuncDef "\s*\zs\h\w*\ze\s*([^)]*\()\s*\(const\)\?\)\?\(\s*{\)\?\s*$"
    " space* {start capture} alpha alphanum {end capture} space* ( something [) space* [const]?]? [space* {]? space* end_of_line
    " almost: syn match cppFuncDef "[\s:]\zs\h\w*\ze\s*([^)]*\()\s*\(const\)\?\s*\(;\|{.*\)\?\|,\)\s*$"
    " conflict w keywords: syn match cppFuncDef "\w\s\+\(\w\+::\)\?\zs\h\w*\ze\s*([^)]*\()\s*\(const\)\?\s*\(;\|{.*\)\?\|,\)\s*$"
    "syn match cppFuncDef "\s\+\(\w\+::\)\?\zs\h\w*\ze\s*([^)]*\()\s*\(const\)\?\s*\(;.*\|{.*\)\?\|,\s*\)$"
    " space+ [alphanum+ ::]? {start capture} alpha alphanum* {end capture} space* ( something [) space* [const]? [; .* or } .* or , space*] end_of_line
    syn match cppFuncDef "[: \t]\zs\h\w*\ze\s*([^)]*\()\s*\(const\)\?\s*\(;.*\|{.*\)\?\|,\s*\)$"
    " [: or space or tab ] {start capture} alpha alphanum* {end capture} space* ( something [) space* [const]? [; .* or } .* or , space*] end_of_line
    " syn match cppFuncDef "^\s*\(virtual\s\+\)\?\h\w*\s\+\(\h\w*::\)\?\zs\h\w*\ze\s*([^)]*\()\s*const\|)\s*;\|,\)\s*$"
    " syn match cppFuncDef "^\s*\(virtual\s\+\|static\s\+\)\?\h\w*\s\+\(\h\w*::\)\?\zs\h\w*\ze\s*([^)]*\()\s*\(const\)\?;\?\|,\)\s*$"
    " syn match cppFuncDef "^\h\w*\s\+\zs\h\w*\ze()$"
    hi def link cppFuncDef Function

    syn match cppRange "\zs\w\+\ze::"
    hi def link cppRange Special

    syn match cppUP_SQL "\zsUP_SQL\w*\ze"
    hi def link cppUP_SQL Type
    syn match cppUP_TSQ "\zsUP_TSQ\w*\ze"
    hi def link cppUP_TSQ Type
    syn match cppAMD "\zsAMD_\w*\ze"
    hi def link cppAMD Type
    syn match cppTemplate "< \?\zs\w*\ze \?> "
    hi def link cppTemplate Type
    syn match cppTemplate "< \?\zs\w* \?, \?\w*\ze \?> "
    hi def link cppTemplate Type
    syn match cppTrace "\zsTRC_\L*\ze("
    hi def link cppTrace Special

    syn match cppDCS_WARN "\zsDCS_WARNING_\w*\ze"
    hi def link cppDCS_WARN Special
    syn match cppDCS_ERR "\zsDCS_ERROR_\w*\ze"
    hi def link cppDCS_ERR Special
    syn match cppDCS "\zsDCS_\w*\ze"
    hi def link cppDCS Special

    syntax region tts_string start=/\v"/ skip=/\v\\./ end=/\v"/
    hi def link tts_string String
endfunction

function! EnhanceTTSSyntax()
    " Framework
    syn keyword scnDataSeparator __DATA__
    hi def link scnDataSeparator Error

    syn match scnData "^>>.*$"
    syn match scnData "^<<.*$"
    hi def link scnData Include

    syn match scnFunction "^\s*\w\+\s*{\s*$"
    syn match scnFunction "^\s*\w\+\s*{}\s*;\s*$"
    hi def link scnFunction Function

    syn keyword scnParameter wait set compare no_org
    hi def link scnParameter Statement

    syn keyword scnSpecialParameter EOD EOS EOT SQL messages triggers target
    hi def link scnSpecialParameter Special


    " SQL
    syn keyword sqlStatement select SELECT from FROM insert INSERT into INTO delete DELETE where WHERE group GROUP update UPDATE set SET as AS order ORDER by BY and AND or OR
    hi def link sqlStatement Statement

    syn match sqlData "^-[ -]*-$"
    hi def link sqlData Comment
    "runtime! syntax/sql.vim

    " Shell
    syn keyword shStatement break cd chdir continue eval exec exit kill newgrp pwd read readonly return shift test trap ulimit umask wait echo export
    syn keyword shConditional if elif else then fi for in do done
    syn keyword kshStatement autoload bg false fc fg functions getopts hash history integer jobs let nohup printf r stop suspend times true type unalias whence
    syn keyword kshStatement2 cat chmod clear cp du egrep expr fgrep find grep install killall less ls mkdir mv nice printenv rm rmdir sed sort strip stty tail touch tput
    syn keyword bashStatement bind builtin dirs disown enable help local logout popd pushd shopt source

    hi def link shStatement Statement
    hi def link shConditional Statement
    hi def link kshStatement Statement
    hi def link kshStatement2 Statement
    hi def link bashStatement Statement

    " EDI
    syn match ediMsg "^.*&$"
    syn match ediMsg "^[^']*'$"
    hi def link ediMsg String

    " Comments
    syn match shComment "^\#.*$"
    hi def link shComment Comment
    syn match tts_comment "^\'\'.*$"
    hi def link tts_comment Comment

    syn match tts_title "^\'[^\'].*$\|^\'$"
    hi def link tts_title Title

    syntax region tts_string start=/\v"/ skip=/\v\\./ end=/\v"/
    hi def link tts_string String

endfunction


" Mouse
function! ToggleMouse()
    if &mouse == 'a'
        set mouse=
    else
        set mouse=a
    endif
    echon "mouse=" &mouse
endfunction

" Includes
function! SmartInclude()
    let next = nr2char( getchar( 0 ) )
    if next == '"'
        return "#include \".hpp\"\<Left>\<Left>\<Left>\<Left>\<Left>"
    endif
    if next == '>'
        return "#include <>\<Left>"
    endif
    return "#include <.hpp>\<Left>\<Left>\<Left>"
endfunction

" Backup of the current file.
function! s:Backup()
    " Ask for a comment
    call inputsave()
    let fname_comment = input('Add a comment to the backup? ')
    call inputrestore()
    if !empty(fname_comment)
        let fname_comment= '.' . fname_comment
    endif

    " Save file
    let fname = expand('%:p') . '.bak.' . strftime('%Y%m%d.%H%M%S') . fname_comment
    silent execute 'write' fname
    echomsg 'Wrote' fname
endfunction
com! Backup call s:Backup()

" Refactor (apply last change on a word)
function! Refactor()
    exe 'normal mR'
    exe 'normal ub'
    exe 'normal "pyiw'
    exe "normal \<C-R>"
    exe 'normal "ryiw'
    exe 'bufdo %s/\<' . @p . '\>/' . @r . '/gce'
    exe 'normal `R'
endfunction
map <leader>r :call Refactor()<CR>

" Issue file complete path in the shell
command! OutputFile :!echo "%"

" Count matches
command! Count :%s///gn

" Easy replace
function! s:ReplaceLines(...)
    """ Pattern
    let pattern = a:1

    " Escape
    let pattern = substitute(pattern, '\\#', '__hash__', 'g')
    let pattern = substitute(pattern, '\\-', '__dash__', 'g')

    let capture_count = strlen( substitute(pattern, '[^#]', '', 'g') )

    " Insert spaces between tokens (twice to workaround #### where only #\s##\s# is added)
    let pattern = substitute(pattern, '\([-#]\)\([-#]\)', '\1\\s\2', 'g')
    let pattern = substitute(pattern, '\([-#]\)\([-#]\)', '\1\\s\2', 'g')

    " Default end
    if pattern !~ '\$$'
        " Stop after a space if not explicit
        if pattern =~ '[-#]'
            let pattern = pattern . '\s'
        endif
        let pattern = pattern . '.*$'
    endif

    " Change .* to be non greedy
    let pattern = substitute(pattern, '\.\*', '.\\{__dash__}', 'g')

    " Capture
    let pattern = substitute(pattern, '#', '\\s*\\(\\S\\+\\)\\s*', 'g')
    let pattern = substitute(pattern, '-', '\\s*\\S\\+\\s*', 'g')

    " Unescape
    let pattern = substitute(pattern, '__hash__', '#', 'g')
    let pattern = substitute(pattern, '__dash__', '-', 'g')


    """ Replace
    let replace = ""

    " Default capture if any
    if a:0 == 2
        let replace = a:2
    else
        if capture_count > 0
            let replace = '\1'
            let i = 2
            while i <= capture_count
                let replace = replace . ' \' . i
                let i = i + 1
            endwhile
        endif
    endif

    """ Command
    let sed_str = '%s/^' . pattern . '/' . replace . '/'

    " Execute on confirm
    if confirm(sed_str . " - Confirm apply?", "&Yes\n&No", 1) == 1
        exe sed_str
    endif
endfunction
command! -nargs=* ReplaceLines call s:ReplaceLines(<f-args>)

" Tags
function! s:OpenClassTag()
    let aClassTag = expand("<cword>")
    let aTags = taglist('^'.aClassTag.'$')
    let aTags = filter(aTags, 'v:val["kind"] == "c"')

    if len(aTags) == 1
        execute 'edit ' . aTags[0]['filename']
        execute 'silent normal! ' . aTags[0]['cmd'] . "\rzt"
    else
        echo "No tags found for " . aClassTag
    endif
endfunction
command! OpenClassTag call s:OpenClassTag()

function! s:OpenTag()
    let aStr = expand("<cword>")
    let aTags = taglist(aStr)

    if len(aTags) > 0
        for entry in aTags
            echo "Found " . entry['name'] . " (" . entry['kind'] . ")"
        endfor
    else
        echo "No tags found for " . aStr
    endif
endfunction
command! OpenTag call s:OpenTag()

"""""""
" Autocommand

" Syntax
autocmd Syntax cpp call EnhanceCppSyntax()
autocmd Syntax tts call EnhanceTTSSyntax()

" Files
autocmd BufEnter *.java set cindent
autocmd BufEnter *.i setf cpp

autocmd BufEnter *.mdl setf sql
autocmd BufEnter *.play,*.play.log,*.play.comp.log,*.ref,*.gsv setf edifact
autocmd BufEnter *.edi,*.edi.log,*.edi.rep,*.rgr setf edifact
autocmd BufEnter *.cmt setf cmt
autocmd BufEnter Make* setf make
autocmd BufEnter *.scn setf tts

" Jump to last position in the file, see <url:vimhelp:last-position-jump>
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal g`\"" | endif

" See <url:vimhelp::cw> (with bugfix and enhancement by me)
au BufReadPost quickfix  setlocal modifiable
            \ | let g:qf_tmp=@/
            \ | silent %s/^/\=line(".")." "/
            \ | let @/=g:qf_tmp
            \ | setlocal nomodifiable

"""""""""""
" Plugins "
"""""""""""


" See <url:vimhelp:python.vim>
let g:python_highlight_all = 1

"" EnhancedCommentify
let g:EnhCommentifyPretty = "yes"
"let g:EnhCommentifyUseAltKeys = "yes"
let g:EnhCommentifyUseSyntax = "yes"
let g:EnhCommentifyTraditionalMode = "no"
let g:EnhCommentifyFirstLineMode = "yes"

"" Taglist
if has("win32")
    let Tlist_Ctags_Cmd="ctags.exe"
elseif has("unix")
    let Tlist_Ctags_Cmd="ctags"
endif

" Smarter tab line
"let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1

let g:miniBufExplUseSingleClick = 1

" Bookmarks
let g:bookmark_highlight_lines = 1

""""""""""""""""""
" Other commands "
""""""""""""""""""

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

"https://github.com/vim-scripts/lookupfile
command! E :exec "LUWalk" expand('%:p:h').'/'

" formatting
command! AStyle :silent !astyle %

" MY CHANGES

" Line numbers
set nu

" Light diff
command! Diff :w !diff --ignore-all-space --ignore-blank-lines % -
command! CVSDiff :w !cvs diff --ignore-all-space --ignore-blank-lines %
command! HGDiff :w !hg diff --ignore-all-space --ignore-blank-lines %

" Grok calls
command! G :call system("firefox \"http://grok/RDM/search?q=".expand("<cword>")."&project=MDW&defs=&refs=&path=EZT%2FServer&hist=\" &")

" File explorer
command! Files NERDTreeToggle

" NERDTree

" Nice tree display
"let g:NERDTreeDirArrows=0

" File filters
"let g:NERDTreeIgnore=['\(\.cpp\)\@!$']

function! NERDTreeCustomIgnoreFilter(iPath)
    if( !b:NERDTreeIgnoreEnabled )
        return 0
    else
        let aPath = a:iPath.str()
        if( a:iPath.isDirectory )
            if( (aPath =~# "lib$") || (aPath =~# "obj$") || (aPath =~# "bmstmp$") )
                return 1
            else
                return 0
            endif
        else
            if( (aPath =~# "\.cpp$") || (aPath =~# "\.h$") || (aPath =~# "\.xml$") || (aPath =~# "\.hpp$") )
                return 0
            else
                return 1

            endif
        endif
    endif
endfunction

" Ctags
command! Symbols TagbarToggle

" Recently modified
command! Recent MRU
map RR :Recent<CR>

" Shell
command! Shell ConqueTerm zsh

" Clean
function! CleanBuffers()
    for aBuffer in w:BufKillList
        :BD
    endfor
endfunction

command! Clean call CleanBuffers()

" Close buffer
map <leader>d :BD<CR>

" Search for a line
map <leader>l :Unite line -ignorecase<CR>i

" Prevent case issues when saving
command! W :w
command! Wq :wq
command! WQ :wq

" Quick leave
command! Q :qa
command! QQ :qa!

" Clean python starts
command! PythonClean :%s/  /\t/g

" Make
"set makeprg=bms\ build
set makeprg=bms\ --no-forest\ build\ -j\ 0

" Cope
map <leader>q :QFix<CR>

" Comment
map <leader>C mRyyP<space>cc`R

" Diff : skip white spaces
set diffopt+=iwhite

" Ctags
"set tags=TAGS;/
"set tags=$VIM_PROJECT/tags

" Completion - http://vim.wikia.com/wiki/C%2B%2B_code_completion
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1
let OmniCpp_MayCompleteDot = 1
let OmniCpp_MayCompleteArrow = 1
let OmniCpp_MayCompleteScope = 1
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" automatically open and close the popup menu / preview window
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest,preview
"set ofu=syntaxcomplete#Complete
au BufNewFile,BufRead,BufEnter *.cpp,*.hpp,*.h set omnifunc=omni#cpp#complete#Main

"""""""""""""
" Supertab - https://github.com/ervandew/supertab

" Enable enhanced longest completion
let g:SuperTabLongestEnhanced=1

" Highlight first match
let g:SuperTabLongestHighlight=1

" Select up to bottom order
let g:SuperTabDefaultCompletionType= "<c-n>"

let g:omni_syntax_ignorecase=0

""""""""""""
" Command line completion
set wildmode=list:longest,full
set wildmenu


" CVS
function! GoToConflicts()
    syn match cvsConflict "^=======$\|^<<<<<<< .*$\|^>>>>>>> .*$"
    hi def link cvsConflict Error

    exe "normal gg"
    exe "/^=======$\\|^<<<<<<< .*$\\|^>>>>>>> .*$"
endfunction
com! Conflicts call GoToConflicts()

" My doc
com! Doc :sp ~/vim/doc.txt

" Undo
com! Undo :GundoToggle

" Highlight members
com! HighlightMembers /\H_\w\+


"""""
" Ctrl-X,C,V

" CTRL-X and SHIFT-Del are Cut
vnoremap <C-X> "+x
vnoremap <S-Del> "+x

" CTRL-C and CTRL-Insert are Copy
vnoremap <C-C> "+y
vnoremap <C-Insert> "+y

" CTRL-V and SHIFT-Insert are Paste
map <C-V>   	"+gP
map <S-Insert>  	"+gP

cmap <C-V>  	<C-R>+
cmap <S-Insert> 	<C-R>+

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

imap <S-Insert> 	<C-V>
vmap <S-Insert> 	<C-V>

" Use SHIFT-W to do what CTRL-V used to do (not working with CTRL-Q)
noremap <S-W>   	<C-V>

"""""
" Open simultaneous edit in readonly
augroup NoSimultaneousEdits
    autocmd!
    autocmd  SwapExists  *  :let v:swapchoice = 'o'
augroup END

"""""""""""""""
" Files
au BufRead,BufNewFile */regression/*.sh set filetype=tts

""""""""""""
" Command line completion
set wildmode=list:longest,full
set wildmenu

""""""
" Folding function

let g:my_fold_mode=0
function! CppFolding()
    if( g:my_fold_mode == 0)
        set foldmethod=syntax
        set foldlevel=3

        set foldenable

        let g:my_fold_mode=1
    else
        set nofoldenable

        set foldmethod=manual
        exe "normal zE"

        let g:my_fold_mode=0
    endif
endfunction
com! Folds call CppFolding()

" Delete spaces at the end (http://makandracards.com/makandra/11541-how-to-not-leave-trailing-whitespace-using-your-editor-or-git)
autocmd BufWritePre * :%s/\s\+$//e

"""""""
" Colors

"source ~/.vim/colors/mycolors.vim
colorscheme mycolors

" Trailing
highlight ExtraWhitespace ctermbg=red guibg=yellow
match ExtraWhitespace /\s\+$/

" Set a nicer foldtext function: http://vim.wikia.com/wiki/Customize_text_for_closed_folds
set foldtext=MyCppFoldText()
function! MyCppFoldText()
    let line = getline(v:foldstart)
    if match( line, '^[ \t]*\(\/\*\|\/\/\)[*/\\]*[ \t]*$' ) == 0
        let initial = substitute( line, '^\([ \t]\)*\(\/\*\|\/\/\)\(.*\)', '\1\2', '' )
        let linenum = v:foldstart + 1
        while linenum < v:foldend
            let line = getline( linenum )
            let comment_content = substitute( line, '^\([ \t\/\*]*\)\(.*\)$', '\2', 'g' )
            if comment_content != ''
                break
            endif
            let linenum = linenum + 1
        endwhile
        let sub = initial . ' ' . comment_content
    else
        let sub = line
        let startbrace = substitute( line, '^.*{[ \t]*$', '{', 'g')
        if startbrace == '{'
            let line = getline(v:foldend)
            let endbrace = substitute( line, '^[ \t]*}\(.*\)$', '}', 'g')
            if endbrace == '}'
                let sub = sub.substitute( line, '^[ \t]*}\(.*\)$', '...}\1', 'g')
            endif
        endif
    endif

    " Build folded line count header
    let n = v:foldend - v:foldstart + 1
    let info = '[' . n . ']'

    " Get sizes to properly align {...}s
    let info_size = strlen(info)
    let sub_indent = match(sub, '[^ \t]')

    " Overide the beginning if there is enough space, or concat them
    if( info_size > sub_indent )
        let sub = info . strpart(sub, sub_indent)
    else
        let sub = info . strpart(sub, info_size)
    endif

    return sub
endfunction

" Tabs
"syntax match Tab /\t/
"hi Tab gui=underline guifg=blue ctermbg=blue
