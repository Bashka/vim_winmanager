" Date Create: 2015-02-04 11:29:12
" Last Change: 2015-02-08 10:44:51
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:System = vim_lib#sys#System#.new()
let s:Publisher = vim_lib#sys#Publisher#.new()

" Обработчики событий режима управления окнами. {{{
function! vim_winmanager#quitCurrentWindow() " {{{
  q
endfunction " }}}

function! vim_winmanager#newWinTop() " {{{
  lefta new
endfunction " }}}

function! vim_winmanager#newWinBottom() " {{{
  rightb new
endfunction " }}}

function! vim_winmanager#newWinLeft() " {{{
  lefta vnew
endfunction " }}}

function! vim_winmanager#newWinRight() " {{{
  rightb vnew
endfunction " }}}

function! vim_winmanager#left() " {{{
  wincmd h
endfunction " }}}

function! vim_winmanager#right() " {{{
  wincmd l
endfunction " }}}

function! vim_winmanager#top() " {{{
  wincmd k
endfunction " }}}

function! vim_winmanager#bottom() " {{{
  wincmd j
endfunction " }}}

function! vim_winmanager#next() " {{{
  wincmd w
endfunction " }}}

function! vim_winmanager#prev() " {{{
  wincmd W
endfunction " }}}

function! vim_winmanager#move() " {{{
  wincmd x
endfunction " }}}

function! vim_winmanager#resizeEqual() " {{{
  wincmd =
endfunction " }}}

function! vim_winmanager#resizeIncG() " {{{
  resize +2
endfunction " }}}

function! vim_winmanager#resizeDecG() " {{{
  resize -2
endfunction " }}}

function! vim_winmanager#resizeIncV() " {{{
  vertical resize +5
endfunction " }}}

function! vim_winmanager#resizeDecV() " {{{
  vertical resize -5
endfunction " }}}
" }}}

function! vim_winmanager#startWinMode() " {{{
  call s:System.map('n', 'h', function('vim_winmanager#left'))
  call s:System.map('n', 'l', function('vim_winmanager#right'))
  call s:System.map('n', 'j', function('vim_winmanager#bottom'))
  call s:System.map('n', 'k', function('vim_winmanager#top'))

  call s:System.map('n', 'J', function('vim_winmanager#newWinBottom'))
  call s:System.map('n', 'K', function('vim_winmanager#newWinTop'))
  call s:System.map('n', 'H', function('vim_winmanager#newWinLeft'))
  call s:System.map('n', 'L', function('vim_winmanager#newWinRight'))

  call s:System.map('n', 'r', function('vim_winmanager#move'))
  
  call s:System.map('n', '=', function('vim_winmanager#resizeEqual'))
  call s:System.map('n', '+', function('vim_winmanager#resizeIncG'))
  call s:System.map('n', '-', function('vim_winmanager#resizeDecG'))
  call s:System.map('n', '>', function('vim_winmanager#resizeIncV'))
  call s:System.map('n', '<', function('vim_winmanager#resizeDecV'))

  call s:System.map('n', 'q', function('vim_winmanager#quitCurrentWindow'))

  call s:System.map('n', '<C-c>', function('vim_winmanager#endWinMode'))
  call s:System.map('n', '<Esc>', function('vim_winmanager#endWinMode'))

  call s:System.echo('-- WINMODE --', 'ModeMsg')
  call s:Publisher.fire('VimWinmanagerWinModeStart')
endfunction " }}}

function! vim_winmanager#endWinMode() " {{{
  call s:System.ignoreMap('n', 'h', function('vim_winmanager#left'))
  call s:System.ignoreMap('n', 'l', function('vim_winmanager#right'))
  call s:System.ignoreMap('n', 'j', function('vim_winmanager#bottom'))
  call s:System.ignoreMap('n', 'k', function('vim_winmanager#top'))

  call s:System.ignoreMap('n', 'J', function('vim_winmanager#newWinBottom'))
  call s:System.ignoreMap('n', 'K', function('vim_winmanager#newWinTop'))
  call s:System.ignoreMap('n', 'H', function('vim_winmanager#newWinLeft'))
  call s:System.ignoreMap('n', 'L', function('vim_winmanager#newWinRight'))

  call s:System.ignoreMap('n', 'r', function('vim_winmanager#move'))

  call s:System.ignoreMap('n', '=', function('vim_winmanager#resizeEqual'))
  call s:System.ignoreMap('n', '+', function('vim_winmanager#resizeIncG'))
  call s:System.ignoreMap('n', '-', function('vim_winmanager#resizeDecG'))
  call s:System.ignoreMap('n', '>', function('vim_winmanager#resizeIncV'))
  call s:System.ignoreMap('n', '<', function('vim_winmanager#resizeDecV'))

  call s:System.ignoreMap('n', 'q', function('vim_winmanager#quitCurrentWindow'))

  call s:System.ignoreMap('n', '<C-c>', function('vim_winmanager#endWinMode'))
  call s:System.ignoreMap('n', '<Esc>', function('vim_winmanager#endWinMode'))

  echo ''
  call s:Publisher.fire('VimWinmanagerWinModeEnd')
endfunction " }}}
