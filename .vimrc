" Window Splits
set splitbelow splitright
" Remap splits navigation to just CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
" Make adjusing split sizes a bit more friendly
noremap <silent> <C-Left> :vertical resize +3<CR>
noremap <silent> <C-Right> :vertical resize -3<CR>
noremap <silent> <C-Up> :resize -3<CR>
noremap <silent> <C-Down> :resize +3<CR>
" General Settings
set number
set mouse=a
let mapleader=" "
set ignorecase
set smartcase
set hlsearch
set incsearch

set noswapfile
set clipboard=unnamedplus
" tabs and spaces
set expandtab
set smarttab
set shiftwidth=2
set tabstop=2
"Без звука
set noerrorbells
set novisualbell
" стандарт использования символов переноса строки
set ffs=unix,dos,mac
" чтобы Vim понимал, какие клавиши нажимаются, если включена русская раскладка.
" set langmap=ёйцукенгшщзхъфывапролджэячсмитьбю;`qwertyuiop[]asdfghjkl\;'zxcvbnm\,.,ЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;QWERTYUIOP{}ASDFGHJKL:\"ZXCVBNM<>
set langmap=!\\"№\\;%?*ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;!@#$%&*`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>
" При открытии файла Vim попытается определить кодировку и открыть файл в ней.
" set charset translation encoding
set encoding=utf-8
" set terminal encoding
set termencoding=utf-8
" set save encoding
" set fileencoding=utf-8
" список предполагаемых кодировок, в порядке предпочтения
set fileencodings=utf8,koi8r,cp1251,cp866,ucs-2le

" Change 2 split windows from vert to horiz or horiz to vert
" map <Leader>th <C-w>t<C-w>H
" map <Leader>tk <C-w>t<C-w>K

map <S-tab> :bprevious<CR>
map <tab> :bnext<CR>

" remap
imap ii <Esc>
" python alias (,p runs python on script. ,t times python script)
nmap ,p :w<CR>:!python3 %<CR>
nmap ,t :w<CR>:!time python3 %<CR>

" сочетание клавиш для быстрого сохранения:
nmap <leader>w :w!<cr>

" сочетание клавиш для быстрого выхода:
nmap wq :wq<cr>

" vimgrep ищет строку или регулярное выражение, заключённое между символами «//» в файле или файлах
map <leader>f :vimgrep /text/ /home/**/*.* <bar> :copen

map <leader>ss :setlocal spell!<CR>
" sudo apt install vim-gtk
inoremap <C-v> <ESC>"+pa
vnoremap <C-c> "+y
vnoremap <C-d> "+d

" с помощью команды :W можно было сохранить файл, если он открыт не через sudo
command! W execute 'w !sudo tee % > /dev/null' <bar> edit!

" git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
" vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
" nmap <F6> :NERDTreeToggle<CR>

" Позволяет по <Tab>, более привычному некоторым пользователям, вызывать автодополнение для текущего активного синтаксиса:
function! InsertTabWrapper(direction)
   let col = col('.') - 1
   if !col || getline('.')[col - 1] !~ '\k'
       return "\<tab>"
   elseif "backward" == a:direction
       return "\<c-p>"
   else
       return "\<c-n>"
   endif
endfunction
inoremap <tab> <c-r>=InsertTabWrapper ("forward")<cr>
inoremap <s-tab> <c-r>=InsertTabWrapper ("backward")<cr>

"(tab) выводится список каталогов и файлов текущего каталога.
map <F3> :read !ls
"открывается новая вкладка
map <F4> :browse tabnew <CR>

" Пользовательское меню. Позволяет приостановить работу Vim и вызвать соответствующие программы:
set wildmenu
set wcm=<Tab>
" menu Exec.GForth    :!gforth % <CR>
menu Exec.Python    :!python3 % <CR>
menu Exec.R         :!R % <CR>
menu Exec.Ruby      :!ruby % <CR>
menu Exec.Perl      :!perl % <CR>
menu Exec.zsh       :!/bin/zsh<CR>
menu Exec.alacritty :!alacritty<CR>
menu Exec.vifm      :!vifm<CR>
menu Exec.xterm_mc  :!xterm -e mc<CR>
map <F9> :emenu Exec.<Tab>

" Пользовательское меню. Позволяет вызвать меню различных вариантов завершения работы с Vim.
set wildmenu
set wcm=<Tab>
menu Exit.quit     :quit<CR>
menu Exit.quit!    :quit!<CR>
menu Exit.save     :exit<CR>
map <F10> :emenu Exit.<Tab>

"  для упрощения работы с файлами в различных кодировках
set wildmenu
set wcm=<Tab>
menu Encoding.koi8-r  :e ++enc=koi8-r<CR>
menu Encoding.cp1251  :e ++enc=cp1251<CR>
menu Encoding.cp866   :e ++enc=cp866<CR>
menu Encoding.ucs-2le :e ++enc=ucs-2le<CR>
menu Encoding.utf-8   :e ++enc=utf-8<CR>
map <F12> :emenu Encoding.<Tab>
" :help encoding-values

" для сохранения файлов в различные кодировки
set wildmenu
set wcm=<Tab>
menu FileEncoding.koi8-r  :set fileencoding=koi8-r<CR>
menu FileEncoding.cp1251  :set fileencoding=cp1251<CR>
menu FileEncoding.cp866   :set fileencoding=cp866<CR>
menu FileEncoding.ucs-2le :set fileencoding=ucs-2le<CR>
menu FileEncoding.utf-8   :set fileencoding=utf-8<CR>
map <S-F12> :emenu FileEncoding.<Tab>

"для изменения формата переводов строки (dos, unix или mac):
set wildmenu
set wcm=<Tab>
menu FileFormat.unix :set fileformat=unix <CR>
menu FileFormat.dos  :set fileformat=doc <CR> 
menu FileFormat.mac  :set fileformat=mac <CR>
map <C-F12> :emenu FileFormat.<Tab>
