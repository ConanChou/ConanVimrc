"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Maintainer: Conan
"             http://conanblog.me
" 
" Based_on: http://amix.dk/vim/vimrc.html
" 
" Version: 1.3
"
" How_to_Install_on_Unix:
"    $ mkdir ~/.vim_runtime
"    $ git clone git@github.com:ConanChou/ConanVimrc.git ~/.vim_runtime
"    $ cat ~/.vim_runtime/install.sh
"    $ sh ~/.vim_runtime/install.sh <system>
"      <sytem> can be `mac`, `linux` or `windows`
"
" How_to_Upgrade:
"    $ svn update ~/.vim_runtime
"
" Sections:
"    -> General
"    -> VIM user interface
"    -> Colors and Fonts
"    -> Files and backups
"    -> Text, tab and indent related
"    -> Folding
"    -> Visual mode related
"    -> Command mode related
"    -> Moving around, tabs and buffers
"    -> Statusline
"    -> Parenthesis/bracket expanding
"    -> General Abbrevs
"    -> Editing mappings
"
"    -> Cope
"    -> Minibuffer plugin
"    -> Omni complete functions
"    -> Python section
"    -> JavaScript section
"    -> CoffeeScript section
"    -> YankRing
"    -> neocomplcache
"    -> CursorLine and ColumnLine
"    -> NERDTree
"    -> octopress
"    -> TaskList
"    -> Gundo
"    -> PEP8
"    -> PyDoc
"    -> Rope.vim
"    -> Ack
"    -> MakeGreen
"    -> py.test
"
" Plugins_Included:
"     > minibufexpl.vim - http://www.vim.org/scripts/script.php?script_id=159
"       Makes it easy to get an overview of buffers:
"           info -> :e ~/.vim_runtime/plugin/minibufexpl.vim
" 
"     > bufexplorer - http://www.vim.org/scripts/script.php?script_id=42
"       Makes it easy to switch between buffers:
"           info -> :help bufExplorer
"
"     > yankring.vim - http://www.vim.org/scripts/script.php?script_id=1234
"       Emacs's killring, useful when using the clipboard:
"           info -> :help yankring
"
"     > surround.vim - http://www.vim.org/scripts/script.php?script_id=1697
"       Makes it easy to work with surrounding text:
"           info -> :help surround
"
"     > snipMate.vim - http://www.vim.org/scripts/script.php?script_id=2540
"       Snippets for many languages (similar to TextMate's):
"           info -> :help snipMate
"
"     > mru.vim - http://www.vim.org/scripts/script.php?script_id=521
"       Plugin to manage Most Recently Used (MRU) files:
"           info -> :e ~/.vim_runtime/plugin/mru.vim
"
"     > Gist.vim - https://github.com/mattn/gist-vim
"       vimscript for gist 
"
"     > check the `.gitmodules` file for more
"
"     > ctrlp - http://kien.github.io/ctrlp.vim/
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" pathogen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call pathogen#infect()
syntax on
filetype plugin indent on
let g:Powerline_symbols = 'fancy'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Change cursor shape in different modes
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"if MySys() == 'linux' && has("autocmd")
"    au InsertEnter * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"    au InsertLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape block"
"    au VimLeave * silent execute "!gconftool-2 --type string --set /apps/gnome-terminal/profiles/Default/cursor_shape ibeam"
"endif


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" golang settings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/go/misc/vim
filetype plugin indent on
syntax on
au BufNewFile,BufRead *.go set ft=go

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Enable filetype plugin
filetype plugin on
filetype indent on

set ofu=syntaxcomplete#Complete

" Set to auto read when a file is changed from the outside
set autoread

" With a map leader it's possible to do extra key combinations
" like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

" Fast saving
nmap <leader>w :w!<cr>

if MySys() == "windows"
    " Fast editing of the .vimrc
    map <leader>e :e! ~/_vim_runtime/vimrc<cr>

    " When vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/_vim_runtime/vimrc
else
    " Fast editing of the .vimrc
    map <leader>e :e! ~/.vim_runtime/vimrc<cr>

    " When vimrc is edited, reload it
    autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc
endif

" change to current file directory
nnoremap <leader>cd :cd %:p:h<CR>:pwd<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the curors - when moving vertical..
set so=7

