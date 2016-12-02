
set background=dark
hi clear
if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "mycolors"

hi Normal term=NONE cterm=NONE ctermbg=4 ctermfg=223 gui=None guibg=DarkSlateGray guifg=Wheat
hi LineNr term=underline cterm=bold ctermbg=234 ctermfg=143 gui=None guibg=Grey11 guifg=DarkKhaki
"hi StatusLine term=bold,reverse cterm=bold ctermbg=0 ctermfg=232 gui=None guibg=Black guifg=Khaki
"hi StatusLineNC term=bold,reverse cterm=bold ctermbg=0 ctermfg=232 gui=None guibg=Black guifg=Khaki
"hi Hl_status term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi TabLine ctermfg=0 ctermbg=229 gui=None guifg=DarkKhaki guibg=Black
hi TabLineFill ctermfg=0 ctermbg=229 gui=None guifg=DarkKhaki guibg=Black
hi TabLineSel ctermfg=238 ctermbg=112 gui=None guifg=Black guibg=chartreuse2
" MiniBufExpl Colors

hi MBENormal               ctermfg=240 ctermbg=236 guifg=#808080 guibg=#303030
hi MBEChanged              ctermfg=red ctermbg=236 guifg=#ff5f00 guibg=#303030
hi MBENormalSilentChar     ctermfg=236 ctermbg=236 guifg=#303030 guibg=#303030

hi MBEVisibleNormal        ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
hi MBEVisibleChanged       ctermfg=red ctermbg=190 guifg=red guibg=#dfff00
hi MBEVisibleActiveNormal  ctermfg=17 ctermbg=190 guifg=#00005f guibg=#dfff00
hi MBEVisibleActiveChanged ctermfg=red ctermbg=190 guifg=red guibg=#dfff00
hi MBEVisibleSilentChar    ctermfg=190 ctermbg=190 guifg=#dfff00 guibg=#dfff00

hi SignColor term=NONE cterm=NONE ctermbg=yellow ctermfg=fg gui=None guibg=Grey11 guifg=yellow

hi SignColumn term=NONE cterm=NONE ctermbg=yellow ctermfg=fg gui=None guibg=Grey8 guifg=yellow
hi BookmarkSign ctermbg=yellow ctermfg=blue guibg=Grey8 guifg=orange
hi BookmarkAnnotationSign ctermbg=blue ctermfg=fg guibg=Grey8 guifg=orange
hi BookmarkLine ctermbg=yellow ctermfg=fg guibg=orange guifg=blue4
hi BookmarkAnnotationLine ctermbg=blue ctermfg=fg guibg=orange guifg=blue4

"hi MBEVisibleActiveuguifg=Black guibg=chartreuse2
"hi MBEVisibleChangedActive guifg=Black guibg=chartreuse2
"hi MBEVisibleChanged guifg=fg guibg=bg
"hi MBEVisibleNormal guifg=fg guibg=bg
"hi MBEChanged guifg=fg guibg=bg
"hi MBENormal guifg=fg guibg=bg

hi cppMinMax term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg

hi cCppParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cCppBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cBlock term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cUserCont term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cBitField term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cNumbersCom term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cParen term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cBracket term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi cNumbers term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi MatchParen term=reverse cterm=NONE ctermbg=30 ctermfg=fg gui=None guibg=DarkCyan guifg=fg

hi PreProc term=underline cterm=NONE ctermbg=bg ctermfg=226 gui=None guibg=bg guifg=Yellow2

hi Type term=underline cterm=bold ctermbg=bg ctermfg=159 gui=None guibg=bg guifg=PaleTurquoise
hi Underlined term=underline cterm=underline ctermbg=bg ctermfg=111 gui=None guibg=bg guifg=#80a0ff
hi Ignore term=NONE cterm=NONE ctermbg=bg ctermfg=23 gui=None guibg=bg guifg=bg

hi Error term=reverse cterm=bold ctermbg=196 ctermfg=231 gui=None guibg=Red guifg=White
hi ErrorMsg term=NONE cterm=bold ctermbg=196 ctermfg=231 gui=None guibg=Red guifg=White
hi Todo term=NONE cterm=bold ctermbg=213 ctermfg=16 gui=None guibg=Orchid1 guifg=Black

