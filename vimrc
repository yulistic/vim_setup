"Plug automatic installation.
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Begin Plug.
call plug#begin('~/.vim/plugged')

"fzf-vim
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'

"coc-fzf
Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

"" deoplete.nvim
"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif

Plug 'airblade/vim-gitgutter'  " Show changed lines.
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'nathanaelkane/vim-indent-guides'
" Plug 'yggdroot/indentline'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'jeffkreeftmeijer/vim-numbertoggle'
Plug 'christoomey/vim-tmux-navigator'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'
Plug 'scrooloose/nerdcommenter'
Plug 'majutsushi/tagbar'
Plug 'easymotion/vim-easymotion'
"Plug 'raimondi/delimitmate'
"Plug 'lervag/vimtex'
Plug 'vim-scripts/DoxygenToolkit.vim'

" colorscheme (Themes)
Plug 'morhetz/gruvbox'
Plug 'yous/vim-open-color'
Plug 'sainnhe/sonokai'
" Used for vimdiff.
Plug 'junegunn/seoul256.vim'

" End Plug.
call plug#end()

"" colorscheme
colorscheme sonokai

"Pathogen.
" execute pathogen#infect()
" call pathogen#helptags()
" filetype plugin indent on

"Vim settings.
" set number            " display line number
set ai                    " auto indent
set si                    " smart indent
set cindent            " c style indent
set tabstop=8         " tab을 4칸으로
set shiftwidth=8      " shift를 4칸으로 ( >, >>, <, << 등의 명령어)
set softtabstop=8
" set expandtab
set noexpandtab
set hlsearch         " 검색시 하이라이트(색상 강조)
set background=dark  " 검정배경을 사용할 때, (이 색상에 맞춰 문법 하이라이트 색상이 달라집니다.)
set fileencodings=utf-8,euc-kr    " 파일인코딩 형식 지정
set bs=indent,eol,start    " backspace 키 사용 가능
set history=1000    " 명령어에 대한 히스토리를 1000개까지
set ruler              " 상태표시줄에 커서의 위치 표시
set title               " 제목을 표시
set showmatch    " 매칭되는 괄호를 보여줌
set nowrap         " 자동 줄바꿈 하지 않음
set wmnu           " tab 자동완성시 가능한 목록을 보여줌
"set visualbell		"키를 잘못 누르면 화면을 번쩍이게 함.
" set shell=/bin/bash
set wrap
set autochdir	"자동으로 열린파일의 디렉토리로 이동함.
set foldmethod=manual
set foldnestmax=10
set nofoldenable
set foldlevel=2
" set foldmethod=manual
" au BufWinLeave * mkview             " Save fold state when file closed.
" au BufWinEnter * silent loadview    " Load fold state when file opened.

" set laststatus=2    "statusline 항시 출력
" set statusline+=%F  "file의 full path를 statusline에 출력

" buffers
set wildchar=<Tab> wildmenu wildmode=full
set wildcharm=<C-Z>
nnoremap <F10> :b <C-Z>

