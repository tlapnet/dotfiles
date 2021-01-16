" Vim syntax file
" Language:         /var/log/shaperd/*.log file
" Maintainer:       Vaclav Zindulka
" Latest Revision:  2008-06-29
" Changes:          2008-06-29 support for RFC3339 tuimestamps James Vega

if exists("b:current_syntax")
  finish
endif

let s:cpo_save = &cpo
set cpo&vim

" Nov  9 16:11:12 xubuntu cExit_fPrintMessage:(Info)[2477]: Legalni konec programu

"syn match   messagesBegin       display '^' nextgroup=messagesDate,messagesDateRFC3339
syn match   messagesBegin       display '^' nextgroup=messagesDate

" Nov  9
syn match   messagesDate        contained display '[[:lower:][:upper:]][[:lower:][:upper:]][[:lower:][:upper:]] [ 0-9]\d *'
                                \ nextgroup=messagesHour

" 16:11:12
syn match   messagesHour        contained display '\d\d:\d\d:\d\d\s*'
                                \ nextgroup=messagesHost

"syn match   messagesDateRFC3339 contained display '\d\{4}-\d\d-\d\d'
"                                \ nextgroup=messagesRFC3339T

"syn match   messagesRFC3339T    contained display '\cT'
"                                \ nextgroup=messagesHourRFC3339

"syn match   messagesHourRFC3339 contained display '\c\d\d:\d\d:\d\d\(\.\d\+\)\=\([+-]\d\d:\d\d\|Z\)'
"                                \ nextgroup=messagesHost

" xubuntu
syn match   messagesHost        contained display '\S*\s*'
                                \ nextgroup=messagesLabel

" cExit_fPrintMessage:(Info)[2477]:
syn match   messagesLabel       contained display '\s*[^:]*:([^)]*)[^:]*:\s*'
								\ nextgroup=messagesText 
								\ contains=messagesException,messagesError,messagesWarning,messagesInfo,messagesDebug,messagesDevel,messagesAsync

" slouzi pro zvyrazneni urovne logu za funkci
" Info
syn match   messagesSeverity    contained display 'Devel\|Debug\|Info\|Warning\|Error\|Exception'


" cervene zvyraznovane radky Exception logu
"syn match   messagesException   contained '\c.*\<\(Exception\).*'
syn match   messagesException   contained '\c.*(\<\(Exception\).*'
                                \ contains=messagesNumber,messagesURL,messagesSeverity,messagesPID,messagesAsync,messagesCommand

" cervene zvyraznovane radky Error logu
syn match   messagesError       contained '\c.*(\<\(Error\).*'
                                \ contains=messagesNumber,messagesURL,messagesSeverity,messagesPID,messagesAsync,messagesCommand

" oranzove zvyraznovane radky Warning logu
syn match   messagesWarning     contained '\c.*(\<\(Warning\).*'
                                \ contains=messagesNumber,messagesURL,messagesSeverity,messagesPID,messagesAsync,messagesCommand

" zelene zvyraznovane radky Info logu
syn match   messagesInfo        contained '\c.*(\<\(Info\).*'
                                \ contains=messagesNumber,messagesURL,messagesSeverity,messagesPID,messagesAsync,messagesCommand

" zvyraznuje radky debu logu
syn match   messagesDebug       contained '\c.*(\<\(Debug\)\>).*'
                                \ contains=messagesNumber,messagesTime,messagesSeverity,messagesPID,messagesAsync,messageSuccess

" zvyrazneni textu logovane zpravy - obsahuje dalsi veci ke zvyrazneni
syn match   messagesText        contained display '.*'
                                \ contains=messagesNumber,messagesURL,messagesAsync,messagesCommand

" zelene zvyrazneni radku obsahujiciho slovo Uspesne
syn match   messageSuccess		contained display '\<\(Uspesne\|Uspesna\)\>.*'
								\ contains=messagesNumber

" cervene zvyrazneni radku obsahujiciho slovo Problem
syn match   messagesError		contained display 'Problem.*'
								\ contains=messagesNumber

" log_function_ASYNC - oznacuje funkci s asynchronnim volanim
syn match   messagesAsync		contained display 'ASYNC'

" [2477]
"syn match   messagesPID         contained display '\[\zs\d\+\ze\]'
syn match   messagesPID         contained display '\(\[\d\+\]\)'

" zvyrazneni www..* odkazu
syn match   messagesURL         contained '\(\w\+://\S\+\)'

" zvyrazneni celeho radku s prikazem
" class add dev ifb0, qdisc del dev
syn match	messagesCommand		contained '\<\(class\|qdisc\|filter\)\>\ \<\(add\|del\|change\|replace\)\>\ \<\(dev\>.*\)'
								\ contains=messagesIP,messagesNumber

syn match   messagesNumber      contained display '0x[0-9a-fA-F]*\|\[<[0-9a-f]\+>\]\|\<\d[0-9a-fA-F]*'
								\ contains=messagesIP

syn match   messagesIP          contained display '[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\.[0-9]\{1,3\}\/*[0-9]*'

syn match   messagesTime        contained '\(celkovy cas=.*us\)'


hi def link messagesDate        Constant
hi def link messagesHour        Type
hi def link messagesDateRFC3339 Constant
hi def link messagesHourRFC3339 Type
hi def link messagesRFC3339T    Normal
hi def link messagesHost        Normal
hi def link messagesLabel       String
hi def link messagesPID         Type
hi def link messagesKernel      Special
hi def link messagesError       ErrorMsg
hi def link messagesWarning     WarningMsg
hi def link messagesInfo        String
hi def link messagesDebug       Comment
hi def link messagesDevel       Comment
hi def link messagesAsync		Normal
hi def link messageSuccess      String
hi def link messagesTime        Constant
hi def link messagesException   ErrorMsg
hi def link messagesSeverity    Constant
hi def link messagesCommand     Constant
hi def link messagesIP		    Number
hi def link messagesURL         Underlined
hi def link messagesText        Comment
hi def link messagesNumber      Number

let b:current_syntax = "messages"

let &cpo = s:cpo_save
unlet s:cpo_save
