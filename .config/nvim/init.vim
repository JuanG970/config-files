call plug#begin()
Plug 'preservim/nerdtree'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
"
" Color schemes
Plug 'arcticicestudio/nord-vim'
Plug 'danilo-augusto/vim-afterglow'
Plug 'danilo-augusto/vim-afterglow'
Plug 'morhetz/gruvbox'

Plug 'ajmwagar/vim-deus'
Plug 'sheerun/vim-polyglot'

Plug 'voldikss/vim-mma'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

Plug 'tpope/vim-fugitive'

Plug 'tpope/vim-commentary'

Plug 'airblade/vim-gitgutter'
Plug 'echasnovski/mini.starter'
Plug 'lewis6991/gitsigns.nvim' " OPTIONAL: for git status
Plug 'nvim-tree/nvim-web-devicons' " OPTIONAL: for file icons

" Tab bar
Plug 'romgrk/barbar.nvim'

" Indent lines
Plug 'lukas-reineke/indent-blankline.nvim'


" LSP Support
Plug 'neovim/nvim-lspconfig'
Plug 'williamboman/mason.nvim'
Plug 'williamboman/mason-lspconfig.nvim'

" Autocompletion
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-cmdline'
Plug 'hrsh7th/nvim-cmp'
"
" Snippets
Plug 'L3MON4D3/LuaSnip', {'tag': 'v2.*', 'do': 'make install_jsregexp'}

" Snippets edition
Plug 'chrisgrieser/nvim-scissors'
Plug 'rafamadriz/friendly-snippets'

" Codeium AI
" Plug 'Exafunction/codeium.nvim'
Plug 'Exafunction/codeium.vim', { 'branch': 'main' }

Plug 'VonHeikemen/lsp-zero.nvim', {'branch': 'v3.x'}

" Wiki
Plug 'vimwiki/vimwiki'
Plug 'xolox/vim-notes'
Plug 'xolox/vim-misc'
Plug 'tools-life/taskwiki'

" Obsidian
Plug 'Ilyasyoy/coredor.nvim'
Plug 'IlyasYOY/obs.nvim'
Plug 'lukas-reineke/headlines.nvim'

" Big files
Plug 'LunarVim/bigfile.nvim'

" Visible marks
Plug 'kshenoy/vim-signature'


" commentstring
Plug 'numToStr/Comment.nvim'

" Screollbar
Plug 'petertriho/nvim-scrollbar'

" Split separators
Plug 'nvim-zh/colorful-winsep.nvim'

" Zen mode
Plug 'Pocco81/true-zen.nvim'

" vifm
Plug 'vifm/vifm.vim'

" Plantuml
Plug 'tyru/open-browser.vim'
Plug 'weirongxu/plantuml-previewer.vim'

call plug#end()

" General config
let mapleader=" "
set encoding=utf-8
set mouse=a
set number
set hidden
set cursorline
set expandtab
set autoindent
set smartindent
set shiftwidth=4
set tabstop=4
set encoding=utf8
set history=5000
set clipboard=unnamedplus
set signcolumn=yes
set pumheight=10
syntax on
set linebreak
set display+=lastline
set backspace=indent,eol,start  "Allow backspace in insert mode
set colorcolumn=110
set foldmethod=indent
set nofoldenable    " disable folding
" set scrolloff=10

noremap <silent> k gk
noremap <silent> j gj
inoremap jk <ESC>

filetype plugin indent on


" Return to last edit position when opening files (You want this!)
autocmd BufReadPost *
     \ if line("'\"") > 0 && line("'\"") <= line("$") |
     \   exe "normal! g`\"" |
     \ endif


" Useful mappings
"
" Search and replace with confirmation
noremap ;; :%s:::cg<Left><Left><Left><Left>
noremap ;' :%s:::g<Left><Left><Left>

" Run a shell command and get the output on a new buffer
noremap ;! :tabnew \| r !


" Change directory to wyatt
nnoremap <leader>1 :cd /Users/juangonzalez/WolframWorkspaces/Base/wyatterp<CR>

" ================ Turn Off Swap Files ==============

set noswapfile
set nobackup
set nowb

" ================ Persistent Undo ==================
" Keep undo history across sessions, by storing in file.
" Only works all the time.
if has('persistent_undo')
  silent !mkdir ~/.vim/backups > /dev/null 2>&1
  set undodir=~/.vim/backups
  set undofile
endif


" Better search
set hlsearch
set incsearch
set smartcase
nnoremap <silent><expr> <Leader>h (&hls && v:hlsearch ? ':nohls' : ':set hls')."\n"

