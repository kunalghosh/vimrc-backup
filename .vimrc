filetype plugin indent on
filetype plugin on
set tags=tags
let g:pydiction_location = '/home/kunal/.vim/ftplugin/complete-dict'
"colorscheme koehler
"colorscheme ir_black
"colorscheme desert
"colorscheme default
colorscheme peachpuff
syntax on
set number
set guifont=monaco
source /home/kunal/.vim/kde-devel-vim.vim
set tabstop=4
set expandtab
set hlsearch
nmap <C-o> <esc>:tabprevious<cr>
nmap <C-p> <esc>:tabnext<cr>
nmap <C-n> <esc>:tabnew<cr>:e .<cr>
"CTRL-C to copy (visual mode)
vmap <C-c> y
"CTRL-X to cut (visual mode)
vmap <C-x> x
"CTRL-V to paste (insert mode)
imap <C-v> <esc>p
"-------------------Bash complete---------------------
let g:BASH_AuthorName   = 'Kunal Ghosh'
let g:BASH_Email        = 'kunal dot t2 at gmail dot com'
"-------function for Automatic C/C++ header gates------
function! s:insert_gates()
  let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
  execute "normal! i#ifndef " . gatename
  execute "normal! o#define " . gatename . " "
  execute "normal! Go#endif /* " . gatename . " */"
  normal! kk
endfunction
autocmd BufNewFile *.{h,hpp} call <SID>insert_gates()

"-------------------Automatic Header for C files------
autocmd bufnewfile *.{c,cpp,h,hpp} so /home/kunal/.vim/c_header.txt
autocmd bufnewfile *.{c,cpp,h,hpp} exe "1," . 10 . "g/File Name :.*/s//File Name : " .expand("%")
autocmd bufnewfile *.{c,cpp,h,hpp} exe "1," . 10 . "g/Creation Date :.*/s//Creation Date : " .strftime("%d-%m-%Y")
autocmd Bufwritepre,filewritepre *.{c,cpp,h,hpp} execute "normal ma"
autocmd Bufwritepre,filewritepre *.{c,cpp,h,hpp} exe "1," . 10 . "g/Last Modified :.*/s/Last Modified :.*/Last Modified : " .strftime("%c")
autocmd bufwritepost,filewritepost *.{c,cpp,h,hpp} execute "normal `a"
"after inserting the header and everything else , goto the end of 200 lines
"//hopefully the end of file :)
autocmd bufnewfile * execute "normal! 0G$o"
"------------------end of automatic header------------
nnoremap <F12> "%phr_I#ifndef __<Esc>gUwyypldwidefine <Esc>yypldwiendif //<Esc>O<Esc>
"------Automatically remove trailing white spaces before saving-------------
autocmd BufWritePre *.{c,cpp,h,hpp},TODO{*} :%s/\s\+$//e
