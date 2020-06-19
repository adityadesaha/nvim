" My code folding function

function! MyFoldText()
    let l:str=getline(v:foldstart)
    if l:str[strlen(l:str) - 1] == ':'
        return l:str
    endif
    let l:str.= ' … ' . substitute(getline(v:foldend), '^ \+', '' , 'g')
    return l:str
endfunction