" Toggle word wrapping with <leader> + w
nnoremap <silent> <leader>w :set wrap! wrap?<CR>

" Spelling
" nnoremap <leader>ts :setlocal spell spelllang=en_us | set spelloptions=camel<CR>
set spell spelllang=en_us
autocmd BufEnter * set spelloptions=camel


" ===================================== Look and feel =====================================
" set t_Co=256
" set termguicolors
" hi! Normal ctermbg=NONE guibg=NONE
" hi! NonText ctermbg=NONE guibg=NONE guifg=NONE ctermfg=NONE
" 
" let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
" let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
" Styled and colored underline support
let &t_AU = "\e[58:5:%dm"
let &t_8u = "\e[58:2:%lu:%lu:%lum"
let &t_Us = "\e[4:2m"
let &t_Cs = "\e[4:3m"
let &t_ds = "\e[4:4m"
let &t_Ds = "\e[4:5m"
let &t_Ce = "\e[4:0m"
" Strikethrough
let &t_Ts = "\e[9m"
let &t_Te = "\e[29m"
" Truecolor support
let &t_8f = "\e[38:2:%lu:%lu:%lum"
let &t_8b = "\e[48:2:%lu:%lu:%lum"
let &t_RF = "\e]10;?\e\\"
let &t_RB = "\e]11;?\e\\"
" Bracketed paste
let &t_BE = "\e[?2004h"
let &t_BD = "\e[?2004l"
let &t_PS = "\e[200~"
let &t_PE = "\e[201~"
" Cursor control
let &t_RC = "\e[?12$p"
let &t_SH = "\e[%d q"
let &t_RS = "\eP$q q\e\\"
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
let &t_VS = "\e[?12l"
" Focus tracking
let &t_fe = "\e[?1004h"
let &t_fd = "\e[?1004l"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX) && getenv('TERM_PROGRAM') != 'Apple_Terminal')
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif

" set background=dark    " Setting dark mode
" colorscheme nord
let g:gruvbox_transparent_bg=1
let g:gruvbox_sign_columns='bg0'
autocmd vimenter * ++nested colorscheme gruvbox

" ================================== Airline =================================
" let g:airline_theme='nord'
"let g:airline_theme='afterglow'
let g:airline_section_y=''
let g:airline_section_z=''
let g:airline#extensions#whitespace#enabled = 0
let g:airline_mode_map = {
    \ '__' : '-',
    \ 'n'  : 'N',
    \ 'i'  : 'I',
    \ 'R'  : 'R',
    \ 'c'  : 'C',
    \ 'v'  : 'V',
    \ 'V'  : 'V',
    \ '' : 'V',
    \ 's'  : 'S',
    \ }

set listchars=eol:¬,tab:>·,trail:~,extends:>,precedes:<,space:·
set list

" ===================================== NERD Tree ===================================

let g:NERDTreeGitStatusWithFlags = 1
let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1
"let g:NERDTreeColorMapCustom = {
    "\ "Staged"    : "#0ee375",  
    "\ "Modified"  : "#d9bf91",  
    "\ "Renamed"   : "#51C9FC",  
    "\ "Untracked" : "#FCE77C",  
    "\ "Unmerged"  : "#FC51E6",  
    "\ "Dirty"     : "#FFBD61",  
    "\ "Clean"     : "#87939A",   
    "\ "Ignored"   : "#808080"   
    "\ }                         


let g:NERDTreeIgnore = ['^node_modules$']

nmap <silent> <leader>tt <cmd>NERDTreeToggle<cr>

" ========================== Telescope - finder =======================================
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <Leader>ff :lua require'telescope.builtin'.find_files(require('telescope.themes').get_dropdown({ winblend = 0 }))<cr>
nnoremap <Leader>f. <cmd>Telescope current_buffer_fuzzy_find<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
" Git related
nnoremap <leader>gg :vertical Git<cr>
nnoremap <leader>gs <cmd>Telescope git_stash<cr>
nnoremap <leader>gb <cmd>Telescope git_branches<cr>
nnoremap <leader>gl <cmd>Telescope git_commits<cr>
nnoremap <leader>gd <cmd>Gdiffsplit<cr>
nnoremap <leader>gp <cmd>Gitsigns preview_hunk<cr>

