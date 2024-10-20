set number
set relativenumber

set tabstop=4
set softtabstop=4
set wildmode=longest,list
set mouse=a

set showmatch
set cursorline 
set hlsearch
set incsearch
set expandtab               " converts tabs to white space
set shiftwidth=4            " width for autoindents
set autoindent              
set ttyfast
" Split vertically by default
set splitright
set splitbelow
" Evenly distribute the splits
set equalalways
set clipboard+=unnamedplus

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()

"set foldmethod=syntax
"let g:python3_host_prog = expand('~/.local/share/pipx/venvs/pynvim/bin/python')
let g:python3_host_prog = '/usr/bin/python3'


" Enable vim-devicons for vim-airline

"syntax on

syntax enable

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" List plugins here
Plug 'jacoborus/tender.vim'
Plug 'vim-airline/vim-airline'
Plug 'ryanoasis/vim-devicons'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'scrooloose/nerdtree'
Plug 'preservim/nerdcommenter'
Plug 'mhinz/vim-startify'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'jiangmiao/auto-pairs'


Plug 'bluz71/vim-moonfly-colors', { 'as': 'moonfly' }

Plug 'prettier/vim-prettier'

Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

Plug 'norcalli/nvim-colorizer.lua'

Plug 'lukas-reineke/indent-blankline.nvim'
" Initialize plugin system
call plug#end()

colorscheme moonfly
let g:moonflyTransparent = v:true
highlight Normal guibg=rgba(30,30,30,0.9)
" Set default direction to float
lua require'toggleterm'.setup { direction = 'float' }

" ToggleTerm mappings
nnoremap <F9> :lua require'toggleterm'.toggle()<CR>
tnoremap <F9> <C-\><C-n>:lua require'toggleterm'.toggle()<CR>


" Enable Treesitter
lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
        ignore = { "lua" },  -- Disable highlighting for Lua
    },
}

require'ibl'.setup{

}


EOF

if exists("g:neovide")
    " Put anything you want to happen only in Neovide here
    let g:neovide_transparency = 0.8    
    let g:neovide_position_animation_length = 0.15
    let g:neovide_scroll_animation_length = 0.15
    let g:neovide_hide_mouse_when_typing = v:false
    let g:neovide_refresh_rate = 75
    let g:neovide_cursor_trail_size = 0.8
    let g:neovide_cursor_animate_in_insert_mode = v:true
    let g:neovide_cursor_vfx_mode = "torpedo"
    let g:neovide_cursor_vfx_opacity = 1000.0
    let g:neovide_cursor_vfx_particle_density = 100.0
    let g:neovide_cursor_vfx_particle_phase = 50.0
    let g:neovide_cursor_vfx_particle_curl = 0.7
    let g:neovide_cursor_vfx_particle_speed = 15.0







endif



let g:auto_pairs = 1
let g:AutoPairsMapCR = 0
" Add this line to toggle diagnostics with a keybinding
" which clangd
" Autocommand to toggle diagnostics when opening a new file
" autocmd BufEnter * call CocAction('diagnosticToggle')


nnoremap <silent> <F5> :call CocAction('diagnosticToggle')<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
"
"

"
autocmd BufNewFile *.cpp 0r ~/.config/nvim/template.cpp


let g:term_open = 0

" Toggle terminal in vertical split
function! ToggleTerminal()
    if g:term_open == 0
        sp term://$SHELL
        execute 'wincmd J'
        horizontal resize 20
        let g:term_open = 1
    else
        bd!
        let g:term_open = 0
    endif
endfunction

" ToggleTerm mappings
"nnoremap <F9> :lua require'toggleterm'.toggle()<CR>
"tnoremap <F9> <C-\><C-n>:lua require'toggleterm'.toggle()<CR>

tnoremap <F10> <C-\><C-n><C-w><Up>
" Focus terminal window
nnoremap <F10> :wincmd w<CR>

"  Initialize Coc.nvim
"
" autocmd BufEnter * silent! :call CocActionAsync('highlight')
if (has("termguicolors"))
 set termguicolors
endif


lua << EOF
require'colorizer'.setup({
  '*'; -- Highlight all files, but customize some others.
}, {
  RGB      = true;         -- #RGB hex codes
  RRGGBB   = true;         -- #RRGGBB hex codes
  names    = true;         -- "Name" codes like Blue
  RRGGBBAA = true;         -- #RRGGBBAA hex codes
  rgb_fn   = true;         -- CSS rgb() and rgba() functions
  hsl_fn   = true;         -- CSS hsl() and hsla() functions
  css      = true;         -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn   = true;         -- Enable all CSS *functions*: rgb_fn, hsl_fn
  mode     = 'background'; -- Set the display mode.
})
EOF



" Use <Tab> for trigger completion and navigate through suggestions
inoremap <silent><expr> <TAB> pumvisible() ? "\<C-n>" : "\<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<TAB>"

" Use <CR> to confirm completion, <C-g>u means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-space> to trigger completion.
imap <silent><expr> <C-space> coc#refresh()



nnoremap <F12> :NERDTreeToggle<CR>
