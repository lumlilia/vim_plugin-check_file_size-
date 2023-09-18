function! check_file_size#CheckFileSize() abort
  let max_size = 10000000
  let file_size = getfsize(expand('%')) 

  if file_size > max_size 
    if stridx(execute(':lan mes'), 'ja_JP') >= 0
      let txt = file_size . 'byteのファイルです。開きますか？ (Yes: Y|y, No: other)'

    else
      let txt = 'File size is ' . file_size . 'bytes. Do you want to continue?  (Yes: Y|y, No: other)'

    endif

    let input_txt = input(txt) 

    if input_txt != 'Y' && input_txt != 'y' 
      execute ':q' 
    endif
  endif
endfunction