" ========================== Vim Wiki =======================================
let g:vimwiki_list = [{'path': '~/Documents/wiki',
                      \ 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0

let g:notes_suffix = '.md'
let g:notes_directories = ['~/Documents/wiki/notes']



" ================================== barbar.nvim ===============
" Move to previous/next
nnoremap <silent>    <C-,> <Cmd>BufferPrevious<CR>
nnoremap <silent>    <C-.> <Cmd>BufferNext<CR>

" Re-order to previous/next
nnoremap <silent>    <M-<> <Cmd>BufferMovePrevious<CR>
nnoremap <silent>    <M->> <Cmd>BufferMoveNext<CR>

" Goto buffer in position...
nnoremap <silent>    <C-1> <Cmd>BufferGoto 1<CR>
nnoremap <silent>    <C-2> <Cmd>BufferGoto 2<CR>
nnoremap <silent>    <C-3> <Cmd>BufferGoto 3<CR>
nnoremap <silent>    <C-4> <Cmd>BufferGoto 4<CR>
nnoremap <silent>    <C-5> <Cmd>BufferGoto 5<CR>
nnoremap <silent>    <C-6> <Cmd>BufferGoto 6<CR>
nnoremap <silent>    <C-7> <Cmd>BufferGoto 7<CR>
nnoremap <silent>    <C-8> <Cmd>BufferGoto 8<CR>
nnoremap <silent>    <C-9> <Cmd>BufferGoto 9<CR>
nnoremap <silent>    <C-0> <Cmd>BufferLast<CR>


" Close buffer
nnoremap <silent>    <C-c> <Cmd>BufferClose<CR>
"
" Wipeout buffer
"                          :BufferWipeout
" Close commands
"                          :BufferCloseAllButCurrent
"                          :BufferCloseAllButVisible
"                          :BufferCloseAllButPinned
"                          :BufferCloseAllButCurrentOrPinned
"                          :BufferCloseBuffersLeft
"                          :BufferCloseBuffersRight

" Magic buffer-picking mode
nnoremap <silent> <C-p>    <Cmd>BufferPick<CR>
" nnoremap <silent> <C-p>    <Cmd>BufferPickDelete<CR>

" Sort automatically by...
nnoremap <silent> <Space>bb <Cmd>BufferOrderByBufferNumber<CR>
nnoremap <silent> <Space>bd <Cmd>BufferOrderByDirectory<CR>
nnoremap <silent> <Space>bw <Cmd>BufferOrderByWindowNumber<CR>


let g:codeium_no_map_tab =1
imap <script><silent><nowait><expr> <C-g> codeium#Accept()
imap <C-;>   <Cmd>call codeium#CycleCompletions(1)<CR>
imap <C-,>   <Cmd>call codeium#CycleCompletions(-1)<CR>
imap <C-x>   <Cmd>call codeium#Clear()<CR>

" ============================= Copy line number ===========================
nnoremap <leader>cp :redir @+<CR>:echo "Line: " . line(".")<CR>:redir END<CR>

" ========================== Mathematica ===========================
autocmd FileType mma setlocal commentstring="(* %s *)"

" Show WL Function name
fun! ShowFuncName()
  let lnum = line(".")
  let col = col(".")
  let pattern = '^\s*\\function \(\w*\)'
  let func_name = matchstr(getline(search(pattern, 'bW')), pattern)
  if func_name != ''
    echohl ModeMsg
    echo func_name
    echohl None
  else
    echo "No function name found."
  endif
  call search("\\%" . lnum . "l" . "\\%" . col . "c")
endfun

map <F2> :call ShowFuncName() <CR>

" ========================== PlantUML Config =========================
au FileType plantuml let g:plantuml_previewer#plantuml_jar_path = "/Users/juangonzalez/JAR Files/plantuml.jar"

" ========================== LUA CONFIG =========================

lua << EOF
local lsp_zero = require('lsp-zero')

local autocmd = vim.api.nvim_create_autocmd
autocmd("FileType", {
    pattern = "mma",
    callback = function()
        local root_dir = vim.fs.dirname(
            vim.fs.find({ '.git' }, { upward = true })[1]
        )

        local client = vim.lsp.start({
            name = 'wolfram-lsp',
            cmd = {
                "/Applications/Mathematica.app/Contents/MacOS/WolframKernel",
                "kernel",
                "-noinit",
                "-noprompt",
                "-nopaclet",
                "-noicon",
                "-nostartuppaclets",
                "-run",
                'Needs["LSPServer`"];LSPServer`StartServer[]',
            },
            root_dir = root_dir
        })

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>kd", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>kw", vim.diagnostic.setqflist)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>d", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })

        vim.lsp.buf_attach_client(0, client)
    end
})

autocmd("FileType", {
    pattern = "python",
    callback = function()

        vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
        vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
        vim.keymap.set("n", "<leader>kd", vim.diagnostic.open_float)
        vim.keymap.set("n", "<leader>kw", vim.diagnostic.setqflist)
        vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help)
        vim.keymap.set("n", "K", vim.lsp.buf.hover)
        vim.keymap.set("n", "gr", vim.lsp.buf.references)
        vim.keymap.set("n", "<leader>d", ":Telescope lsp_document_symbols<CR>", { noremap = true, silent = true })
    end
})

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end


