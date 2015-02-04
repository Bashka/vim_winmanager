" Date Create: 2015-02-04 11:25:01
" Last Change: 2015-02-04 16:12:34
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:Plugin = vim_lib#sys#Plugin#
let s:System = vim_lib#sys#System#.new()

let s:p = s:Plugin.new('vim_winmanager', '1')

function! s:p.run() " {{{
endfunction " }}}

call s:p.map('<C-y>', 'quitCurrentWindow')
call s:p.map('<C-n>', 'newWinTop')
call s:p.map('<C-j>', 'next')
call s:p.map('<C-k>', 'prev')
call s:p.map('<C-w>', 'startWinMode')

call s:p.reg()