"Turn on WiLd menu
set wildmenu 

" Ignore compiled files
set wildignore=*.o,*~,*.pyc
if has("win16") || has("win32")
    set wildignore+=*/.git/*,*/.hg/*,*/.svn/*,*/.DS_Store
else
    set wildignore+=.git\*,.hg\*,.svn\*
endif

set ruler "Always show current position

set cmdheight=1 "The commandbar height

set hid "Change buffer - without saving

" Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching
set smartcase

set hlsearch "Highlight search things

set incsearch "Make search act like search in modern browsers
set lazyredraw "Don't redraw while executing macros 

set magic "Set magic on, for regular expressions

set showmatch "Show matching bracets when text indicator is over them
set mat=1 "How many tenths of a second to blink

" No sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax enable "Enable syntax hl

" Set font according to system
if MySys() == "mac"
  set gfn=Menlo:h14
  set shell=/bin/bash
elseif MySys() == "windows"
  set gfn=Bitstream\ Vera\ Sans\ Mono:h10
elseif MySys() == "linux"
  set gfn=Monospace\ 10
  set shell=/bin/bash
endif

if has("gui_running")
  source $VIMRUNTIME/mswin.vim
  behave mswin

  set guioptions-=T
  set guioptions-=e
  set guioptions-=r
  set t_Co=256
  let g:solarized_termcolors=256
  "set guitablabel=%M\ %t
  colorscheme solarized
  set background=dark
  set nu
  source $VIMRUNTIME/mswin.vim
  behave mswin
"  set relativenumber
else
  colorscheme zellner
  "colorscheme solarized
  set t_Co=256
  set background=dark
  set nu
"  set relativenumber
endif

set encoding=utf8
try
    lang en_US
catch
endtry

set ffs=unix,dos,mac "Default file types


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups and undo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off, since most stuff is in SVN, git anyway...
set nobackup
set nowb
set noswapfile

"Persistent undo
try
    if MySys() == "windows"
      set undodir=C:\Windows\Temp
    else
      set undodir=~/.vim_runtime/undodir
    endif
    
    set undofile
catch
endtry


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set expandtab
set shiftwidth=4
set tabstop=4
set smarttab

set lbr
set tw=500

set ai "Auto indent
set si "Smart indet
set wrap "Wrap lines

set ts=4 sw=4 et
"let g:indent_guides_start_level = 2
let g:indent_guides_guide_size = 1


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Folding
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set foldmethod=indent   "fold based on indent
set foldnestmax=10      "deepest fold is 10 levels
set nofoldenable        "dont fold by default
set foldlevel=1         "this is just what i use


""""""""""""""""""""""""""""""
" => Visual mode related
""""""""""""""""""""""""""""""
" NOTICE: Really useful!

"  In visual mode when you press * or # to search for the current selection
vnoremap <silent> * :call VisualSelection('f', '')<CR>
vnoremap <silent> # :call VisualSelection('b', '')<CR>

" When you press gv you vimgrep after the selected text
vnoremap <silent> gv :call VisualSelection('gv')<CR>

" Some useful keys for vimgrep
map <leader>g :vimgrep // **/*.<left><left><left><left><left><left><left>
map <leader><space> :vimgrep // <C-R>%<C-A><right><right><right><right><right><right><right><right><right>

" When you press <leader>r you can search and replace the selected text
vnoremap <silent> <leader>r :call VisualSelection('replace')<CR>

"
" From an idea by Michael Naumann
"
function! CmdLine(str)
    exe "menu Foo.Bar :" . a:str
    emenu Foo.Bar
    unmenu Foo
endfunction 

