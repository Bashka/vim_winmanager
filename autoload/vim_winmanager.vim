" Date Create: 2015-02-04 11:29:12
" Last Change: 2015-02-04 16:17:40
" Author: Artur Sh. Mamedbekov (Artur-Mamedbekov@yandex.ru)
" License: GNU GPL v3 (http://www.gnu.org/copyleft/gpl.html)

let s:System = vim_lib#sys#System#.new()

" Обработчики событий режима управления окнами. {{{
function! vim_winmanager#quitCurrentWindow(event) " {{{
  exe ':q'
endfunction " }}}

function! vim_winmanager#newWinTop(event) " {{{
  lefta new
endfunction " }}}

function! vim_winmanager#newWinBottom(event) " {{{
  rightb new
endfunction " }}}

function! vim_winmanager#newWinLeft(event) " {{{
  lefta vnew
endfunction " }}}

function! vim_winmanager#newWinRight(event) " {{{
  rightb vnew
endfunction " }}}

function! vim_winmanager#left(event) " {{{
  wincmd h
endfunction " }}}

function! vim_winmanager#right(event) " {{{
  wincmd l
endfunction " }}}

function! vim_winmanager#top(event) " {{{
  wincmd k
endfunction " }}}

function! vim_winmanager#bottom(event) " {{{
  wincmd j
endfunction " }}}

function! vim_winmanager#next(event) " {{{
  wincmd w
endfunction " }}}

function! vim_winmanager#prev(event) " {{{
  wincmd W
endfunction " }}}

function! vim_winmanager#move(event) " {{{
  wincmd x
endfunction " }}}

function! vim_winmanager#resizeEqual(event) " {{{
  wincmd =
endfunction " }}}

function! vim_winmanager#resizeIncG(event) " {{{
  resize +2
endfunction " }}}

function! vim_winmanager#resizeDecG(event) " {{{
  resize -2
endfunction " }}}

function! vim_winmanager#resizeIncV(event) " {{{
  vertical resize +5
endfunction " }}}

function! vim_winmanager#resizeDecV(event) " {{{
  vertical resize -5
endfunction " }}}
" }}}

function! vim_winmanager#startWinMode(...) " {{{
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
endfunction " }}}

function! vim_winmanager#endWinMode(...) " {{{
  call s:System.ignore('n', 'h', function('vim_winmanager#left'))
  call s:System.ignore('n', 'l', function('vim_winmanager#right'))
  call s:System.ignore('n', 'j', function('vim_winmanager#bottom'))
  call s:System.ignore('n', 'k', function('vim_winmanager#top'))

  call s:System.ignore('n', 'J', function('vim_winmanager#newWinBottom'))
  call s:System.ignore('n', 'K', function('vim_winmanager#newWinTop'))
  call s:System.ignore('n', 'H', function('vim_winmanager#newWinLeft'))
  call s:System.ignore('n', 'L', function('vim_winmanager#newWinRight'))

  call s:System.ignore('n', 'r', function('vim_winmanager#move'))

  call s:System.ignore('n', '=', function('vim_winmanager#resizeEqual'))
  call s:System.ignore('n', '+', function('vim_winmanager#resizeIncG'))
  call s:System.ignore('n', '-', function('vim_winmanager#resizeDecG'))
  call s:System.ignore('n', '>', function('vim_winmanager#resizeIncV'))
  call s:System.ignore('n', '<', function('vim_winmanager#resizeDecV'))

  call s:System.ignore('n', 'q', function('vim_winmanager#quitCurrentWindow'))

  call s:System.ignore('n', '<C-c>', function('vim_winmanager#endWinMode'))
endfunction " }}}
