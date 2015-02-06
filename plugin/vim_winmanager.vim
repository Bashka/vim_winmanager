" Date Create: 2015-02-04 11:25:01
" Last Change: 2015-02-06 10:37:48
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:Plugin = vim_lib#sys#Plugin#
let s:System = vim_lib#sys#System#.new()

let s:p = s:Plugin.new('vim_winmanager', '1')

call s:p.map('<C-w>', 'startWinMode')

call s:p.reg()
