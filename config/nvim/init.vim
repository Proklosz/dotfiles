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
set expandtab               
set shiftwidth=4           
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

syntax enable

" Specify a directory for plugins
call plug#begin('~/.config/nvim/plugged')

" List plugins here
Plug 'jacoborus/tender.vim'
"Plug 'vim-airline/vim-airline'
Plug 'nvim-lualine/lualine.nvim'
" If you want to have icons in your statusline choose one of these
Plug 'nvim-tree/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'
"Plug 'SirVer/ultisnips'
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
highlight CursorLine guibg=#2a2a2a


lua << EOF
require'nvim-treesitter.configs'.setup {
    highlight = {
        enable = true,              -- false will disable the whole extension
        additional_vim_regex_highlighting = false,
        ignore = { "lua" },  -- Disable highlighting for Lua
    },
}

require('lualine').setup {
  options = {
    theme = bubbles_theme,
    component_separators = '',
    section_separators = { left = '', right = '' },
  },
  sections = {
    lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
    lualine_b = { 'filename', 'branch' },
    lualine_c = {
      '%=', --[[ add your center compoentnts here in place of this comment ]]
    },
    lualine_x = {},
    lualine_y = { 'filetype', 'progress' },
    lualine_z = {
      { 'location', separator = { right = '' }, left_padding = 2 },
    },
  },
  inactive_sections = {
    lualine_a = { 'filename' },
    lualine_b = {},
    lualine_c = {},
    lualine_x = {},
    lualine_y = {},
    lualine_z = { 'location' },
  },
  tabline = {},
  extensions = {},
}

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

nnoremap <silent> <F5> :call CocAction('diagnosticToggle')<CR>

nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <C-f> <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

autocmd BufNewFile *.cpp 0r ~/.config/nvim/template.cpp


if (has("termguicolors"))
 set termguicolors
endif

" Coc only does snippet and additional edit on confirm.
inoremap <expr> <Tab> pumvisible() ? "\<C-y>" : "\<Tab>"
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Use <C-space> to trigger completion.
imap <silent><expr> <C-space> coc#refresh()


nnoremap <F12> :NERDTreeToggle<CR>