-- Set up nvim-cmp completions
local luasnip = require("luasnip")
local cmp = require('cmp')

-- load snippets from path/of/your/nvim/config/my-cool-snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.stdpath("config") .. "/snippets", } })

local ELLIPSIS_CHAR = '…'
local MAX_LABEL_WIDTH = 25
local MAX_KIND_WIDTH = 14
local MAX_ITEM_COUNT = 7

local get_ws = function (max, len)
  return (" "):rep(max - len)
end

local format = function(_, item)
  local content = item.abbr
  -- local kind_symbol = symbols[item.kind]
  -- item.kind = kind_symbol .. get_ws(MAX_KIND_WIDTH, #kind_symbol)

  if #content > MAX_LABEL_WIDTH then
    item.abbr = vim.fn.strcharpart(content, 0, MAX_LABEL_WIDTH) .. ELLIPSIS_CHAR
  else
    item.abbr = content .. get_ws(MAX_LABEL_WIDTH, #content)
  end

  return item
end


cmp.setup({
    snippet = {
        expand = function(args)
            local luasnip = prequire("luasnip")
            if not luasnip then
                return
            end
            luasnip.lsp_expand(args.body)
        end,
    },

    window = {
      completion = cmp.config.window.bordered({
        winhighlight = "Normal:Pmenu,FloatBorder:Pmenu,CursorLine:PmenuSel,Search:None",
      }),
      documentation = cmp.config.window.bordered(),
    },

    sources = cmp.config.sources({
      { name = 'luasnip' },
      { name = "codeium" },
      { name = 'buffer', max_item_count = MAX_ITEM_COUNT },
      { name = 'nvim_lsp' },
    },
    { }
    ),

    mapping = cmp.mapping.preset.insert({
        ["<CR>"] = cmp.mapping.confirm { select = true },
        ["<C-n>"] = cmp.mapping(function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          elseif luasnip.expand_or_jumpable() then
            luasnip.expand_or_jump()
          elseif has_words_before() then
            cmp.complete()
          else
            fallback()
          end
        end, { "i", "s" }),

        ["<C-p>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end,
            { "i", "s" }),
    }),

  formatting = {
    format = format,
  },

})

  -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline({ '/', '?' }, {
    mapping = cmp.mapping.preset.cmdline(),
    sources = {
      { name = 'buffer' }
    }
  })

  -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
  cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    sources = cmp.config.sources({
      { name = 'path' }
    }, {
      { name = 'cmdline' }
    })
  })

-- Indent lines
require("ibl").setup()

-- Codeium
-- require("codeium").setup({ })

-- Snippets edition - scissors
-- default settings
require("scissors").setup {
	snippetDir = vim.fn.stdpath("config") .. "/snippets",
	editSnippetPopup = {
		height = 0.4, -- relative to the window, number between 0 and 1
		width = 0.6,
		border = "rounded",
		keymaps = {
			cancel = "q",
			saveChanges = "<CR>", -- alternatively, can also use `:w`
			goBackToSearch = "<BS>",
			deleteSnippet = "<C-BS>",
			duplicateSnippet = "<C-d>",
			openInFile = "<C-o>",
			insertNextToken = "<C-t>", -- insert & normal mode
			jumpBetweenBodyAndPrefix = "<C-Tab>", -- insert & normal mode
		},
	},
	telescope = {
		-- By default, the query only searches snippet prefixes. Set this to
		-- `true` to also search the body of the snippets.
		alsoSearchSnippetBody = false,
	},
	-- `none` writes as a minified json file using `vim.encode.json`.
	-- `yq`/`jq` ensure formatted & sorted json files, which is relevant when
	-- you version control your snippets.
	jsonFormatter = "jq", -- "yq"|"jq"|"none"
}

vim.keymap.set("n", "<leader>se", function() require("scissors").editSnippet() end)
-- When used in visual mode prefills the selection as body.
vim.keymap.set({ "n", "x" }, "<leader>sa", function() require("scissors").addNewSnippet() end)