function! VisualSelection(direction) range
    let l:saved_reg = @"
    execute "normal! vgvy"

    let l:pattern = escape(@", '\\/.*$^~[]')
    let l:pattern = substitute(l:pattern, "\n$", "", "")

    if a:direction == 'b'
        execute "normal ?" . l:pattern . "^M"
    elseif a:direction == 'gv'
        call CmdLine("vimgrep " . '/'. l:pattern . '/' . ' **/*.')
    elseif a:direction == 'replace'
        call CmdLine("%s" . '/'. l:pattern . '/')
    elseif a:direction == 'f'
        execute "normal /" . l:pattern . "^M"
    endif

    let @/ = l:pattern
    let @" = l:saved_reg
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Turn persistent undo on
" means that you can undo even when you close a buffer/VIM
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
try
    set undodir=~/.vim_runtime/temp_dirs/undodir
    set undofile
catch
endtry

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Command mode related
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Smart mappings on the command line
cno $h e ~/
cno $d c <C-\>eCurrentFileDir("e")<cr>
cno $j e ./
cno $c e <C-\>eCurrentFileDir("e")<cr>

" $q is super useful when browsing on the command line
cno $q <C-\>eDeleteTillSlash()<cr>

" Bash like keys for the command line
cnoremap <C-A>		<Home>
cnoremap <C-E>		<End>
cnoremap <C-K>		<C-U>

cnoremap <C-P> <Up>
cnoremap <C-N> <Down>

" Useful on some European keyboards
map ½ $
imap ½ $
vmap ½ $
cmap ½ $


func! Cwd()
  let cwd = getcwd()
  return "e " . cwd 
endfunc

func! DeleteTillSlash()
  let g:cmd = getcmdline()
  if MySys() == "linux" || MySys() == "mac"
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*", "\\1", "")
  else
    let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\]\\).*", "\\1", "")
  endif
  if g:cmd == g:cmd_edited
    if MySys() == "linux" || MySys() == "mac"
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[/\]\\).*/", "\\1", "")
    else
      let g:cmd_edited = substitute(g:cmd, "\\(.*\[\\\\\]\\).*\[\\\\\]", "\\1", "")
    endif
  endif   
  return g:cmd_edited
endfunc

func! CurrentFileDir(cmd)
  return a:cmd . " " . expand("%:p:h") . "/"
endfunc


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Useful when moving accross long lines
"map j gj
"map k gk

" Map space to / (search) and c-space to ? (backgwards search)
map <space> /
map <c-space> ?
map <silent> <leader><cr> :noh<cr>

" Smart way to move btw. windows
map <C-j> <C-W>j
map <C-k> <C-W>k
map <C-h> <C-W>h
map <C-l> <C-W>l

" Close the current buffer
map <leader>bd :Bclose<cr>

" Close all the buffers
map <leader>ba :1,300 bd!<cr>

" Use the arrows to something usefull
map <right> :bn<cr>
map <left> :bp<cr>

" Tab configuration
map <leader>tn :tabnew! %<cr>
map <leader>te :tabedit 
map <leader>tc :tabclose<cr>
map <leader>tm :tabmove 

" When pressing <leader>cd switch to the directory of the open buffer
map <leader>cd :cd %:p:h<cr>


command! Bclose call <SID>BufcloseCloseIt()
function! <SID>BufcloseCloseIt()
   let l:currentBufNum = bufnr("%")
   let l:alternateBufNum = bufnr("#")

   if buflisted(l:alternateBufNum)
     buffer #
   else
     bnext
   endif

   if bufnr("%") == l:currentBufNum
     new
   endif

   if buflisted(l:currentBufNum)
     execute("bdelete! ".l:currentBufNum)
   endif
endfunction

" Specify the behavior when switching between buffers 
try
  set switchbuf=usetab
  set stal=2
catch
endtry

" Return to last edit position (You want this!) *N*
"autocmd BufReadPost *
"     \ if line("'\"") > 0 && line("'\"") <= line("$") |
"     \   exe "normal! g`\"" |
"     \ endif

"Remeber open buffers on close
set viminfo^=%

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
" Always hide the statusline
set laststatus=2

"Git branch
"function! GitBranch()
"    try
"        let branch = system("git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* //'")
"    catch
"        return ''
"    endtry
"
"    if branch != ''
"        return '   Git Branch: ' . substitute(branch, '\n', '', 'g')
"    en
"
"    return ''
"endfunction
"
"function! CurDir()
"    return substitute(getcwd(), '/Users/amir/', "~/", "g")
"endfunction
"
"function! HasPaste()
"    if &paste
"        return 'PASTE MODE  '
"    en
"    return ''
"endfunction
"
"" Format the statusline
"set statusline=\ %{HasPaste()}%F%m%r%h\ %w\ \ CWD:\ %r%{CurDir()}%h\ \ \ Line:\ %l/%L%{GitBranch()}

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Parenthesis/bracket expanding
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vnoremap $1 <esc>`>a)<esc>`<i(<esc>
vnoremap $2 <esc>`>a]<esc>`<i[<esc>
vnoremap $3 <esc>`>a}<esc>`<i{<esc>
vnoremap $$ <esc>`>a"<esc>`<i"<esc>
vnoremap $q <esc>`>a'<esc>`<i'<esc>
vnoremap $e <esc>`>a"<esc>`<i"<esc>

