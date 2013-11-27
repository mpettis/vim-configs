"Some of this from: http://stevelosh.com/blog/2010/09/coming-home-to-vim/

filetype off
call pathogen#runtime_append_all_bundles()
filetype plugin indent on

set nocompatible

"Open maximized
if has('gui_running')
    set lines=999
    set columns=999
endif

set modelines=0

"Set tabstops to 4 spaces
"set smartindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab

set encoding=utf-8
set scrolloff=3
set autoindent
set showmode
set showcmd
set hidden
set wildmenu
set wildmode=list:longest
set visualbell
set cursorline
set ttyfast
set ruler
set backspace=indent,eol,start
set laststatus=2

" Set relative line numbering.
"set relativenumber

set undofile

let mapleader = ","

nnoremap / /\v
vnoremap / /\v
set ignorecase
set smartcase
set gdefault
set incsearch
set showmatch
set hlsearch
nnoremap <leader><space> :noh<cr>
nnoremap <tab> %
vnoremap <tab> %

set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=85

" Shortcut to rapidly toggle `set list`
"http://vimcasts.org/episodes/show-invisibles/
nmap <leader>l :set list!<CR>
set list

" First one also marks end of line.  Second one does not.
set listchars=tab:▸\ ,eol:¬
"set listchars=tab:▸\ 

inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

"so i don't have to shift to enter colon
nnoremap ; :

"When window focus lost, save everything
"au FocusLost * :wa

"Leader customizations

",W : strip or trim trailing whitespace
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

"Use Ack (I downloaded to plugin directory).  grep replacement
nnoremap <leader>a :Ack

"Quick redraw
nnoremap <leader>r :redraw!<CR>

"Insert datetime
nnoremap <leader>d "=strftime("%Y-%m-%d:%H:%M:%S")<CR>P
inoremap <leader>d <C-R>=strftime("%Y-%m-%d:%H:%M:%S")<CR>

"in insert mode, two js in a row will get you back to normal mode.
inoremap jj <ESC>

"Make splitting windows not so clunky
"This will split current buffer into two vertical windows
nnoremap <leader>w <C-w>v<C-w>l

nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"Color schemes
"-----------------------------------------------------------------------
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


"Keys for yankring
nnoremap <silent> <F4> :YRShow<cr>
inoremap <silent> <F4> <ESC>:YRShow<cr>
nnoremap <leader>Y :YRToggle<cr>


"NERDTree shortcut
"-----------------------------------------------------------------------
nmap <leader>fe :NERDTree<cr>

"http://blog.htbaa.com/news/vim-essentials-nerd-tree
"Make a bookmark file


"Leader map for Rainbow parentheses
"R is mapped below already, look for better mapping.
"nnoremap <leader>R :RainbowParenthesesToggle<CR>

"Change horizontal splits to vertical
nnoremap <leader>V <C-W>t<C-W>H<CR>

"Quickly open a scratch buffer in vertical split
nnoremap <leader>S :Sscratch<CR><C-W>t<C-W>H<CR>

"Toggle a truly readonly, non-modifiable buffer state
nnoremap <leader>R :set modifiable!<CR>




    " When splitting window, open below or on right
set splitbelow
set splitright

    "Set to default to have line numbers
set number

    "Access system clipboard for OSX
set clipboard=unnamed

    " Turn off beeping/bell
set vb

    " Good settings found at:
    " http://www.slackorama.com/projects/vim/vimrc.html


    " select when using the mouse
set selectmode=mouse

    " allow backspacing over everything in insert mode
"set backspace=indent,eol,start

    "Command region height
set cmdheight=2

    " do not keep a backup files
set nobackup
set nowritebackup

    " show the cursor position all the time
"set ruler

    " do incremental searches (annoying but handy);
"set incsearch

    " Show  tab characters. Visual Whitespace.
"set list
"set listchars=tab:>.

    " Set ignorecase on
"set ignorecase

    " smart search (override 'ic' when pattern has uppers)
"set scs

    " Set 'g' substitute flag on
"set gdefault

    " Set status line
set statusline=[%02n]\ %f\ %(\[%M%R%H]%)%=\ %4l,%02c%2V\ %P%*

    " Always display a status line at the bottom of the window
set laststatus=2

    " pressing < or > will let you indent/unident selected lines
vnoremap < <gv
vnoremap > >gv

    " Make tab in v mode work like I think it should (keep highlighting):
"vmap <tab> >gv
"vmap <s-tab> <gv

    " Map <c-s> to write current buffer.
map <c-s> :w<cr>
imap <c-s> <c-o><c-s>
imap <c-s> <esc><c-s>

    " Buffer naviation
map <M-Left> :bprevious<CR>
map <M-Right> :bnext<CR>


    " Select all.
map <c-a> ggVG

    " Undo in insert mode.
imap <c-z> <c-o>u

    "switch to directory of current file
command! CD cd %:p:h

    "Execute shell command, pipe output to separate buffer
    "http://vim.wikia.com/wiki/Append_output_of_an_external_command
command! -nargs=* -complete=shellcmd R new | setlocal buftype=nofile bufhidden=hide noswapfile | r !<args>


    "Bindings
    "--------
map <F2> :set wrap!<CR>
    "From http://stackoverflow.com/questions/953398/how-to-execute-file-im-editing-in-vim/
nmap <F3> :w<CR>:silent !chmod +x %:p<CR>:silent !%:p 2>&1 \| tee ~/.vim/output<CR>:10split ~/.vim/output<CR>:redraw!<CR>


    " http://superuser.com/questions/35389/in-vim-how-do-i-make-the-left-and-right-arrow-keys-change-line
    " Arrow keys to go over newlines...
set whichwrap+=<,>,[,]

    " http://stackoverflow.com/questions/102384/using-vims-tabs-like-buffers
"set hidden

" Easily open up my .vimrc
" and also source it once editied.
" http://learnvimscriptthehardway.stevelosh.com/chapters/07.html
nnoremap <leader>ev <C-w><C-v><C-l>:e $MYVIMRC<cr>
nnoremap <leader>sv :source $MYVIMRC<cr>

" Wrap paragraphs of text
nnoremap <leader>q gqip

" Reselect text that was just pasted in, so stuff can be done to it.
nnoremap <leader>v V`]

" Make j and k act sanely, by moving up and down by screen line, not file line
nnoremap j gj
nnoremap k gk


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



" paste last yank
" http://vim.wikia.com/wiki/Replace_a_word_with_yanked_text
nnoremap <leader>p "0p
vnoremap <leader>p "0p

" Make cursor go past end of lines when you need this at end of a column select
" or something.
" http://blog.sanctum.geek.nz/vim-annoyances/
set virtualedit=block

"Custom function to open directory listing on remote ec2 instances
"   in the quantum home directory.
"Example call:
":call Ec2("fls2")
function Ec2(name)
    execute "e scp://" . a:name . "/~quantum/"
endfunction

