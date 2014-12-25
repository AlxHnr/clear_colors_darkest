" Copyright (c) 2014 Alexander Heinrich <alxhnr@nudelpost.de> {{{
"
" This software is provided 'as-is', without any express or implied
" warranty. In no event will the authors be held liable for any damages
" arising from the use of this software.
"
" Permission is granted to anyone to use this software for any purpose,
" including commercial applications, and to alter it and redistribute it
" freely, subject to the following restrictions:
"
"    1. The origin of this software must not be misrepresented; you must
"       not claim that you wrote the original software. If you use this
"       software in a product, an acknowledgment in the product
"       documentation would be appreciated but is not required.
"
"    2. Altered source versions must be plainly marked as such, and must
"       not be misrepresented as being the original software.
"
"    3. This notice may not be removed or altered from any source
"       distribution.
" }}}

highlight clear
if exists('syntax_on')
  syntax reset
endif
let g:colors_name = 'clear_colors_darkest'

let s:colors =
  \ {
  \   'Normal'                 : { 'bg'   : '16',        'fg' : '245' },
  \   'Comment'                : { 'fg'   : '240' },
  \   'SpecialComment'         : { 'font' : 'bold',      'fg' : '240' },
  \   'Include'                : { 'fg'   : '239' },
  \   'Constant'               : { 'fg'   : '137' },
  \   'String'                 : { 'fg'   : '65' },
  \   'Character'              : { 'font' : 'bold',      'fg' : '65' },
  \   'Number'                 : { 'fg'   : '95' },
  \   'Identifier'             : { 'fg'   : '96' },
  \   'Function'               : { 'fg'   : '67' },
  \   'Underlined'             : { 'font' : 'underline', 'fg' : '67' },
  \   'Folded'                 : { 'bg'   : '233',       'fg' : '67' },
  \   'FoldColumn'             : { 'bg'   : '233',       'fg' : '67' },
  \   'SignColumn'             : { 'font' : 'bold',      'bg' : '233' },
  \   'ColorColumn'            : { 'bg'   : '233' },
  \   'Conceal'                : { 'fg'   : '235' },
  \   'Tag'                    : { 'font' : 'bold',      'fg' : '96' },
  \   'Error'                  : { 'font' : 'underline', 'fg' : '131' },
  \   'SpellRare'              : { 'font' : 'underline', 'fg' : '96' },
  \   'Todo'                   : { 'font' : 'bold',      'fg' : '137' },
  \   'CursorLine'             : { 'bg'   : '233' },
  \   'CursorLineNr'           : { 'bg'   : '234',       'fg' : '238' },
  \   'MatchParen'             : { 'font' : 'bold',      'bg' : '53',  'fg' : '249' },
  \   'StatusLine'             : { 'bg'   : '233' },
  \   'DiffAdd'                : { 'bg'   : '65',        'fg' : '253' },
  \   'DiffDelete'             : { 'bg'   : '95',        'fg' : '95' },
  \   'DiffChange'             : { 'bg'   : '96',        'fg' : '251' },
  \   'DiffText'               : { 'bg'   : '66',        'fg' : '253' },
  \   'VertSplit'              : { 'bg'   : '233',       'fg' : '233' },
  \   'Search'                 : { 'bg'   : '236',       'fg' : '245' },
  \   'IncSearch'              : { 'font' : 'bold',      'bg' : '65',  'fg' : '16' },
  \   'LineNr'                 : { 'bg'   : '233',       'fg' : '237' },
  \   'TabLine'                : { 'font' : 'underline', 'bg' : '16', 'fg' : '238' },
  \   'TabLineSel'             : { 'font' : 'underline', 'bg' : '235', 'fg' : '244' },
  \   'Visual'                 : { 'bg'   : '239',       'fg' : '246' },
  \   'Pmenu'                  : { 'bg'   : '237',       'fg' : '244' },
  \   'Pmenusel'               : { 'bg'   : '242',       'fg' : '248' },
  \   'PmenuSbar'              : { 'bg'   : '241' },
  \   'PmenuThumb'             : { 'bg'   : '245' },
  \   'SpecialKey'             : { 'fg'   : '95' },
  \   'WildMenu'               : { 'bg'   : '239',       'fg' : '246' },
  \   'OutOfTextwidth'         : { 'font' : 'underline', 'bg' : '238', 'fg' : '95' },
  \   'SyntasticErrorSign'     : { 'font' : 'bold',      'bg' : '233', 'fg' : '131' },
  \   'SyntasticWarningSign'   : { 'font' : 'bold',      'bg' : '233', 'fg' : '137' },
  \   'CtrlPNoEntries'         : { 'fg'   : '131' },
  \   'SignifySignAdd'         : { 'font' : 'bold',      'bg' : '233', 'fg' : '65' },
  \   'SignifySignChange'      : { 'font' : 'bold',      'bg' : '233', 'fg' : '137' },
  \   'SignifySignDelete'      : { 'font' : 'bold',      'bg' : '233', 'fg' : '131' },
  \   'SignifyLineDelete'      : { 'bg'   : '95',        'fg' : '252' },
  \   'EasyMotionTarget'       : { 'font' : 'bold',      'fg' : '131' },
  \   'EasyMotionTarget2First' : { 'font' : 'bold',      'fg' : '137' },
  \   'SneakPluginTarget'      : { 'bg'   : '67',        'fg' : '234' },
  \   'SneakPluginScope'       : { 'bg'   : '16',        'fg' : '245' },
  \   'SneakStreakCursor'      : { 'font' : 'bold',      'bg' : '236', 'fg' : '131' },
  \   'ExtraWhitespace'        : { 'bg'   : '88',        'fg' : '88' },
  \   'notesFixme'             : { 'font' : 'bold',      'fg' : '95' },
  \   'notesInProgress'        : { 'font' : 'bold',      'fg' : '67' },
  \   'notesDoneMarker'        : { 'font' : 'bold',      'fg' : '65' },
  \   'GundoCurrentLocation'   : { 'font' : 'bold',      'fg' : '67' },
  \   'plugError'              : { 'fg'   : '131' },
  \   'painterPaletteWhite'    : { 'bg' : '245',         'fg' : '245' },
  \   'painterPaletteRed'      : { 'bg' : '95',          'fg' : '95' },
  \   'painterPaletteBlue'     : { 'bg' : '67',          'fg' : '67' },
  \   'painterPaletteYellow'   : { 'bg' : '137',         'fg' : '137' },
  \   'painterPaletteGreen'    : { 'bg' : '65',          'fg' : '65' },
  \   'painterCanvasEmpty'     : { 'bg' : '16',          'fg' : '16' },
  \ }

" Apply the colors and highlighting groups.
call clear_colors#apply_colors(s:colors)
call clear_colors#apply_common_highlights()
