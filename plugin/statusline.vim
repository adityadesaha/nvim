function! BufList(dec) "{{{
    let l:str=""
    for buf in getbufinfo({'buflisted':1})
        let l:active = 0
        let l:name=fnamemodify(buf.name, ":t")
        if winbufnr(winnr()) == buf.bufnr
            let l:active = 1
        endif
        if a:dec
            if l:active
                let l:str .= "%## "
            else
                let l:str .= "%#StatusLineNC# "
            endif
        else
            if l:active
                let l:str .= " ["
            endif
        endif
        let l:str .= buf.bufnr . ':' . l:name
        if buf.changed
            let l:str .= "*"
        endif
        if a:dec
            let l:str .= " "
            if l:active
                let l:str .= "%#StatusLineNC#"
            endif
        else
            if l:active
                let l:str .= "] "
            endif
        endif
        let l:str .= " "
    endfor
    return l:str
endfunction
"}}}

function! Foo()
    if len(gettabinfo()) == 1 && len(getwininfo()) == 1
        return BufList(1)
    else
        return " %t %m"
    endif
endfunction

function! MyStatusLine()
    "let l:str=buftabs#statusline()
    let l:str =Foo()
    let l:str .="%#StatusLineNC#"
    "let l:str ="\ %t %m"
    let l:str.="%="
    let l:str.="%y\ "
    let l:str.="%l:%c,%p%%\ "
    return l:str
endfunction