" Map auto complete of (, ", ', [
inoremap $1 ()<esc>i
inoremap $2 []<esc>i
inoremap $3 {}<esc>i
inoremap $4 {<esc>o}<esc>O
inoremap $q ''<esc>i
inoremap $e ""<esc>i
inoremap $t <><esc>i


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General Abbrevs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
iab xdate <c-r>=strftime("%d/%m/%y %H:%M:%S")<cr>


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Remap VIM 0
"map 0 ^

map <F6> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>

"Move a line of text using ALT+[jk] or Comamnd+[jk] on mac
nmap <M-j> mz:m+<cr>`z
nmap <M-k> mz:m-2<cr>`z
vmap <M-j> :m'>+<cr>`<my`>mzgv`yo`z
vmap <M-k> :m'<-2<cr>`>my`<mzgv`yo`z

if MySys() == "mac"
  nmap <D-j> <M-j>
  nmap <D-k> <M-k>
  vmap <D-j> <M-j>
  vmap <D-k> <M-k>
endif

"Delete trailing white space, useful for Python ;)
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Cope
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do :help cope if you are unsure what cope is. It's super useful!
map <leader>cc :botright cope<cr>
map <leader>n :cn<cr>
map <leader>p :cp<cr>


""""""""""""""""""""""""""""""
" => bufExplorer plugin
""""""""""""""""""""""""""""""
let g:bufExplorerDefaultHelp=0
let g:bufExplorerShowRelativePath=1
let g:bufExplorerFindActive=1
let g:bufExplorerSortBy='name'
map <leader>o :BufExplorer<cr>


""""""""""""""""""""""""""""""
" => Minibuffer plugin
""""""""""""""""""""""""""""""
let g:miniBufExplModSelTarget = 1
let g:miniBufExplorerMoreThanOne = 0
let g:miniBufExplModSelTarget = 0
let g:miniBufExplUseSingleClick = 1
let g:miniBufExplMapWindowNavVim = 1
"let g:miniBufExplVSplit = 30
let g:miniBufExplSplitBelow=0

autocmd BufRead,BufNew :call UMiniBufExplorer

map <leader>u :TMiniBufExplorer<cr>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Omni complete functions
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Spell checking
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Pressing ,ss will toggle and untoggle spell checking
map <leader>ss :setlocal spell!<cr>

