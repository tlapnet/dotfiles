" Vim color file - vaclavz_2_1_8
" Generated by http://bytefluent.com/vivify 2017-10-25
set background=dark
if version > 580
	hi clear
	if exists("syntax_on")
		syntax reset
	endif
endif

set t_Co=256
let g:colors_name = "vaclavz_cpp"

"hi CTagsMember -- no settings --
"hi CTagsGlobalConstant -- no settings --
"hi Ignore -- no settings --
hi Normal guifg=#0087ff guibg=#000000 guisp=#000000 gui=NONE ctermfg=33 ctermbg=NONE cterm=NONE
"hi CTagsImport -- no settings --
"hi CTagsGlobalVariable -- no settings --
"hi EnumerationValue -- no settings --
"hi Union -- no settings --
"hi EnumerationName -- no settings --
"hi DefinedName -- no settings --
"hi LocalVariable -- no settings --
"hi CTagsClass -- no settings --
"hi clear -- no settings --
hi IncSearch guifg=#ff8800 guibg=#585858 guisp=#585858 gui=NONE,underline ctermfg=208 ctermbg=240 cterm=underline
hi WildMenu guifg=#ffffff guibg=#005eff guisp=#005eff gui=NONE ctermfg=15 ctermbg=27 cterm=NONE
hi SignColumn guifg=#000000 guibg=#5e79a8 guisp=#5e79a8 gui=NONE ctermfg=NONE ctermbg=67 cterm=NONE
hi SpecialComment guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Typedef guifg=#536991 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi Title guifg=#d7d7ff guibg=#000000 guisp=#000000 gui=NONE ctermfg=189 ctermbg=NONE cterm=NONE
hi Folded guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
hi PreCondit guifg=#cf4747 guibg=NONE guisp=NONE gui=NONE ctermfg=167 ctermbg=NONE cterm=NONE
hi Include guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Float guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi StatusLineNC guifg=#a8a8a8 guibg=#212021 guisp=#212021 gui=NONE ctermfg=248 ctermbg=234 cterm=NONE
hi NonText guifg=#5f8787 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi DiffText guifg=#ffff00 guibg=#5f5f00 guisp=#5f5f00 gui=NONE ctermfg=11 ctermbg=58 cterm=NONE
hi ErrorMsg guifg=#ff0000 guibg=#000000 guisp=#000000 gui=NONE ctermfg=196 ctermbg=NONE cterm=NONE
hi Debug guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi PMenuSbar guifg=#ffffff guibg=#383838 guisp=#383838 gui=NONE ctermfg=15 ctermbg=237 cterm=NONE
hi Identifier guifg=#00d7ff guibg=NONE guisp=NONE gui=NONE ctermfg=45 ctermbg=NONE cterm=NONE
hi SpecialChar guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Conditional guifg=#ff5f00 guibg=NONE guisp=NONE gui=NONE ctermfg=202 ctermbg=NONE cterm=NONE
hi StorageClass guifg=#536991 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi Todo guifg=#ff6060 guibg=#000000 guisp=#000000 gui=NONE ctermfg=9 ctermbg=NONE cterm=NONE
hi Special guifg=#d78700 guibg=NONE guisp=NONE gui=NONE ctermfg=172 ctermbg=NONE cterm=NONE
hi LineNr guifg=#6e6e6e guibg=NONE guisp=NONE gui=NONE ctermfg=242 ctermbg=NONE cterm=NONE
hi StatusLine guifg=#5fafd7 guibg=#00005f guisp=#00005f gui=NONE ctermfg=74 ctermbg=17 cterm=NONE
hi Label guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi PMenuSel guifg=#5fafd7 guibg=#262626 guisp=#262626 gui=NONE ctermfg=74 ctermbg=235 cterm=NONE
hi Search guifg=#ff8800 guibg=#000000 guisp=#000000 gui=NONE,underline ctermfg=208 ctermbg=NONE cterm=NONE,underline
hi Delimiter guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Statement guifg=#d1d100 guibg=NONE guisp=NONE gui=NONE ctermfg=184 ctermbg=NONE cterm=NONE
hi SpellRare guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Comment guifg=#787878 guibg=NONE guisp=NONE gui=NONE ctermfg=243 ctermbg=NONE cterm=NONE
hi Character guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi TabLineSel guifg=#5fafd7 guibg=#000000 guisp=#000000 gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
hi Number guifg=#00ffff guibg=NONE guisp=NONE gui=NONE ctermfg=14 ctermbg=NONE cterm=NONE
hi Boolean guifg=#A1A6A8 guibg=NONE guisp=NONE gui=NONE ctermfg=248 ctermbg=NONE cterm=NONE
hi Operator guifg=#c00000 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
"hi CursorLine guifg=NONE guibg=#787878 guisp=NONE gui=NONE ctermfg=NONE ctermbg=243 cterm=NONE
hi CursorLine guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
hi CursorLineNr guifg=#ff8800 guibg=NONE guisp=NONE gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi CursorColumn guifg=#787878 guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=234 cterm=NONE
"hi CursorColumn guifg=NONE guibg=NONE guisp=NONE gui=NONE ctermfg=NONE ctermbg=NONE cterm=NONE
hi TabLineFill guifg=#696969 guibg=#1c1c1c guisp=#1c1c1c gui=NONE ctermfg=242 ctermbg=234 cterm=NONE
hi Question guifg=#5fafd7 guibg=NONE guisp=NONE gui=NONE ctermfg=74 ctermbg=NONE cterm=NONE
hi WarningMsg guifg=#f2f2f2 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=208 ctermbg=NONE cterm=NONE
hi VisualNOS guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=underline ctermfg=235 ctermbg=189 cterm=underline
hi DiffDelete guifg=#ff0000 guibg=#5f0000 guisp=#5f0000 gui=NONE ctermfg=196 ctermbg=52 cterm=NONE
hi ModeMsg guifg=#58bf58 guibg=#192224 guisp=#192224 gui=NONE ctermfg=71 ctermbg=235 cterm=NONE
hi Define guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Function guifg=#5fffff guibg=NONE guisp=NONE gui=NONE ctermfg=87 ctermbg=NONE cterm=NONE
hi FoldColumn guifg=#192224 guibg=#A1A6A8 guisp=#A1A6A8 gui=italic ctermfg=235 ctermbg=248 cterm=NONE
hi PreProc guifg=#d75fd7 guibg=NONE guisp=NONE gui=NONE ctermfg=170 ctermbg=NONE cterm=NONE
hi Visual guifg=#192224 guibg=#F9F9FF guisp=#F9F9FF gui=NONE ctermfg=235 ctermbg=189 cterm=NONE
hi MoreMsg guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi SpellCap guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi VertSplit guifg=#767676 guibg=#262626 guisp=#262626 gui=NONE ctermfg=243 ctermbg=235 cterm=NONE
hi Exception guifg=#c00000 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Keyword guifg=#a9e817 guibg=NONE guisp=NONE gui=NONE ctermfg=112 ctermbg=NONE cterm=NONE
hi Type guifg=#875fff guibg=NONE guisp=NONE gui=NONE ctermfg=99 ctermbg=NONE cterm=NONE
hi DiffChange guifg=#00ffff guibg=#00005f guisp=#00005f gui=NONE ctermfg=14 ctermbg=17 cterm=NONE
hi Cursor guifg=#ffffff guibg=#42819e guisp=#42819e gui=NONE ctermfg=15 ctermbg=67 cterm=NONE
hi SpellLocal guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Error guifg=#A1A6A8 guibg=#912C00 guisp=#912C00 gui=NONE ctermfg=248 ctermbg=88 cterm=NONE
hi PMenu guifg=#a8a8a8 guibg=#0f0e0f guisp=#0f0e0f gui=italic ctermfg=248 ctermbg=233 cterm=NONE
hi SpecialKey guifg=#5E6C70 guibg=NONE guisp=NONE gui=italic ctermfg=66 ctermbg=NONE cterm=NONE
hi Constant guifg=#ffd700 guibg=NONE guisp=NONE gui=NONE ctermfg=220 ctermbg=NONE cterm=NONE
hi Tag guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi String guifg=#5fd75f guibg=NONE guisp=NONE gui=NONE ctermfg=77 ctermbg=NONE cterm=NONE
hi PMenuThumb guifg=#2b82ad guibg=#a8a8a8 guisp=#a8a8a8 gui=NONE ctermfg=31 ctermbg=248 cterm=NONE
hi MatchParen guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Repeat guifg=#ff5f5f guibg=NONE guisp=NONE gui=NONE ctermfg=203 ctermbg=NONE cterm=NONE
hi SpellBad guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi Directory guifg=#536991 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi Structure guifg=#536991 guibg=NONE guisp=NONE gui=NONE ctermfg=60 ctermbg=NONE cterm=NONE
hi Macro guifg=#BD9800 guibg=NONE guisp=NONE gui=NONE ctermfg=1 ctermbg=NONE cterm=NONE
hi Underlined guifg=#F9F9FF guibg=#192224 guisp=#192224 gui=underline ctermfg=189 ctermbg=235 cterm=underline
hi DiffAdd guifg=#00ff5e guibg=#006900 guisp=#006900 gui=NONE ctermfg=47 ctermbg=22 cterm=NONE
hi TabLine guifg=#a8a8a8 guibg=#262626 guisp=#262626 gui=NONE ctermfg=248 ctermbg=235 cterm=NONE
hi cursorim guifg=#192224 guibg=#536991 guisp=#536991 gui=NONE ctermfg=235 ctermbg=60 cterm=NONE