" Key re-mapping
inoremap <c-[> <ESC>
let mapleader = ","
let maplocalleader = "\\"

syntax on        " 문법 하이라이트 킴"

"Background related. Solarized.
"syntax enable
"if has('gui_running')
"	set background=light
"else
"	set background=dark
"endif
"colorscheme solarized

"" ctags
"set tags=./tags,tags;$HOME
set tags=./tags,tags;

"" cscope
set cscoperelative
" Cscope 프로젝트 root directory에 있는 cscope.out을 자동으로 불러오기위한
" script.
function! LoadCscope()
       let db = findfile("cscope.out", ".;")
       if (!empty(db))
	       let path = strpart(db, 0, match(db, "/cscope.out$"))
	       set nocscopeverbose " suppress 'duplicate connection' error
	       exe "cs add " . db . " " . path
	       set cscopeverbose
       endif
endfunction
au BufEnter /* call LoadCscope()

"NERD Commenter "
filetype plugin on
let NERD_c_alt_style = 1
let NERD_java_alt_style = 1
let g:NERDAltDelims_c = 1
let g:NERDAltDelims_java = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDTrimTrailingWhitespace = 1
let g:NERDDefaultNesting = 1

filetype on

"Tagbar setting
nmap <F7> :TagbarToggle<CR>

"" NERDTree
let NERDTreeWinPos="left"
nmap <F9> :NERDTreeToggle<CR>

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" DoxygenToolkit
let g:DoxygenToolkit_briefTag_pre="@Synopsis  "
let g:DoxygenToolkit_paramTag_pre="@Param "
let g:DoxygenToolkit_returnTag="@Returns   "
" let g:DoxygenToolkit_blockHeader="-------------------------------"
" let g:DoxygenToolkit_blockFooter="---------------------------------"
let g:DoxygenToolkit_authorName="Jongyul Kim"
" let g:DoxygenToolkit_licenseTag="My own license"

" armasm 플러그인 관련
"let asmsyntax='armasm'
"let filetype_inc='armasm'

"Powerline related"

""set rtp+={repository_root}/powerline/bindings/vim/powerline/bindings/vim

""python from powerline.vim import setup as powerline_setup
""python powerline_setup()
""python del powerline_setup

" Cscope related.
"set csprg=/usr/bin/cscope
"set csto=0
"set cst
"set nocsverb
"if filereadable("./cscope.out")
    "cs add cscope.out
"else
    "cs add /usr/src/linux/cscope.out
"endif
"set csverb

" Powerline
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set laststatus=2
"set t_Co=256

"set rtp+=/home/yulistic/.local/lib/python2.7/site-packages/powerline/bindings/vim
"python from powerline.vim import setup as powerline_setup
"python powerline_setup()
"python del powerline_setup
"set laststatus=2
"set t_Co=256

" For conceal markers.
if has('conceal')
  set conceallevel=2 concealcursor=niv
endif

" For fast huge file open.
" file is large from 10mb
let g:LargeFile = 1024 * 1024 * 256
augroup LargeFile
 autocmd BufReadPre * let f=getfsize(expand("<afile>")) | if f > g:LargeFile || f == -2 | call LargeFile() | endif
augroup END

function LargeFile()
 " no syntax highlighting etc
 set eventignore+=FileType
 " save memory when other file is viewed
 setlocal bufhidden=unload
 " is read-only (write with :w new_filename)
 setlocal buftype=nowrite
 " no undo possible
 setlocal undolevels=-1
 " display message
 autocmd VimEnter *  echo "The file is larger than " . (g:LargeFile / 1024 / 1024) . " MB, so some options are changed (see .vimrc for details)."
endfunction


" EasyMotion configuration.
" let g:EasyMotion_do_mapping = 0 " Disable default mappings

" " Jump to anywhere you want with minimal keystrokes, with just one key binding.
" " `s{char}{label}`
" nmap t <Plug>(easymotion-overwin-f)
" " or
" " `s{char}{char}{label}`
" " Need one more keystroke, but on average, it may be more comfortable.
nmap t <Plug>(easymotion-overwin-f2)

" " Turn on case insensitive feature
" let g:EasyMotion_smartcase = 1

"" hjkl motions: Line motions
map <Leader>l <Plug>(easymotion-lineforward)
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)
map <Leader>h <Plug>(easymotion-linebackward)
" <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

"" Highlights whitespace at the end of a line
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

"" vimtex
" let g:vimtex_view_general_viewer = 'zathura'
" let g:vimtex_view_method = 'zathura'
" Use okular for PDF viewer.
" let g:vimtex_view_general_viewer = 'okular'
" let g:vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
" let g:vimtex_view_general_options_latexmk = '--unique'

"" Ggrep
" :command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | aboveleft cw | redraw!
" :command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | belowright cw | redraw!
" :command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | botright cw | redraw!
:command -nargs=+ Ggr execute 'silent Ggrep!' <q-args> | topleft cw | redraw!
map <Leader>g :Ggr <cword><CR>
nmap <Leader>g :Ggr <cword><CR>
"" Map quickfix list navigation.
" map <C-n> :cn<CR>
" map <C-p> :cp<CR>
map ]q :cn<CR>
map [q :cp<CR>
map ]Q :clast<CR>
map [Q :cfirst<CR>

"" display column limit
if exists('+colorcolumn')
    set colorcolumn=80
else
    au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%80v.\+', -1)
endif
" highlight ColorColumn ctermbg=235 guibg=#2c2d27

"" Auto bracket
inoremap {<CR>  {<CR>}<Esc>O

"" deoplete.nvim
" let g:deoplete#enable_at_startup = 1

"" Move lines easily.
" Linux
" nnoremap <A-j> :m .+1<CR>==
" nnoremap <A-k> :m .-2<CR>==
" inoremap <A-j> <Esc>:m .+1<CR>==gi
" inoremap <A-k> <Esc>:m .-2<CR>==gi
" vnoremap <A-j> :m '>+1<CR>gv=gv
" vnoremap <A-k> :m '<-2<CR>gv=gv

" MacOS
" nnoremap ∆ :m .+1<CR>==
" nnoremap ˚ :m .-2<CR>==
" inoremap ∆ <Esc>:m .+1<CR>==gi
" inoremap ˚ <Esc>:m .-2<CR>==gi
" vnoremap ∆ :m '>+1<CR>gv=gv
" vnoremap ˚ :m '<-2<CR>gv=gv

" Using Shift + arrow keys
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"" vim-gitgutter
set updatetime=300
let g:gitgutter_preview_win_floating = 1
" au CursorMoved * if gitgutter#hunk#in_hunk(line(".")) | GitGutterPreviewHunk | else | pclose | endif
" au CursorMoved * if !gitgutter#hunk#in_hunk(line(".")) | pclose | endif
" let g:gitgutter_use_location_list = 1

"" Indent Guides
" let g:indent_guides_enable_on_vim_startup = 1

"" indentline
" let g:indentLine_enabled = 1

" vertical line for indent.
set list lcs=tab:\|\ 

"" vim-airline
let g:airline_left_sep=' '
let g:airline_right_sep=' '
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
" let g:airline#extensions#tabline#formatter = 'default'
let g:airline#extensions#tabline#formatter = 'unique_tail'
" let g:airline#extensions#branch#enabled = 0
let g:airline#extensions#whitespace#enabled = 0
let g:airline_section_b = ''
let g:airline_section_y = ''
let g:airline_section_z = ''
let g:airline_powerline_fonts = 1
let g:airline#extensions#coc#enabled = 1

"" Hybrid line numbers.
"" Refer to plugin: 'jeffkreeftmeijer/vim-numbertoggle'
""
" turn hybrid line numbers on
" set number relativenumber
"set nu rnu
" turn hybrid line numbers off
"set nonumber norelativenumber
" set nonu nornu
" toggle hybrid line numbers
"set number! relativenumber!
"set nu! rnu!
set nu

"" vim-devicons
set encoding=UTF-8

"" fzf
map <Leader>o :GFiles <CR>
nmap <Leader>o :GFiles <CR>
map <Leader>t :Tags <CR>
nmap <Leader>t :Tags <CR>
map <Leader>b :Buffers <CR>
nmap <Leader>b :Buffers <CR>

"" vim-tmux-navigator
"" Remapping is required because it conflicts with cscope mapping (ctrl+\).
let g:tmux_navigator_no_mappings = 1
nnoremap <silent> <c-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <c-j> :TmuxNavigateDown<cr>
nnoremap <silent> <c-k> :TmuxNavigateUp<cr>
nnoremap <silent> <c-l> :TmuxNavigateRight<cr>
" nnoremap <silent> <c-\> :TmuxNavigatePrevious<cr>

"" coc.nvim """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TextEdit might fail if hidden is not set.
set hidden

" Some servers have issues with backup files, see #649.
set nobackup
set nowritebackup

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c
" set shortmess=aFc

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
" inoremap <silent><expr> <TAB>
"       \ pumvisible() ? "\<C-n>" :
"       \ <SID>check_back_space() ? "\<TAB>" :
"       \ coc#refresh()
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings for CoCList
" Show all diagnostics.
nnoremap <silent><nowait> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent><nowait> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
nnoremap <silent><nowait> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent><nowait> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent><nowait> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent><nowait> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent><nowait> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
nnoremap <silent><nowait> <space>p  :<C-u>CocListResume<CR>

" Mappings for coc-snippets
" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)

" plug-ins
let g:coc_global_extensions = [
    \ 'coc-json',
    \ 'coc-snippets',
    \ 'coc-pairs',
    \ 'coc-tsserver',
    \ 'coc-json',
    \ 'coc-python',
    \ 'coc-sh',
    \ ]
    " \ 'coc-clangd',
"" coc.nvim END """"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" suppress error message popped when using vim <= 8.1.1719.
let g:coc_disable_startup_warning = 1