vim.keymap.set({"i"}, "<C-K>", function() local ls = require("luasnip") ls.expand() end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-L>", function() local ls = require("luasnip") ls.jump( 1) end, {silent = true})
vim.keymap.set({"i", "s"}, "<C-J>", function() local ls = require("luasnip") ls.jump(-1) end, {silent = true})

-- Mason and LSP
require("mason").setup()

-- Python config
require'lspconfig'.pyright.setup{}

-- Obsidian
local obs = require "obs"

obs.setup {
    vault_home = "/Users/juangonzalez/WRI Vault",
    vault_name = "WRI Vault",
    journal = {
        template_name = "Templates/Work-log template",
    },
}


vim.keymap.set("n", "<leader>nn", "<cmd>ObsNvimFollowLink<cr>")
vim.keymap.set("n", "<leader>nr", "<cmd>ObsNvimRandomNote<cr>")
vim.keymap.set("n", "<leader>nN", "<cmd>ObsNvimNewNote<cr>")
vim.keymap.set("n", "<leader>ny", "<cmd>ObsNvimCopyObsidianLinkToNote<cr>")
vim.keymap.set("n", "<leader>no", "<cmd>ObsNvimOpenInObsidian<cr>")
vim.keymap.set("n", "<leader>nd", "<cmd>ObsNvimDailyNote<cr>")
vim.keymap.set("n", "<leader>nw", "<cmd>ObsNvimWeeklyNote<cr>")
vim.keymap.set("n", "<leader>nrn", "<cmd>ObsNvimRename<cr>")
vim.keymap.set("n", "<leader>nT", "<cmd>ObsNvimTemplate<cr>")
vim.keymap.set("n", "<leader>nM", "<cmd>ObsNvimMove<cr>")
vim.keymap.set("n", "<leader>nb", "<cmd>ObsNvimBacklinks<cr>")
vim.keymap.set("n", "<leader>nfj", "<cmd>ObsNvimFindInJournal<cr>")
vim.keymap.set("n", "<leader>nff", "<cmd>ObsNvimFindNote<cr>")
vim.keymap.set("n", "<leader>nfg", "<cmd>ObsNvimFindInNotes<cr>")

-- default config - Big File mode
require("bigfile").setup {
  filesize = 2, -- size of the file in MiB, the plugin round file sizes to the closest MiB
  pattern = { "*" }, -- autocmd pattern or function see <### Overriding the detection of big files>
  features = { -- features to disable
    -- "indent_blankline",
    --"illuminate",
    "lsp",
    "treesitter",
    "matchparen"
    -- "syntax",
    -- "vimopts",
    -- "filetype",
  },
}

-- Obsidian
require("headlines").setup()

local header_art = 
[[
 ╭╮╭┬─╮╭─╮┬  ┬┬╭┬╮
 │││├┤ │ │╰┐┌╯││││
 ╯╰╯╰─╯╰─╯ ╰╯ ┴┴ ┴
]]

local starter = require('mini.starter')

starter.setup({
  content_hooks = {
    starter.gen_hook.adding_bullet("» "),
    starter.gen_hook.aligning('center', 'center'),
  },
    header = header_art,
    footer = "",
})

if vim.g.neovide == true then
    vim.api.nvim_set_keymap("n", "<C-=>", ":lua vim.g.neovide_scale_factor = math.min(vim.g.neovide_scale_factor + 0.1,  2.0)<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-->", ":lua vim.g.neovide_scale_factor = math.max(vim.g.neovide_scale_factor - 0.1,  0.1)<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-+>", ":lua vim.g.neovide_transparency = math.min(vim.g.neovide_transparency + 0.05, 1.0)<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-_>", ":lua vim.g.neovide_transparency = math.max(vim.g.neovide_transparency - 0.05, 0.0)<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-0>", ":lua vim.g.neovide_scale_factor = 0.5<CR>", { silent = true })
    vim.api.nvim_set_keymap("n", "<C-)>", ":lua vim.g.neovide_transparency = 0.9<CR>", { silent = true })
end

-- Comments
require('Comment').setup()
local ft = require('Comment.ft')

 -- Set both line and block commentstring
ft.set('mma', {'(* %s *)'})


-- Gitsigns
require('gitsigns').setup()

-- Screollbar
require('scrollbar').setup()
require("scrollbar.handlers.gitsigns").setup()

-- Colorful winsep
require('colorful-winsep').setup()

-- Zen mode
require("true-zen").setup {
    -- your config goes here
    -- or just leave it empty :)
}

vim.api.nvim_set_keymap("n", "<leader>zn", ":TZNarrow<CR>", {})
vim.api.nvim_set_keymap("v", "<leader>zn", ":'<,'>TZNarrow<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>zf", ":TZFocus<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>zm", ":TZMinimalist<CR>", {})
vim.api.nvim_set_keymap("n", "<leader>za", ":TZAtaraxis<CR>", {})

-- Telescope
require("telescope").setup({
  pickers = {
    git_branches = {
      previewer = false,
    },
  },
})

EOF


