if exists("b:current_syntax")
    finish
endif

" Keywords
syn keyword asisTodo TODO FIXME contained
syn keyword asisLineKeyword line contained nextgroup=asisLiteral skipwhite
syn keyword asisDescriptionKeyword description details contained nextgroup=asisDescriptionBlock skipwhite
syn keyword asisArgumentKeyword argument contained nextgroup=asisArgBlockVarName skipwhite
syn keyword asisDefineKeyword define contained nextgroup=asisDefineBlock skipwhite
syn keyword asisClickDefKeyword click contained
syn keyword asisFpsKeyword fps contained
syn keyword asisMainKeyword main contained nextgroup=asisFormalArgDecl skipwhite
syn keyword asisType vector time boolean char literal int void contained nextgroup=asisIdenfitier skipwhite
syn keyword asisExecKeyword executable nextgroup=asisExecIdentifier skipwhite
syn keyword asisSingleStmt break continue reset exit contained nextgroup=asisSemiCol skipwhite
syn keyword asisButtonStmt press release click contained nextgroup=asisButton,asisButtonAll skipwhite
syn keyword asisButton A B X Y L R ZL ZR L3 R3 PLUS MINUS HOME SHARE contained nextgroup=asisButtonComma,asisSemiCol skipwhite
syn keyword asisButtonAll all contained nextgroup=asisSemiCol skipwhite
syn keyword asisWaitStmt wait contained nextgroup=asisWaitTime skipwhite
syn keyword asisDpadStmt dpad contained nextgroup=asisDpad,asisDpadNone skipwhite
syn keyword asisDpad up down left right contained nextgroup=asisDpadComma,asisSemiCol skipwhite
syn keyword asisDpad2 up down left right contained nextgroup=asisSemiCol skipwhite 
syn keyword asisDpadNone none contained nextgroup=asisSemiCol skipwhite
syn keyword asisStickStmt stick contained nextgroup=asisStickSelect skipwhite
syn keyword asisStickSelect left right both contained nextgroup=asisStickNeutral,asisVecMainDir,asisArbDir,asisStickVectorIdentifier skipwhite
syn keyword asisStickNeutral neutral contained nextgroup=asisStickComma,asisSemiCol skipwhite
syn keyword asisVecMainDir N E W S NE NW SE SW contained nextgroup=asisMagnitude skipwhite
syn keyword asisFull full contained nextgroup=asisStickComma,asisSemiCol skipwhite
syn keyword asisOf of contained nextgroup=asisVecMainDir skipwhite
syn keyword asisBoolean true false contained nextgroup=asisSemiCol skipwhite
syn keyword asisRawStmt raw contained nextgroup=asisRawCode skipwhite

" Matches
syn match asisLineComment "\v//.*$" contains=asisTodo
syn match asisSemiCol ";" contained
syn match asisComma "\," contained
syn match asisButtonComma "\," contained nextgroup=asisButton skipwhite
syn match asisDpadComma "\," contained nextgroup=asisDpad2 skipwhite
syn match asisStickComma "\," contained nextgroup=asisStickSelect skipwhite
syn match asisAssign "\(<-\|<<\)" contained nextgroup=asisStickNeutral,asisVecMainDir,asisArbDir,asisWaitTime,asisInteger,asisLiteral,asisChar,asisBoolean,asisRawStmt,asisIdentifier skipwhite
syn match asisArgBlockVarName '\i\+' contained nextgroup=asisDescriptionBlock skipwhite
syn match asisClickDefinition '\v<click\s+\d+f>' contained contains=asisFrameSpec,asisClickDefKeyword
syn match asisFrameSpec '\d\+f' contained
syn match asisFpsDefinition '\v<fps\s+\d+>' contained contains=asisFpsKeyword,asisUInteger
syn match asisFormalArg '\v<(vector|time|literal|boolean|char|int|unchecked|void)\s+\i+>' contained contains=asisType,asisIdentifier
syn match asisIdentifier '\<\i\+\>' contained nextgroup=asisAssign,asisSemiCol skipwhite
syn match asisExecIdentifier '\<\i\+\>' contained nextgroup=asisExecDef skipwhite
syn match asisStickVectorIdentifier '\<\i\+\>' contained nextgroup=asisStickComma,asisSemiCol skipwhite
syn match asisMagnitude '\(\d\+\|\d\+\.\d*%\|full\)' contained contains=asisPercentage,asisFull nextgroup=asisStickComma,asisSemiCol skipwhite
syn match asisArbDir '\v(\d+|\d+\.\d*)d\s+[NEWS]\s+of\s+[NEWS]' contained contains=asisDegree,asisVecMainDir,asisOf nextgroup=asisMagnitude skipwhite

