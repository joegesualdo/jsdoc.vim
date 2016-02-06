function! JSDocAdd()
    let l:jsDocregex = '\s*\([a-zA-Z]*\)\s*[:=]\s*function\s*(\s*\(.*\)\s*).*'
    let l:jsDocregex2 = '\s*function \([a-zA-Z]*\)\s*(\s*\(.*\)\s*).*'

    let l:line = getline('.')
    let l:indent = indent('.')
    let l:space = repeat(" ", l:indent)

    if l:line =~ l:jsDocregex
        let l:flag = 1
        let l:regex = l:jsDocregex
    elseif l:line =~ l:jsDocregex2
        let l:flag = 1
        let l:regex = l:jsDocregex2
    else
        let l:flag = 0
    endif

    if l:flag
      let l:lines = []
      let l:desc = input('Description: ')
      let l:funcName = substitute(l:line, l:regex, '\1', "g")
      call add(l:lines, l:space. '/**')
      call add(l:lines, l:space . ' * ' . l:funcName .'() ' . l:desc)
      let l:arg = substitute(l:line, l:regex, '\2', "g")
      let l:args = split(l:arg, '\s*,\s*')
      call add(l:lines, l:space . ' *')
      for l:arg in l:args
          call add(l:lines, l:space . ' * @param {...} ' . l:arg . " -")
      endfor
      call add(l:lines, l:space . ' *')
      call add(l:lines, l:space . ' * @return {...}')
      call add(l:lines, l:space . ' */')
      call append(line('.')-1, l:lines)
    endif

endfunction