hi String term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=None guibg=bg guifg=Aquamarine
hi Character term=NONE cterm=NONE ctermbg=bg ctermfg=122 gui=None guibg=bg guifg=Aquamarine
hi Number term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightBlue
hi Boolean term=NONE cterm=NONE ctermbg=bg ctermfg=195 gui=None guibg=bg guifg=LightCyan
hi Float term=NONE cterm=NONE ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightBlue

hi Comment term=bold cterm=NONE ctermbg=bg ctermfg=170 gui=None guibg=bg guifg=Orchid
hi Constant term=underline cterm=NONE ctermbg=bg ctermfg=122 gui=None guibg=bg guifg=Aquamarine
hi Special term=bold cterm=NONE ctermbg=bg ctermfg=203 gui=None guibg=bg guifg=Tomato
hi Identifier term=underline cterm=NONE ctermbg=bg ctermfg=182 gui=None guibg=bg guifg=Thistle
hi Statement term=bold cterm=bold ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightSteelBlue
hi Macro term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=None guibg=bg guifg=Yellow2
hi PreCondit term=NONE cterm=bold ctermbg=bg ctermfg=226 gui=None guibg=bg guifg=Yellow2
hi StorageClass term=NONE cterm=NONE ctermbg=bg ctermfg=46 gui=None guibg=bg guifg=Green
hi Structure term=NONE cterm=NONE ctermbg=bg ctermfg=37 gui=None guibg=bg guifg=LightSeaGreen
hi Typedef term=NONE cterm=NONE ctermbg=bg ctermfg=159 gui=None guibg=bg guifg=PaleTurquoise
hi Tag term=NONE cterm=NONE ctermbg=bg ctermfg=143 gui=None guibg=bg guifg=DarkKhaki
hi SpecialChar term=NONE cterm=underline ctermbg=bg ctermfg=122 gui=None guibg=bg guifg=Aquamarine

hi Delimiter term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightSteelBlue
hi Function term=NONE cterm=bold ctermbg=bg ctermfg=231 gui=None guibg=bg guifg=White
hi Conditional term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightSteelBlue
hi Repeat term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=None guibg=bg guifg=SteelBlue
hi Label term=NONE cterm=bold ctermbg=bg ctermfg=67 gui=None guibg=bg guifg=SteelBlue
hi Operator term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightSteelBlue
hi Keyword term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightSteelBlue
hi Exception term=NONE cterm=bold ctermbg=bg ctermfg=152 gui=None guibg=bg guifg=LightSteelBlue

hi Include term=NONE cterm=NONE ctermbg=bg ctermfg=184 gui=None guibg=bg guifg=Yellow3
hi Define term=NONE cterm=NONE ctermbg=bg ctermfg=226 gui=None guibg=bg guifg=Yellow2
hi SpecialKey term=bold cterm=NONE ctermbg=bg ctermfg=51 gui=None guibg=bg guifg=Cyan
hi Debug term=NONE cterm=bold ctermbg=bg ctermfg=196 gui=None guibg=bg guifg=Red


hi Directory term=bold cterm=NONE ctermbg=bg ctermfg=195 gui=None guibg=bg guifg=LightCyan

hi IncSearch term=reverse cterm=bold ctermbg=231 ctermfg=16 gui=None guibg=White guifg=Black
hi Search term=reverse cterm=bold ctermbg=220 ctermfg=16 gui=None guibg=Gold guifg=Black

hi MoreMsg term=bold cterm=bold ctermbg=bg ctermfg=37 gui=None guibg=bg guifg=LightSeaGreen
hi ModeMsg term=bold cterm=bold ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi WarningMsg term=NONE cterm=NONE ctermbg=203 ctermfg=231 gui=None guibg=Tomato guifg=White
hi NonText term=bold cterm=bold ctermbg=bg ctermfg=231 gui=None guibg=bg guifg=White

