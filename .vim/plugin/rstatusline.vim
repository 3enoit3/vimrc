"show the buffer list on status line.
"the only setting option is g:cur_anchor which is the middle position
"of the list-window.
"if you want to set buffer list to show N buffers,set g:cur_anchor=N/2+1
"currently,N should be an odd number.
"
"author:Ruoshan Huang (ruoshan.huang@gmail.com)
"
"20120501:the space between buffers is only one <space> now
"

"set laststatus=2
"hi StatusLine ctermfg=0 ctermbg=229 gui=None guifg=DarkKhaki guibg=Black
"hi StatusLineNC ctermfg=23 ctermbg=229 gui=None guifg=DarkKhaki guibg=DarkSlateGray4
"hi Hl_status ctermfg=238 ctermbg=112 gui=None guifg=Black guibg=chartreuse2

if !exists("g:cur_anchor")
  let g:cur_anchor=5
endif
let g:half_winsize=g:cur_anchor-1

function! MyStatusline()
"  hi User2 ctermbg=236
"  hi User3 ctermfg=15 ctermbg=160

"  set fillchars=stl:\ ,stlnc:\

  "        |=========|          -> window-size container
  "######## ######### ######### -> buffer list (longer),only the part
  "             ^--anchor          'below' the container is shown.
  "
  "by default,only show 9 (9/2+1=5) buflist at most,9 is the window-size.
  "buflist can be much longer than window-size,but just show the part that
  "fit in window-size.
  "when cur_nr is out of the window,it is called out-of-sight.
  "when outofsight,move a step (=g:half_winsize) to make cur_nr is in sight again.
  let last_buf_nr=bufnr('$')
  let cur_nr=bufnr('%')
  let hl_cur_buf='%#Hl_status#'.fnamemodify(bufname('%'),':t').'%*'
  let buflist_str=''
  while 1
    if g:cur_anchor-cur_nr > g:half_winsize
      "move to left buf and be out of sight,so move window-size a step left
      let g:cur_anchor-=g:half_winsize+1
    elseif cur_nr-g:cur_anchor > g:half_winsize
      "move to right buf and be out of sight,so move window-size a step right
      let g:cur_anchor+=g:half_winsize+1
    else
      break
    endif
  endwhile

  "get all the listed buffer into buflist_list[]
  "unlisted buffer is replace by <NULL>
  let bufcount = last_buf_nr
  let bufcount_empty = 0
  let bufcount_defined = 0

  let i=1
  let bufnr_list=0
  let buflist_list=[]
  while i <= last_buf_nr
    "if getbufvar(i, '&ma') == 0 || !buflisted(i)
    if buflisted(i)
      call add(buflist_list,fnamemodify(bufname(i),':t'))
      let bufnr_list+=1
      let bufcount_defined+=1
    else
      call add(buflist_list,'')
      let bufcount_empty+=1
    endif
    let i+=1
  endwhile

  "show the buffer name in the buflist_list[] if the buffer is in the
  "window-size container
  let i=0
  while i < last_buf_nr
    if abs(g:cur_anchor-i-1) > g:half_winsize
      let i+=1
      continue
    endif
    if buflist_list[i] == ''
      let i+=1
      continue
    endif
    if i != cur_nr-1
      let buflist_str=buflist_str.' '.buflist_list[i]
    else
      let buflist_str=buflist_str.' '.hl_cur_buf
    endif
    let i+=1
  endwhile

  "buffer count display
  let bufdisplay='%n/'.bufcount_defined
  if bufcount_empty > 0
    let bufdisplay=bufdisplay.':'.bufcount_empty
  endif

  "scrollbar: based upon https://groups.google.com/forum/?fromgroups#!msg/vim_use/TyzX911stPA/NsHJXa2TwecJ
  let bar_width = 40

  " small file? (first and last lines are at screen)
  if( (line('w0') == 1) && (line('w$') == line('$')) )
    let progress_begin = 0
    let progress_size = bar_width
  else
    let progress_begin = line('w0') * bar_width / line('$')
    if( progress_begin >= bar_width )
      let progress_begin = bar_width - 1
    endif

    " last screen? (last line is at screen)
    if( line('w$') == line('$') )
      let progress_size = bar_width - progress_begin
    else
      let progress_size = (line('w$') - line('w0')) * bar_width / line('$')
      if( progress_size == 0 )
        let progress_size = 1
      endif
      if( progress_begin + progress_size > bar_width )
        let progress_size = bar_width - progress_begin
      endif
    endif
  endif

  let before_progress = progress_begin
  let after_progress = bar_width - progress_begin - progress_size

  let bar = '['.repeat('-',before_progress).'%#Hl_status#'.repeat(' ',progress_size).'%*'.repeat('-', after_progress).']'

  "display
  return '['.bufdisplay.']%* <'.buflist_str.' > %#Error#%m%r%* %= %< %F '.bar.' %y %20(%03V [%03c:%03l] %03L%) %P'
endfunction

set stl=%!MyStatusline()

