if exists('g:check_file_size')
  finish
endif
let g:check_file_size = 1

aug check_file_size
  au!
  au BufReadPre * call check_file_size#CheckFileSize()
aug END