"Shortcuts using <leader>
map <leader>sn ]s
map <leader>sp [s
map <leader>sa zg
map <leader>s? z=


""""""""""""""""""""""""""""""
" => Python section
""""""""""""""""""""""""""""""
let python_highlight_all = 1
autocmd FileType python set complete+=k~/.vim_runtime/syntax/python3.0.vim "isk+=.,(
au FileType python syn keyword pythonDecorator True None False self

au BufNewFile,BufRead *.jinja set syntax=htmljinja
au BufNewFile,BufRead *.mako set ft=mako

au FileType python inoremap <buffer> $r return 
au FileType python inoremap <buffer> $i import 
au FileType python inoremap <buffer> $p print 
au FileType python inoremap <buffer> $f #--- PH ----------------------------------------------<esc>FP2xi
au FileType python map <buffer> <leader>1 /class 
au FileType python map <buffer> <leader>2 /def 
au FileType python map <buffer> <leader>C ?class 
au FileType python map <buffer> <leader>D ?def 

au FileType python map <buffer> <S-e> :w<CR>:!/usr/bin/env python % <CR>

" Add the virtualenv's site-packages to vim path
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir, 'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF

""""""""""""""""""""""""""""""
" => Java section
"""""""""""""""""""""""""""""""
autocmd FileType java set makeprg=javac\ %
set errorformat=%A%f:%l:\ %m,%-Z%p^,%-C%.%#
map <F9> :make<Return>:copen<Return>
map <F10> :cprevious<Return>
map <F11> :cnext<Return>

""""""""""""""""""""""""""""""
" => JavaScript section
"""""""""""""""""""""""""""""""
au FileType javascript call JavaScriptFold()
au FileType javascript setl fen
au FileType javascript setl nocindent

au FileType javascript imap <c-t> AJS.log();<esc>hi
au FileType javascript imap <c-a> alert();<esc>hi

au FileType javascript inoremap <buffer> $r return 
au FileType javascript inoremap <buffer> $f //--- PH ----------------------------------------------<esc>FP2xi

function! JavaScriptFold() 
    setl foldmethod=syntax
    setl foldlevelstart=1
    syn region foldBraces start=/{/ end=/}/ transparent fold keepend extend

    function! FoldText()
        return substitute(getline(v:foldstart), '{.*', '{...}', '')
    endfunction
    setl foldtext=FoldText()
endfunction

""""""""""""""""""""""""""""""
" => CoffeeScript section
"""""""""""""""""""""""""""""""
function! CoffeeScriptFold()
    setl foldmethod=indent
    setl foldlevelstart=1
endfunction
au FileType coffee call CoffeeScriptFold()

""""""""""""""""""""""""""""""
" => YankRing
""""""""""""""""""""""""""""""
if has("win16") || has("win32")
" Don't do anything
else
    let g:yankring_history_dir = '~/.vim_runtime/temp_dirs/'
endif


""""""""""""""""""""""""""""""
" => PHP section
""""""""""""""""""""""""""""""
au FileType php set keywordprg=:help


""""""""""""""""""""""""""""""
" => MRU plugin
""""""""""""""""""""""""""""""
let MRU_Max_Entries = 400
map <leader>f :MRU<CR>

""""""""""""""""""""""""""""""
" => ctrlp
""""""""""""""""""""""""""""""
set runtimepath^=~/.vim_runtime/bundle/ctrlp.vim
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip
let g:ctrlp_custom_ignore = {
    \ 'dir':  '\v[\/]\.(git|hg|svn)$',
    \ 'file': '\v\.(exe|so|dll)$',
    \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
    \ }

""""""""""""""""""""""""""""""
" => Gist.vim
""""""""""""""""""""""""""""""
let g:gist_clip_command = 'xclip -selection clipboard'
let g:gist_detect_filetype = 1
let g:gist_open_browser_after_post = 1
let g:github_token = '7052a94413969d07296def10754c70f2'

""""""""""""""""""""""""""""""
" => Vim grep
""""""""""""""""""""""""""""""
let Grep_Skip_Dirs = 'RCS CVS SCCS .svn generated'
set grepprg=/bin/grep\ -nH


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => MISC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm

"Quickly open a buffer for scripbble
map <leader>q :e ~/buffer<cr>
au BufRead,BufNewFile ~/buffer iab <buffer> xh1 ===========================================

map <leader>pp :setlocal paste!<cr>

map <leader>bb :cd ..<cr>

map <leader>ct :cd ~/Desktop/Todoist/todoist<cr>
map <leader>cw :cd ~/Desktop/Wedoist/wedoist<cr>
map <leader>cp :cd ~/Desktop/PlurkGit/trunk<cr>

if MySys() == "mac"
    if has("gui_running")
      set fuoptions=maxvert,maxhorz
      au GUIEnter * set fullscreen
    endif
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" neocomplcache
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" Use underbar completion.
let g:neocomplcache_enable_underbar_completion = 1
" Set minimum syntax keyword length.
let g:neocomplcache_min_syntax_length = 3
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplcache_dictionary_filetype_lists = {
    \ 'default' : '',
    \ 'vimshell' : $HOME.'/.vimshell_hist',
    \ 'scheme' : $HOME.'/.gosh_completions'
    \ }

" Define keyword.
if !exists('g:neocomplcache_keyword_patterns')
  let g:neocomplcache_keyword_patterns = {}
endif
let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
imap <C-k>     <Plug>(neocomplcache_snippets_expand)
smap <C-k>     <Plug>(neocomplcache_snippets_expand)
inoremap <expr><C-g>     neocomplcache#undo_completion()
inoremap <expr><C-l>     neocomplcache#complete_common_string()

" SuperTab like snippets behavior.
"imap <expr><TAB> neocomplcache#sources#snippets_complete#expandable() ? "\<Plug>(neocomplcache_snippets_expand)" : pumvisible() ? "\<C-n>" : "\<TAB>"

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplcache#close_popup()
inoremap <expr><C-e>  neocomplcache#cancel_popup()

" AutoComplPop like behavior.
"let g:neocomplcache_enable_auto_select = 1

" Shell like behavior(not recommended).
"set completeopt+=longest
"let g:neocomplcache_enable_auto_select = 1
"let g:neocomplcache_disable_auto_complete = 1
"inoremap <expr><TAB>  pumvisible() ? "\<Down>" : "\<TAB>"
"inoremap <expr><CR>  neocomplcache#smart_close_popup() . "\<CR>"

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags

" Enable heavy omni completion.
if !exists('g:neocomplcache_omni_patterns')
  let g:neocomplcache_omni_patterns = {}
endif
let g:neocomplcache_omni_patterns.ruby = '[^. *\t]\.\w*\|\h\w*::'
"autocmd FileType ruby setlocal omnifunc=rubycomplete#Complete
let g:neocomplcache_omni_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
let g:neocomplcache_omni_patterns.c = '\%(\.\|->\)\h\w*'
let g:neocomplcache_omni_patterns.cpp = '\h\w*\%(\.\|->\)\h\w*\|\h\w*::'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Line and column highlight
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""" 
"hi CursorLine   cterm=NONE ctermbg=DarkGrey
"hi CursorColumn ctermbg=DarkGrey
set cursorline cursorcolumn
hi CursorLine   cterm=NONE ctermbg=DarkGrey
hi CursorColumn cterm=NONE ctermbg=DarkGrey

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Nerd Tree
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>nn :NERDTreeToggle<cr>
map <leader>nb :NERDTreeFromBookmark
map <leader>nf :NERDTreeFind<cr>

"autocmd vimenter * if !argc() | NERDTree | endif " auto open when start with no file
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" octopress
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile,BufRead *.markdown,*.textile set filetype=html.mkd.octopress

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TaskList
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>td <Plug>TaskList
let g:tlTokenList = ['TODO', 'HACK', 'FIXME', 'XXX']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Gundo
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gu :GundoToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PEP8
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:pep8_map='<leader>8'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PyDoc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set completeopt=menuone,longest,preview

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rope.vim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>gd :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>a <Esc>:Ack!

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" MakeGreen
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>dt :set makeprg=python\ manage.py\ test\|:call MakeGreen()<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" py.test
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Execute the tests
nmap <silent><Leader>tf <Esc>:Pytest file<CR>
nmap <silent><Leader>tc <Esc>:Pytest class<CR>
nmap <silent><Leader>tm <Esc>:Pytest method<CR>
" cycle through test errors
nmap <silent><Leader>tn <Esc>:Pytest next<CR>
nmap <silent><Leader>tp <Esc>:Pytest previous<CR>
nmap <silent><Leader>te <Esc>:Pytest error<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => surround.vim config
" Annotate strings with gettext http://amix.dk/blog/post/19678
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
vmap Si S(i_<esc>f)
au FileType mako vmap Si S"i${ _(<esc>2f"a) }<esc>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove the tabline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set showtabline=0

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" colorscheme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <leader>df :call DistractionFreeWriting()<CR>
function! DistractionFreeWriting()
    colorscheme iawriter
    set background=light
    set gfn=Cousine:h14                " font to use
    set lines=40 columns=100           " size of the editable area
    set fuoptions=background:#00f5f6f6 " macvim specific setting for editor's background color 
    set guioptions-=r                  " remove right scrollbar
    set laststatus=0                   " don't show status line
    set noruler                        " don't show ruler
    set fullscreen                     " go to fullscreen editing mode
    set linebreak                      " break the lines on words
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" highlight tabs and trailing spaces
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set listchars=tab:→\ ,trail:·
set list

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Zen Coding Key Mapping
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:user_zen_leader_key = '<c-m>'

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimOrganizer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
au! BufRead,BufWrite,BufWritePost,BufNewFile *.org
au BufEnter *.org call org#SetOrgFileType()
" let g:org_capture_file = '~/org_files/mycaptures.org'
command! OrgCapture :call org#CaptureBuffer()
command! OrgCaptureFile :call org#OpenCaptureFile()

"==============================================================
" THE UNNECESSARY STUFF
"==============================================================
" Everything below here is a customization. None are needed.
"==============================================================

" The variables below are used to define the default Todo list and
" default Tag list. Both of these can also be defined
" on a document-specific basis by config lines in a file.
" See :h vimorg-todo-metadata and/or :h vimorg-tag-metadata
" 'TODO | DONE' is the default, so not really necessary to define it at all
let g:org_todo_setup='TODO | DONE'
" OR, e.g.,:
"let g:org_todo_setup='TODO NEXT STARTED | DONE CANCELED'

" include a tags setup string if you want:
let g:org_tags_alist='{@school(s) @work(w) @home(h) @hack(k)} {easy(e) hard(d)}'
"
" g:org_agenda_dirs specify directories that, along with
" their subtrees, are searched for list of .org files when
" accessing EditAgendaFiles(). Specify your own here, otherwise
" default will be for g:org_agenda_dirs to hold single
" directory which is directory of the first .org file opened
" in current Vim instance:
" Below is line I use in my Windows install:
" NOTE: case sensitive even on windows.
let g:org_agenda_select_dirs=["~/desktop/org_files"]
let g:org_agenda_files = split(glob("~/desktop/org_files/org-mod*.org"),"\n")

" ----------------------
" Emacs setup
" ----------------------
" To use Emacs you will need to define the client. On
" Linux/OSX this is typically simple, just:
"let g:org_command_for_emacsclient = 'emacsclient'
"
" On Windows it is more complicated, and probably involves creating
" a 'soft link' to the emacsclient executable (which is 'emacsclientw')
" See :h vimorg-emacs-setup
"let g:org_command_for_emacsclient = 'c:\users\herbert\emacsclientw.exe'

" ----------------------
" Custom Agenda Searches
" ----------------------
" The assignment to g:org_custom_searches below defines searches that a
" a user can then easily access from the Org menu or the Agenda Dashboard.
" (Still need to add help on how to define them, assignment below
" is hopefully illustrative for now. . . . )
let g:org_custom_searches = [
            \ { 'name':"Next week's agenda", 'type':'agenda',
            \ 'agenda_date':'+1w', 'agenda_duration':'w' }
            \, { 'name':"Next week's TODOS", 'type':'agenda',
            \ 'agenda_date':'+1w', 'agenda_duration':'w',
            \ 'spec':'+UNFINISHED_TODOS' }
            \, { 'name':'Home tags', 'type':'heading_list', 'spec':'+HOME' }
            \, { 'name':'Home tags', 'type':'sparse_tree', 'spec':'+HOME' }
            \ ]

" --------------------------------
" Custom colors
" --------------------------------"
" OrgCustomColors() allows a user to set highlighting for particular items
function! OrgCustomColors()
    " Various text item 'highlightings' below
    " are the defaults. Uncomment and change a line if you
    " want different highlighting for the element.
    "
    " Below are defaults for any TODOS you define. TODOS that
    " come before the | in a definition will use 'NOTDONETODO'
    " and those that come after are DONETODO
    "hi! DONETODO guifg=green ctermfg=green
    "hi! NOTDONETODO guifg=red ctermfg=lightred

    " Heading level highlighting is done in pairs, one for the
    " heading when unfolded and one for folded. Default is to make
    " them the same except for the folded version being bold:
    " assign OL1 pair for level 1, OL2 pair for level 2, etc.
    "hi! OL1 guifg=somecolor guibg=somecolor
    "hi! OL1Folded guifg=somecolor guibg=somecolor gui=bold


    " Tags are lines below headings that have :colon:separated:tags:
    "hi! Org_Tag guifg=lightgreen ctermfg=blue

    " Lines that begin with '#+' in column 0 are config lines
    "hi! Org_Config_Line guifg=darkgray ctermfg=magenta

    " Drawers are :PROPERTIES: and :LOGBOOK: lines and their associated
    " :END: lines
    "hi! Org_Drawer guifg=pink ctermfg=magenta
    "hi! Org_Drawer_Folded guifg=pink ctermfg=magenta gui=bold cterm=bold

    " This applies to value names in :PROPERTIES: blocks
    "hi! Org_Property_Value guifg=pink ctermfg=magenta

    " Three lines below apply to different kinds of blocks
    "hi! Org_Block guifg=#555555 ctermfg=magenta
    "hi! Org_Src_Block guifg=#555555 ctermfg=magenta
    "hi! Org_Table guifg=#888888 guibg=#333333 ctermfg=magenta

    " Dates are date specs between angle brackets (<>) or square brackets ([])
    "hi! Org_Date guifg=magenta ctermfg=magenta gui=underline cterm=underline

    " Org_Star is used to "hide" initial asterisks in a heading
    "hi! Org_Star guifg=#444444 ctermfg=darkgray

    "hi! Props guifg=#ffa0a0 ctermfg=gray

    " Bold, italics, underline, and code are highlights applied
    " to character formatting
    "hi! Org_Code guifg=darkgray gui=bold ctermfg=14
    "hi! Org_Itals gui=italic guifg=#aaaaaa ctermfg=lightgray
    "hi! Org_Bold gui=bold guifg=#aaaaaa ctermfg=lightgray
    "hi! Org_Underline gui=underline guifg=#aaaaaa ctermfg=lightgray
    "hi! Org_Lnumber guifg=#999999 ctermfg=gray

    " These lines apply to links: [[link]], and [[link][link desc]]
    "if has("conceal")
    " hi! default linkends guifg=blue ctermfg=blue
    "endif
    "hi! Org_Full_Link guifg=cyan gui=underline ctermfg=lightblue cterm=underline
    "hi! Org_Half_Link guifg=cyan gui=underline ctermfg=lightblue cterm=underline

    " Applies to the Heading line that can be displayed in column view
    "highlight OrgColumnHeadings guibg=#444444 guifg=#aaaaaa gui=underline

    " Use g:org_todo_custom_highlights to set up highlighting for individual
    " TODO items. Without this all todos that designate an unfinished state
    " will be highlighted using NOTDONETODO highlight (see above)
    " and all todos that designate a finished state will be highlighted using
    " the DONETODO highlight (see above).
    let g:org_todo_custom_highlights =
               \ { 'NEXT': { 'guifg':'#888888', 'guibg':'#222222',
               \ 'ctermfg':'gray', 'ctermbg':'darkgray'},
               \ 'WAITING': { 'guifg':'#aa3388',
               \ 'ctermfg':'red' } }

endfunction

" Below are two examples of Org-mode "hook" functions
" These present opportunities for end-user customization
" of how VimOrganizer works. For more info see the
" documentation for hooks in Emacs' Org-mode documentation:
" http://orgmode.org/worg/org-configs/org-hooks.php#sec-1_40
"
" These two hooks are currently the only ones enabled in
" the VimOrganizer codebase, but they are easy to add so if
" there's a particular hook you want go ahead and request it
" or look for where these hooks are implemented in
" /ftplugin/org.vim and use them as example for placing your
" own hooks in VimOrganizer:
function! Org_property_changed_functions(line,key, val)
        "call confirm("prop changed: ".a:line."--key:".a:key." val:".a:val)
endfunction
function! Org_after_todo_state_change_hook(line,state1, state2)
        "call confirm("changed: ".a:line."--key:".a:state1." val:".a:state2)
        "call OrgConfirmDrawer("LOGBOOK")
        "let str = ": - State: " . org#Pad(a:state2,10) . " from: " . Pad(a:state1,10) .
        " \ ' [' . org#Timestamp() . ']'
        "call append(line("."), repeat(' ',len(matchstr(getline(line(".")),'^\s*'))) . str)
endfunction

let g:VimuxOrientation = "h"
let VimuxUseNearestPane = 1

" for increase and decrease number key mapping
:nnoremap <A-a> <C-a>
:nnoremap <A-x> <C-x>