hi SpecialComment term=NONE cterm=bold ctermbg=bg ctermfg=170 gui=None guibg=bg guifg=Orchid
hi cMulti term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg
hi SpellLocal term=underline cterm=undercurl ctermbg=bg ctermfg=51 gui=None guibg=bg guifg=fg guisp=Cyan

hi Pmenu term=NONE cterm=NONE ctermbg=201 ctermfg=fg gui=None guibg=Magenta guifg=fg
hi PmenuSel term=NONE cterm=NONE ctermbg=248 ctermfg=fg gui=None guibg=DarkGrey guifg=fg
hi PmenuSbar term=NONE cterm=NONE ctermbg=250 ctermfg=fg gui=None guibg=Grey guifg=fg
hi PmenuThumb term=NONE cterm=reverse ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg

hi WildMenu term=NONE cterm=bold ctermbg=226 ctermfg=16 gui=None guibg=Yellow guifg=Black

hi CursorColumn term=reverse cterm=NONE ctermbg=241 ctermfg=fg gui=None guibg=Grey40 guifg=fg
hi CursorLine term=underline cterm=NONE ctermbg=241 ctermfg=fg gui=None guibg=Grey40 guifg=fg

hi Question term=NONE cterm=bold ctermbg=bg ctermfg=203 gui=None guibg=bg guifg=Tomato


hi VertSplit term=reverse cterm=bold ctermbg=16 ctermfg=143 gui=None guibg=Black guifg=Black

hi Title term=bold cterm=bold ctermbg=bg ctermfg=203 gui=None guibg=bg guifg=Tomato

hi Visual term=reverse cterm=NONE ctermbg=223 ctermfg=16 gui=None guibg=fg guifg=Black
hi VisualNOS term=bold,underline cterm=bold ctermbg=223 ctermfg=16 gui=None guibg=fg guifg=Black

hi Folded term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=None guibg=DarkKhaki guifg=Black
hi FoldColumn term=NONE cterm=NONE ctermbg=143 ctermfg=16 gui=None guibg=DarkKhaki guifg=Black

hi CursorIM term=NONE cterm=NONE ctermbg=213 ctermfg=fg gui=None guibg=Orchid1 guifg=fg
hi ColorColumn term=reverse cterm=NONE ctermbg=88 ctermfg=fg gui=None guibg=DarkRed guifg=fg
hi Cursor term=NONE cterm=NONE ctermbg=170 ctermfg=223 gui=None guibg=Orchid guifg=fg
hi lCursor term=NONE cterm=NONE ctermbg=223 ctermfg=23 gui=None guibg=fg guifg=bg

hi DiffAdd term=bold cterm=NONE ctermbg=66 ctermfg=fg gui=None guibg=DarkSlateGray4 guifg=fg
hi DiffChange term=bold cterm=NONE ctermbg=95 ctermfg=fg gui=None guibg=Pink4 guifg=fg
hi DiffDelete term=bold cterm=bold ctermbg=16 ctermfg=223 gui=None guibg=Black guifg=fg
hi DiffText term=reverse cterm=bold ctermbg=62 ctermfg=fg gui=None guibg=SlateBlue3 guifg=fg

hi Conceal term=NONE cterm=NONE ctermbg=bg ctermfg=fg gui=None guibg=bg guifg=fg

hi SpellBad term=reverse cterm=undercurl ctermbg=bg ctermfg=196 gui=None guibg=bg guifg=fg guisp=Red
hi SpellCap term=reverse cterm=undercurl ctermbg=bg ctermfg=21 gui=None guibg=bg guifg=fg guisp=Blue
hi SpellRare term=reverse cterm=undercurl ctermbg=bg ctermfg=201 gui=None guibg=bg guifg=fg guisp=Magenta

"set laststatus=2
hi StatusLine ctermfg=0 ctermbg=229 gui=None guifg=DarkKhaki guibg=Black
hi StatusLineNC ctermfg=23 ctermbg=229 gui=None guifg=DarkKhaki guibg=DarkSlateGray4
hi Hl_status ctermfg=238 ctermbg=112 gui=None guifg=Black guibg=chartreuse2


