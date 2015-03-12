"Some of this from: http://stevelosh.com/blog/2010/09/coming-home-to-vim/

" Needs https://github.com/tpope/vim-pathogen
filetype off
call pathogen#infect()
"call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

"Open maximized
if has('gui_running')
    set lines=999
    set columns=999
endif


" ----------------------------------------------------------------------
"  General settings




"set listchars=tab:>.
"set listchars=tab:▸\  " First one also marks end of line.  Second one does not.
"set relativenumber
"set smartindent
set autoindent
set backspace=indent,eol,start      " Allow backspacing over everything in insert mode
set clipboard=unnamed               " Access system clipboard for OSX
set cmdheight=2                     " Command region height
set colorcolumn=85
set cursorline
set encoding=utf-8
set expandtab
set formatoptions=qrn1
set gdefault
set hidden                          " http://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
set history=1000                    " Set sufficient command history accessible by q: in normal mode
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set laststatus=2                    " Always display a status line at the bottom of the window
set list
set listchars=tab:▸\ ,eol:¬         " First one also marks end of line.  Second one does not.
set modelines=0
set nobackup                        " Do not keep a backup files
set nowritebackup                   " Do not keep a backup files
set number                          " Set to default to have line numbers
set ruler
set scrolloff=3
set selectmode=mouse                " Select when using the mouse
set shiftwidth=4
set showcmd
set showmatch
set showmode
set smartcase
set softtabstop=4
set splitbelow                      " When splitting window, open below or on right
set splitright                      " When splitting window, open below or on right
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%* " Set status line
set tabstop=4                       "Set tabstops to 4 spaces
set textwidth=79
set ttyfast
set vb                              " Turn off beeping/bell
set virtualedit=block               " Make cursor go past end of lines when you need this at end of a column select or something.   http://blog.sanctum.geek.nz/vim-annoyances/
set visualbell
set whichwrap+=<,>,[,]              " http://superuser.com/questions/35389/in-vim-how-do-i-make-the-left-and-right-arrow-keys-change-line Arrow keys to go over newlines...
set wildmenu
set wildmode=list:longest
set wrap

"set backspace=indent,eol,start
    " smart search (override 'ic' when pattern has uppers)
"set scs





" ----------------------------------------------------------------------
"  General mapleader related settings
let mapleader = ","
nnoremap <leader><space> :noh<cr>

" Shortcut to rapidly toggle `set list`
"http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR>

"Strip or trim trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Quick redraw
nnoremap <leader>r :redraw!<CR>

"Insert datetime
nnoremap <leader>d "=strftime("%Y-%m-%d:%H:%M:%S")<CR>P
inoremap <leader>d <C-R>=strftime("%Y-%m-%d:%H:%M:%S")<CR>

"Make splitting windows not so clunky
"This will split current buffer into two vertical windows
nnoremap <leader>w <C-w>v<C-w>l

"Change horizontal splits to vertical
nnoremap <leader>V <C-W>t<C-W>H<CR>

"Quickly open a scratch buffer in vertical split
"Needs https://github.com/mtth/scratch.vim
nnoremap <leader>ss :Scratch<CR><C-W>t<C-W>H<CR>

"Toggle a truly readonly, non-modifiable buffer state
nnoremap <leader>R :set modifiable!<CR>

" Easily open up my .vimrc
" and also source it once editied.
" http://learnvimscriptthehardway.stevelosh.com/chapters/07.html
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrap paragraphs of text
nnoremap <leader>q gqip

