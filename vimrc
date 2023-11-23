map <C-n> :NERDTreeToggle<CR>
nnoremap <Space> i_<Esc>r
hi Comment ctermfg=lightblue

set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\[HEX=\%02.2B]\ [POS=%04l,%04v]\ [%p%%]\ [LEN=%L]
set laststatus=2
