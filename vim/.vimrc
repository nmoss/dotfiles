" .vimrc
" Nicholas Moss
" 2/7/14

" sets up pathogen
execute pathogen#infect()
filetype plugin indent on

" sets up tab space, line numbers, indent style, and syntax highlighting 
set tabstop=4
set number
set smartindent
set shiftwidth=4

"Turn power tab on
"set laststatus=2

"Color stuff
highlight LineNr ctermfg=grey  ctermbg=black
highlight SignColumn ctermbg=darkblue
highlight Statusline ctermbg=grey ctermfg=red
syntax on

"Detect lisp files
au BufRead,BufNewFile *.lisp set lisp
au BufRead,BufNewFile *.scm set lisp
au BufRead,BufNewFile *.lisp set tabstop=2
au BufRead,BufNewFile *.scm set tabstop=2


" show commands as I type (command mode)
set showcmd 

" sets CTRL-L to clear highlights
se hlsearch
noremap <C-l> :nohlsearch<CR><C-l>
noremap! <C-l> <ESC>:nohlsearch<CR><C-l>

" sets CTRL+cursor keys to switch between windows and instantly close a window with F12
noremap <silent> <C-Down> <C-W>j
noremap <silent> <C-Up> <C-W>k
noremap <silent> <C-Left> <C-W>h
noremap <silent> <C-Right> <C-W>l
noremap <silent> <C-F12> :bd!<CR>

" Get in-line manpages with 'K' in command mode
fun! ReadMan()
	" Assign current word under cursor to a script variable:
	let s:man_word = expand('<cword>')
	" Open a new window:
	:wincmd n
	" Read in the manpage for man_word (col -b is for formatting):
	:exe ":r!man " . s:man_word . " | col -b"
	" Goto first line...
	:goto
	" and delete it:
	:delete
	"finally set file type to 'man':
	:set filetype=man
	"lines set to 20
	:resize 20
endfun
" Maps the K key to call the function
noremap K :call ReadMan()<CR>


" Nerd Tree Stuff
"maps Nerd tree to F10
noremap <silent> <F10> :NERDTreeToggle<CR>
noremap! <silent> <F10> <ESC>:NERDTreeToggle<CR>