" Reselect text that was just pasted in, so stuff can be done to it.
nnoremap <leader>v V`]

" paste last yank
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
nnoremap <leader>p "0p
vnoremap <leader>p "0p

" Turn everything into (multi)tabs
nnoremap <leader>m :tab sball<CR>



" ----------------------------------------------------------------------
"  Remapping
" Do smart escaped searching
nnoremap / /\v
vnoremap / /\v

" Make tab key bounce between balanced bracketing delimiters
nnoremap <tab> %
vnoremap <tab> %

" function button is same as escape, in case you fat-finger it
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"so i don't have to shift to enter colon
nnoremap ; :

"in insert mode, two js in a row will get you back to normal mode.
inoremap jj <ESC>

" Use fewer keystrokes to move between windows
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

    " Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>

    " pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

    " Map <c-s> to write current buffer.
map <c-s> :w<cr>
imap <c-s> <c-o><c-s>
imap <c-s> <esc><c-s>

    " Select all.
map <c-a> ggVG

    " Undo in insert mode.
imap <c-z> <c-o>u

" Toggle wrap/nowrap
map <F2> :set wrap!<CR>  

    "From http://stackoverflow.com/questions/953398/how-to-execute-file-im-editing-in-vim/
nmap <F3> :w<CR>:silent !chmod +x %:p<CR>:silent !%:p 2>&1 \| tee ~/.vim/output<CR>:10split ~/.vim/output<CR>:redraw!<CR>


" Make j and k act sanely, by moving up and down by screen line, not file line
nnoremap j gj
nnoremap k gk




" ----------------------------------------------------------------------
"  Commands

    "switch to directory of current file
command! CD cd %:p:h

    "Execute shell command, pipe output to separate buffer
    "http://vim.wikia.com/wiki/Append_output_of_an_external_command
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>






" ----------------------------------------------------------------------
"  Misc

"When window focus lost, save everything
"au FocusLost * :wa

"Use Ack (I downloaded to plugin directory).  grep replacement
"nnoremap <leader>a :Ack

" Notes
" Good settings found at:
" http://www.slackorama.com/projects/vim/vimrc.html




"Color schemes
"-----------------------------------------------------------------------
" Needs https://github.com/altercation/vim-colors-solarized
syntax enable

if has('gui_running')
"    colorscheme molokai
    colorscheme solarized
    set background=light
else
    "colorscheme midnightclouds
    "colorscheme chlordane
    set background=dark
    "Solarized options
    "let g:solarized_termcolors = 256
    "let g:solarized_visibility = "high"
    "let g:solarized_contrast = "high"
    let g:solarized_termtrans = 1
    colorscheme solarized
endif















"-----------------------------------------------------------------------
" Functions

" http://vim.wikia.com/wiki/Pretty-formatting_XML
function! DoPrettyXML()
  " save the filetype so we can restore it later
  let l:origft = &ft
  set ft=
  " delete the xml header if it exists. This will
  " permit us to surround the document with fake tags
  " without creating invalid xml.
  1s/<?xml .*?>//e
  " insert fake tags around the entire document.
  " This will permit us to pretty-format excerpts of
  " XML that may contain multiple top-level elements.
  0put ='<PrettyXML>'
  $put ='</PrettyXML>'
  silent %!xmllint --format -
  " xmllint will insert an <?xml?> header. it's easy enough to delete
  " if you don't want it.
  " delete the fake tags
  2d
  $d
  " restore the 'normal' indentation, which is one extra level
  " too deep due to the extra tags we wrapped around the document.
  silent %<
  " back to home
  1
  " restore the filetype
  exe "set ft=" . l:origft
endfunction
command! PrettyXML call DoPrettyXML()



" Combine tabs into vertical splits in one window
" http://vim.wikia.com/wiki/Move_current_window_between_tabs
function MoveToPrevTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() != 1
    close!
    if l:tab_nr == tabpagenr('$')
      tabprev
    endif
    sp
  else
    close!
    exe "0tabnew"
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

function MoveToNextTab()
  "there is only one window
  if tabpagenr('$') == 1 && winnr('$') == 1
    return
  endif
  "preparing new window
  let l:tab_nr = tabpagenr('$')
  let l:cur_buf = bufnr('%')
  if tabpagenr() < tab_nr
    close!
    if l:tab_nr == tabpagenr('$')
      tabnext
    endif
    sp
  else
    close!
    tabnew
  endif
  "opening current buffer in new window
  exe "b".l:cur_buf
endfunc

map <C-m> :call MoveToNextTab()<CR><C-w>H
map <C-n> :call MoveToPrevTab()<CR><C-w>H





"Custom function to open directory listing on remote ec2 instances
"   in the quantum home directory.
"Example call:
":call Ec2("fls2")
function Ec2(name)
    execute "e scp://" . a:name . "/~quantum/"
endfunction

