" Toggle GUI
" T:  ToolBar
" m:  MenuBar
" r:  Right ScrollBar
" l:  Left ScrollBar
function! ToggleGuiOptions(flag_option)
  if a:flag_option ==? 'T'
    if &guioptions =~# 'T'
      set guioptions-=T
    else
      set guioptions+=T
    endif
  elseif a:flag_option ==? 'm'
    if &guioptions =~# 'm'
      set guioptions-=m
    else
      set guioptions+=m
    endif
  elseif a:flag_option ==? 'r'
    if &guioptions =~# 'r'
      set guioptions-=r
    else
      set guioptions+=r
    endif
  elseif a:flag_option ==? 'l'
    if &guioptions =~# 'l'
      set guioptions-=l
    else
      set guioptions+=l
    endif
  else
    echo 'bad parameter :' . a:flag_option
  endif
endfunction
nnoremap ,t :call ToggleGuiOptions('T')<CR>
nnoremap ,m :call ToggleGuiOptions('m')<CR>
nnoremap ,r :call ToggleGuiOptions('r')<CR>
nnoremap ,l :call ToggleGuiOptions('l')<CR>

" view setting
if has('win32')
  gui
  set transparency=255
  set guioptions=
endif
colorscheme molokai
set guifont=Ubuntu_Mono:h16
set lines=62 columns=140

