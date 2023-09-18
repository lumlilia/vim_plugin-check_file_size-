function! check_file_size#CheckFileSize() abort
  let max_size = 10000000
  let gfs = getfsize(expand('%')) 

  if gfs > max_size 
    if gfs >= 1000000
      let file_size = float2nr(gfs / 1000000) . 'MB'

    elseif gfs >= 1000
      let file_size = float2nr(gfs / 1000) . 'KB'

    else
      let file_size = gfs . 'Byte'

    endif

    if stridx(execute(':lan mes'), 'ja_JP') >= 0
      let txt = file_size . 'のファイルです。開きますか？ (Yes: Y|y, No: other)'

    else
      let txt = 'File size is ' . file_size . ((stridx(file_size, 'Byte') > 0) ? 's' : '') . '. Do you want to continue?  (Yes: Y|y, No: other)'

    endif

    let input_txt = input(txt) 

    if input_txt != 'Y' && input_txt != 'y' 
      execute ':q' 
    endif
  endif
endfunction