syn match asisUInteger '\<\d\+\>' contained
syn match asisEscape '\v\\(\\|L|R|U|D|O|F|E|")' contained
syn match asisInteger '[-+]\?\<\d\+\>' contained nextgroup=asisSemiCol skipwhite
syn match asisWaitTime '\v<\d+(s|ms|f)>' contained nextgroup=asisSemiCol skipwhite
syn match asisPercentage '\(\d\+\|\d\+\.\d*\)%' contained
syn match asisDegree '\(\d\+\|\d\+\.\d*\)d' contained

" Region
syn region asisBlockComment start="\/\*" end="\*\/" contains=asisTodo
syn region asisLiteral start='"' end='"' contained contains=asisEscape nextgroup=asisSemiCol skipwhite
syn region asisChar start="'" end="'" contained contains=asisEscape nextgroup=asisSemiCol skipwhite
syn region asisRawCode start="<\/" end="\/>" contained nextgroup=asisSemiCol skipwhite contains=asisLineComment,asisBlockComment

syn region asisDescriptionBlock start="{" end="}" fold transparent contained contains=asisLineKeyword,asisLiteral,asisSemiCol
syn region asisDefineBlock start="{" end="}" fold transparent contained contains=asisClickDefinition,asisSemiCol,asisFpsDefinition
syn region asisFormalArgDecl start="(" end=")" transparent contained contains=asisFormalArg,asisComma nextgroup=asisCode skipwhite
syn region asisExecDef start="{" end="}" fold transparent contained contains=asisDescriptionKeyword,asisArgumentKeyword,asisDefineKeyword,asisMainKeyword
syn region asisCode start="{" end="}" fold transparent contained contains=asisSingleStmt,asisButtonStmt,asisWaitStmt,asisDpadStmt,asisStickStmt,asisType,asisAssign,asisIdentifier,asisRawStmt

" Highlight
let b:current_syntax="aproj"

hi def link asisTodo Todo
hi def link asisLineKeyword Statement
hi def link asisDescriptionKeyword Keyword
hi def link asisArgumentKeyword Keyword
hi def link asisDefineKeyword Keyword
hi def link asisClickDefKeyword Keyword
hi def link asisFpsKeyword Keyword
hi def link asisMainKeyword Keyword
hi def link asisType Type
hi def link asisExecKeyword Keyword
hi def link asisSingleStmt Statement
hi def link asisButtonStmt Statement
hi def link asisWaitStmt Statement
hi def link asisDpadStmt Statement
hi def link asisStickStmt Statement

hi def link asisButton Constant
hi def link asisButtonAll Keyword
hi def link asisDpad Constant
hi def link asisDpad2 Constant
hi def link asisDpadNone Keyword
hi def link asisStickSelect Keyword
hi def link asisStickNeutral Keyword
hi def link asisVecMainDir Constant 
hi def link asisFull Keyword
hi def link asisOf Keyword
hi def link asisBoolean Constant

hi def link asisRawStmt Statement

hi def link asisLineComment Comment
hi def link asisSemiCol Comment
hi def link asisComma Comment
hi def link asisButtonComma Comment
hi def link asisDpadComma Comment
hi def link asisStickComma Comment
hi def link asisArgBlockVarName Identifier
hi def link asisFrameSpec Constant 
hi def link asisIdentifier Identifier
hi def link asisExecIdentifier Identifier
hi def link asisWaitTime Constant
hi def link asisStickVectorIdentifier Identifier

hi def link asisBlockComment Comment
hi def link asisRawCode PreProc
hi def link asisLiteral String
hi def link asisChar Constant 

hi def link asisUInteger Constant
hi def link asisEscape Constant
hi def link asisInteger Constant
hi def link asisPercentage Constant
hi def link asisDegree Constant
