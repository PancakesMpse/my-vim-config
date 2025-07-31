call plug#begin('~/.vim/plugged')
Plug 'prabirshrestha/vim-lsp'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'preservim/nerdtree'
Plug 'LuaLS/lua-language-server'
call plug#end()

syntax on

if has('termguicolors')
	set termguicolors
endif

nnoremap <leader>ff :Files<CR>
nnoremap <leader>bb :Buffers<CR>
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>n :NERDTreeToggle<CR>

if exists(':LspInstall')
	au User lsp_setup call lsp#register_server({
				\ 'name': 'clangd',
				\ 'cmd': {server_info -> ['clangd', '--background-index', '--clang-tidy', '--completion-style=detailed', '--header-insertion=iwyu']},
				\ 'whitelist': ['c', 'cpp', 'objc', 'objcpp'],
				\ })

	au User lsp_setup call lsp#register_server({
        			\ 'name': 'jdtls',
        			\ 'cmd': {server_info -> ['jdtls']},
      				  \ 'whitelist': ['java'],
     				   \ })
    au User lsp_setup call lsp#register_server({
                \ 'name': 'lua-language-server',
                \ 'cmd': {server_info -> ['lua-language-server']},
                \ 'whitelist': ['lua'],
                \ })
endif

let g:ycm_confirm_extra_conf = 0
let g:ycm_key_list_select_completion = ['<Tab>']
let g:ycm_key_list_previous_completion = ['<S-Tab>']


nmap <silent> gd :LspDefinition<CR>
nmap <silent> gr :LspReferences<CR>
nmap <silent> gi :LspImplementation<CR>
nmap <silent> K :LspHover<CR>
nmap <silent> tn :new<CR>

filetype plugin indent on
