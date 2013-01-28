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

"color setting
colorscheme Monokai

"view setting
set guioptions=
set guifont=DejaVu_Sans_Mono:h11:w6.5:cSHIFTJIS
set lines=62 columns=140

gui
set transparency=255

nnoremap ,t :call ToggleGuiOptions('T')<CR>
nnoremap ,m :call ToggleGuiOptions('m')<CR>
nnoremap ,r :call ToggleGuiOptions('r')<CR>
nnoremap ,l :call ToggleGuiOptions('l')<CR>
