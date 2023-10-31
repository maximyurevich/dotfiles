set encoding=utf-8
scriptencoding utf-8
set mouse=a
set number
set relativenumber
set background=dark
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab
set smartindent
set termguicolors
set hlsearch
set incsearch
set undofile
set noswapfile
setlocal tagfunc=lsp#lsp#TagFunc
setlocal formatexpr=lsp#lsp#FormatExpr()


call plug#begin()

Plug 'andlrc/lsp', { 'branch': 'sig-params-label-uint-uint' }

Plug 'mattn/vim-lsp-settings'
Plug 'normen/vim-lsp-settings-adapter'

Plug 'hrsh7th/vim-vsnip'
Plug 'hrsh7th/vim-vsnip-integ'

Plug 'rafamadriz/friendly-snippets'

Plug 'puremourning/vimspector'

Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }

Plug 'vim-test/vim-test'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'junegunn/fzf.vim'
Plug 'yuki-yano/fzf-preview.vim', { 'branch': 'release/rpc' }

Plug 'tpope/vim-fugitive'

Plug 'airblade/vim-gitgutter'

Plug 'justinmk/vim-dirvish'
Plug 'bounceme/remote-viewer'
Plug 'roginfarrer/vim-dirvish-dovish', {'branch': 'main'}

Plug 'sheerun/vim-polyglot'
Plug 'evanleck/vim-svelte', {'branch': 'main'}
Plug 'leafOfTree/vim-vue-plugin'
Plug 'pearofducks/ansible-vim'
Plug 'wuelnerdotexe/vim-astro'

Plug 'thinca/vim-quickrun'

Plug 'metakirby5/codi.vim'

Plug 'https://tpope.io/vim/eunuch.git'
Plug 'https://tpope.io/vim/endwise.git'

Plug 'tpope/vim-obsession'

Plug 'tpope/vim-rails'
Plug 'tpope/vim-rake'
Plug 'tpope/vim-bundler'

Plug 'fatih/vim-go'

Plug 'tpope/vim-sleuth'

Plug 'tpope/vim-dadbod'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'

Plug 'editorconfig/editorconfig-vim'

Plug 'tomtom/tcomment_vim'

Plug 'svermeulen/vim-cutlass'

Plug 'svermeulen/vim-yoink'

Plug 'justinmk/vim-sneak'

Plug 'tmux-plugins/vim-tmux'
Plug 'christoomey/vim-tmux-navigator'

Plug 'mbbill/undotree'

Plug 'sainnhe/gruvbox-material'

call plug#end()

" LSP

if executable('awk-language-server')
    call lsp#lsp#AddServer([{'name': 'awkls',
        \   'filetype': 'awk',
        \   'path': 'awk-language-server',
        \   'args': []
        \ }])
endif

if executable('astro-ls')
    call lsp#lsp#AddServer([{
        \   'name': 'astro-ls',
        \   'filetype': ['astro'],
        \   'path': 'astro-ls',
        \   'args': ['--stdio'],
        \   'initializationOptions': {
        \       'typescript': {
        \           'tsdk': $HOME.'/.npm/lib/node_modules/typescript/lib'
        \       }
        \   },
        \   'syncInit': v:true
        \ }])
endif 

if executable('vue-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'volar',
        \   'filetype': ['vue', 'typescript', 'javascript'],
        \   'path': 'vue-language-server',
        \   'args': ['--stdio'],
        \   'initializationOptions': {
        \       'typescript': {
        \           'tsdk': $HOME.'/.npm/lib/node_modules/typescript/lib'
        \       }
        \   },
        \   'runIfSearch': [
        \       'vite.config.js', 
        \       'vite.config.ts',
        \       'nuxt.config.js',
        \       'nuxt.config.ts'
        \   ]
        \ }])
endif 

if executable('graphql-lsp')
    call lsp#lsp#AddServer([{
        \   'name': 'graphql-lsp',
        \   'filetype': ['graphql', 'typescriptreact', 'javascriptreact'],
        \   'path': 'graphql-lsp',
        \   'args': ['server', '-m', 'stream'],
        \   'runIfSearch': [
        \       'graphql.config.json',
        \       'graphql.config.js',
        \       'graphql.config.cjs',
        \       'graphql.config.ts',
        \       'graphql.config.toml',
        \       'graphql.config.yaml',
        \       'graphql.config.yml',
        \       '.graphqlrc.json',
        \       '.graphqlrc.toml',
        \       '.graphqlrc.yaml',
        \       '.graphqlrc.yml',
        \       '.graphqlrc.js',
        \       '.graphqlrc.ts'
        \ ]
        \ }])
endif

if executable('bufls')
    call lsp#lsp#AddServer([{
        \   'name': 'bufls',
        \   'filetype': 'proto',
        \   'path': 'bufls',
        \   'args': ['serve'],
        \ }])
endif

if executable('clangd')
    call lsp#lsp#AddServer([{
        \   'name': 'clangd',
        \   'filetype': ['c', 'cpp'],
        \   'path': 'clangd',
        \   'args': ['--background-index', '--clang-tidy']
        \ }])
endif

if executable($HOME.'/flutter/bin/dart')
    call lsp#lsp#AddServer([{
        \   'name': 'dart',
        \   'filetype': ['dart'],
        \   'path': $HOME.'/flutter/bin/dart',
        \   'args': ['language-server', '--client-id', 'vim']
        \ }])
endif

if executable('emmet-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'emmet',
        \   'filetype': ['html'],
        \   'path': 'emmet-language-server',
        \   'args': ['--stdio'],
        \ }])
endif

if executable('docker-compose-langserver')
    call lsp#lsp#AddServer([{
        \   'name': 'docker-compose-langserver',
        \   'filetype': ['yaml.docker-compose'],
        \   'path': 'docker-compose-langserver',
        \   'args': ['--stdio'],
        \ }])
endif

if executable('docker-langserver')
    call lsp#lsp#AddServer([{
        \   'name': 'docker-langserver',
        \   'filetype': ['dockerfile'],
        \   'path': 'docker-langserver',
        \   'args': ['--stdio'],
        \ }])
endif

if executable('yaml-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'yaml-language-server',
        \   'filetype': ['yaml'],
        \   'path': 'yaml-language-server',
        \   'args': ['--stdio'],
        \   'workspaceConfig': {
        \       'yaml': {
        \           'schemas': {
        \               'https://json.schemastore.org/github-workflow.json': '/.github/workflows/*'
        \           }
        \       },
        \       'redhat': { 
        \           'enabled': v:false 
        \       } 
        \   }
        \ }])
endif 

if executable('ansible-language-server')

    call lsp#lsp#AddServer([{
        \   'name': 'ansible-language-server',
        \   'filetype': 'yaml.ansible',
        \   'path': 'ansible-language-server',
        \   'args': ['--stdio']
        \ }]) 

    augroup buffer_ansible
        au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
    augroup END

endif

if executable('marksman')
    call lsp#lsp#AddServer([{
        \   'name': 'marksman',
        \   'filetype': ['markdown'],
        \   'path': 'marksman',
        \   'args': ['server'],
        \   'syncInit': v:true
        \ }])
endif

if executable('zk')
    call lsp#lsp#AddServer([{
        \   'name': 'zk',
        \   'filetype': ['markdown'],
        \   'path': 'zk',
        \   'args': ['lsp'],
        \   'runIfSearch': ['.zk/']
        \ }])
endif

if executable('nginx-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'nginx-language-server',
        \   'filetype': ['nginx'],
        \   'path': 'nginx-language-server',
        \   'args': [],
        \ }])
endif

call lsp#lsp#AddServer([{
    \   'name': 'gopls',
    \   'filetype': 'go',
    \   'path': 'gopls',
    \   'args': ['serve'],
    \   'workspaceConfig': {
    \       'gopls': {
    \           'hints': {
    \               'assignVariableTypes': v:true,
    \               'compositeLiteralFields': v:true,
    \               'compositeLiteralTypes': v:true,
    \               'constantValues': v:true,
    \               'functionTypeParameters': v:true,
    \               'parameterNames': v:true,
    \               'rangeVariableTypes': v:true
    \           }
    \       }
    \   }
    \ }])

if executable('lua-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'luals',
        \   'filetype': 'lua',
        \   'path': 'lua-language-server',
        \   'args': ['--stdio'],
        \   'runIfSearch': [
        \       '.luarc.json',
        \       '.luarc.jsonc',
        \        '.luacheckrc',
        \       '.stylua.toml',
        \       'stylua.toml',
        \       'selene.toml',
        \       'selene.yml'
        \ ]
        \ }])
endif

if executable('pyright-langserver')
    call lsp#lsp#AddServer([{
        \   'name': 'pyright',
        \   'filetype': 'python',
        \   'path': 'pyright-langserver',
        \   'args': ['--stdio'],
        \   'workspaceConfig': {
        \       'python': {
        \           'typeCheckingMode': v:true,
        \           'diagnosticMode': 'openFilesOnly'
        \       }
        \   },
        \   'runIfSearch': ['pyproject.toml', 'requirements.txt', 'pyrightconfig.json']
        \ }])
endif

if executable('ruff-lsp')
    call lsp#lsp#AddServer([{
        \   'name': 'ruff-lsp',
        \   'filetype': 'python',
        \   'path': 'ruff-lsp',
        \   'args': [],
        \   'runIfSearch': ['.ruff.toml', 'ruff.toml']
        \ }])
endif

if executable('rust-analyzer')
    call lsp#lsp#AddServer([{
        \   'name': 'rustanalyzer',
        \   'filetype': ['rust'],
        \   'path': 'rust-analyzer',
        \   'args': [],
        \   'syncInit': v:true,
        \   'initializationOptions': {
        \       'inlayHints': {
        \           'typeHints': {
        \               'enable': v:true
        \           },
        \           'parameterHints': {
        \               'enable': v:true
        \           }
        \      },
        \  }
        \ }])
endif

if executable('solargraph')
    call lsp#lsp#AddServer([{
        \   'name': 'solargraph',
        \   'filetype': ['ruby'],
        \   'path': 'solargraph',
        \   'args': ['stdio'],
        \ }])
endif

if executable('bin/tapioca')
    call lsp#lsp#AddServer([{
        \   'name': 'sorbet',
        \   'filetype': ['ruby'],
        \   'path': 'bundle',
        \   'args': ['exec', 'srb', 'tc', '--lsp'],
        \ }])
endif

if executable('standardrb')
    call lsp#lsp#AddServer([{
        \   'name': 'standardrb',
        \   'filetype': ['ruby'],
        \   'path': 'standardrb',
        \   'args': ['standardrb', '--lsp'],
        \ }])
endif

if executable('bunx') && executable('typescript-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'bun-tsserver',
        \   'filetype': [
        \       'javascript', 
        \       'typescript',
        \       'javascriptreact',
        \       'typescriptreact'
        \   ],
        \   'path': 'bunx',
        \   'args': ['--bun', 'typescript-language-server', '--stdio'],
        \   'runIfSearch': ['bun.lockb'],
        \   'runUnlessSearch': [
        \       'vite.config.js', 
        \       'vite.config.ts',
        \       'nuxt.config.js',
        \       'nuxt.config.ts'
        \   ]
        \ }])
endif

if executable('typescript-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'tsserver',
        \   'filetype': [
        \       'javascript', 
        \       'typescript',
        \       'javascriptreact',
        \       'typescriptreact'
        \   ],
        \   'path': 'typescript-language-server',
        \   'args': ['--stdio'],
        \   'runIfSearch': ['yarn.lock', 'package-lock.json'],
        \   'runUnlessSearch': [
        \       'vite.config.js', 
        \       'vite.config.ts',
        \       'nuxt.config.js',
        \       'nuxt.config.ts'
        \   ]
        \ }])
endif

if executable('deno')
    call lsp#lsp#AddServer([{
        \   'name': 'deno',
        \   'filetype': [
        \       'javascript', 
        \       'typescript',
        \       'javascriptreact',
        \       'typescriptreact'
        \   ],
        \   'path': 'deno',
        \   'args': ['lsp'],
        \   'initializationOptions': {
        \       'enable': v:true,
        \       'lint': v:true
        \   },
        \   'runIfSearch': ['deno.json', 'deno.jsonc']
        \ }])
endif 

if executable('cssmodules-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'cssmodules-language-server',
        \   'filetype': [
        \       'javascriptreact',
        \       'typescriptreact'
        \   ],
        \   'path': 'cssmodules-language-server',
        \   'args': [],
        \ }])
endif 

if executable('lemminx')
    call lsp#lsp#AddServer([{
        \   'name': 'lemminx',
        \   'filetype': [
        \       'xml', 'xsd', 'xsl', 'xslt', 'svg'
        \   ],
        \   'path': 'lemminx',
        \   'args': [],
        \ }])
endif

if executable('vim-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'vimls',
        \   'filetype': 'vim',
        \   'path': 'vim-language-server',
        \   'args': ['--stdio']
        \ }])
endif

if executable('sql-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'vimls',
        \   'filetype': ['sql', 'mysql'],
        \   'path': 'sql-language-server',
        \   'args': ['up', '--method', 'stdio']
        \ }])
endif

if executable('vscode-css-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'vscode-css-language-server',
        \   'filetype': ['css', 'sass', 'scss', 'less'],
        \   'path': 'vscode-css-language-server',
        \   'args': ['--stdio'],
        \   'workspaceConfig': {
        \       'css': { 'validate': v:false },
        \       'scss': { 'validate': v:false },
        \       'less': { 'validate': v:false },
        \   }
        \ }])
endif 

if executable('stylelint-lsp')
    call lsp#lsp#AddServer([{
        \   'name': 'stylelint-lsp',
        \   'filetype': [
        \       'css', 
        \       'sass', 
        \       'scss', 
        \       'less', 
        \       'vue', 
        \       'svelte', 
        \       'javascriptreact', 
        \       'typescriptreact'
        \   ],
        \   'path': 'stylelint-lsp',
        \   'args': ['--stdio'],
        \   'workspaceConfig': {
        \       'stylelintplus': { 
        \           'autoFixOnFormat': v:true, 
        \           'autoFixOnSave': v:true 
        \       },
        \   }
        \ }])
endif

if executable($HOME.'/.npm/lib/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server')
    call lsp#lsp#AddServer([{
        \   'name': $HOME.'/.npm/lib/node_modules/@tailwindcss/language-server/bin/tailwindcss-language-server',
        \   'filetype': [
        \       'astro',
        \       'erb',
        \       'eruby',
        \       'gohtml',
        \       'gohtmltmpl',
        \       'liquid',
        \       'mdx',
        \       'css',
        \       'less',
        \       'postcss',
        \       'sass',
        \       'scss',
        \       'html', 
        \       'javascriptreact', 
        \       'typescriptreact', 
        \       'vue', 
        \       'svelte'
        \   ],
        \   'path': 'tailwindcss-language-server',
        \   'args': ['--stdio'],
        \   'runIfSearch': [
        \       'tailwind.config.js', 
        \       'tailwind.config.ts', 
        \       'tailwind.config.cjs', 
        \       'tailwind.config.mjs',
        \       'postcss.config.js', 
        \       'postcss.config.cjs', 
        \       'postcss.config.mjs', 
        \       'postcss.config.ts'
        \   ]
        \ }])
endif

if executable('unocss-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'unocss-language-server',
        \   'filetype': [
        \       'html', 
        \       'javascriptreact', 
        \       'typescriptreact', 
        \       'vue', 
        \       'svelte'
        \   ],
        \   'path': 'unocss-language-server',
        \   'args': ['--stdio'],
        \   'runIfSearch': [
        \       'unocss.config.js', 
        \       'unocss.config.ts', 
        \       'uno.config.js', 
        \       'uno.config.ts'
        \   ]
        \ }])
endif

if executable('vscode-eslint-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'vscode-eslint-language-server',
        \   'filetype': [
        \       'javascript',
        \       'javascriptreact',
        \       'typescript',
        \       'typescriptreact',
        \       'svelte',
        \       'vue'
        \   ],
        \   'path': 'vscode-eslint-language-server',
        \   'args': ['--stdio'],
        \   'workspaceConfig': {
        \   'nodePath': '',
        \   'onIgnoredFiles': 'off',
        \   'packageManager': 'npm',
        \   'rulesCustomizations': [],
        \   'run': 'onSave',
        \   'useESLintClass': v:false,
        \   'validate': 'on',
        \   'codeAction': { 
        \       'disableRuleComment': { 
        \           'enable': v:true, 
        \           'location': 'separateLine'
        \       }, 
        \       'showDocumentation': { 
        \           'enable': v:true 
        \       } 
        \   },
        \   'codeActionOnSave': { 'mode': 'all' },
        \   'experimental': {},
        \   'problems': { 'shortenToSingleLine': v:false },
        \   'workingDirectory': { 'mode': 'auto' }
        \   }
        \ }])
endif

if executable('vscode-html-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'vscode-html-language-server',
        \   'filetype': ['html'],
        \   'path': 'vscode-html-language-server',
        \   'args': ['--stdio'],
        \   'initializationOptions': {
        \       'provideFormatter': v:true,
        \       'embeddedLanguages': { 
        \           'css': v:true, 
        \           'javascript': v:true 
        \       },
        \       'configurationSection': [ 'html', 'css', 'javascript' ]
        \   }
        \ }])
endif

if executable('vscode-json-language-server')
    call lsp#lsp#AddServer([{
        \   'name': 'vscode-json-language-server',
        \   'filetype': ['json', 'jsonc'],
        \   'path': 'vscode-json-language-server',
        \   'args': ['--stdio'],
        \   'initializationOptions': { 'provideFormatter': v:true }
        \ }])
endif

if executable('efm-langserver')
    call lsp#lsp#AddServer([{
        \   'name': 'efm',
        \   'filetype': [
        \       'javascript',
        \       'javascriptreact',
        \       'typescript',
        \       'typescriptreact',
        \       'fish',
        \       'gitcommit',
        \       'lua',
        \       'python',
        \       'vim',
        \       'vue',
        \       'sh',
        \       'svelte',
        \       'markdown',
        \       'rst',
        \       'yaml'
        \   ],
        \   'path': 'efm-langserver',
        \   'args': [],
        \   'initializationOptions': {
        \   	'documentFormatting': v:true
        \   },
        \   'features': {
        \   	'documentFormatting': v:true
        \   }
        \ }])
endif

if executable('svelteserver')
    call lsp#lsp#AddServer([{
        \   'name': 'svelteserver',
        \   'filetype': ['svelte'],
        \   'path': 'svelteserver',
        \   'args': ['--stdio']
        \ }])
endif



augroup lsp_options
    autocmd VimEnter * call LspOptionsSet({
        \   'autoComplete': v:true,
        \   'autoHiglight': v:false,
        \   'autoHigightDiags': v:true,
        \   'autoPopulateDiags': v:false,
        \   'completionMatcher': 'case',
        \   'completionTextEdit': v:true,
        \   'completionKinds': {
        \       'Text':                    '󰉿',
        \       'Method':                  '󰆧',
        \       'Function':                '󰊕',
        \       'Constructor':             '',
        \       'Field':                   '󰜢',
        \       'Variable':                '󰀫',
        \       'Class':                   '󰠱',
        \       'Interface':               '',
        \       'Module':                  '',
        \       'Property':                '󰜢',
        \       'Unit':                    '󰑭',
        \       'Value':                   '󰎠',
        \       'Enum':                    '',
        \       'Keyword':                 '󰌋',
        \       'Snippet':                 '',
        \       'Color':                   '󰏘',
        \       'File':                    '󰈙',
        \       'Reference':               '󰈇',
        \       'Folder':                  '󰉋',
        \       'EnumMember':              '',
        \       'Constant':                '󰏿',
        \       'Struct':                  '󰙅',
        \       'Event':                   '',
        \       'Operator':                '󰆕',
        \       'TypeParameter':           '',
        \       'Buffer':                  ''
        \   },
        \   'customCompletionKinds': v:true,
        \   'diagVirtualTextAlign': 'after',
        \   'echoSignature': v:false,
        \   'hideDisabledCodeActions': v:false,
        \   'higightDiagInline': v:true,
        \   'hoverInPreview': v:false,
        \   'ignoreMissingServer': v:true,
        \   'keepFocusInReferences': v:false,
        \   'noNewlineInCompletion': v:true,
        \   'outlineOnRight': v:true,
        \   'outlineWinSize': 40,
        \   'showDiagInBalloon': v:true,
        \   'showDiagInPopup': v:true,
        \   'showDiagOnStatusLine': v:false,
        \   'showDiagWithSign': v:true,
        \   'showDiagWithVirtualText': v:true,
        \   'showInlayHints': v:false,
        \   'showSignature': v:true,
        \   'snippetSupport': v:true,
        \   'vsnipSupport': v:true,
        \   'usePopupInCodeAction': v:false,
        \   'useQuickfixForLocations': v:false,
        \   'useBufferCompletion': v:true,
        \ })
augroup END

function! s:on_lsp_buffer_attached() abort
    nmap <buffer> ca :LspCodeAction<CR>
    vmap <buffer> ca :LspCodeAction<CR>
    nmap <buffer> gr :LspRename<CR>
    nmap <buffer> gp :LspPeekDefinition<CR>
    nmap <buffer> gd :LspGotoDefinition<CR>
    nmap <buffer> <space>wa :LspWorkspaceAddFolder<CR>
    nmap <buffer> <space>wr :LspWorkspaceRemoveFolder<CR>
    nmap <buffer> <space>wl :LspWorkspaceListFolders<CR>
    nmap <buffer> gi :LspGotoImpl<CR>
    nmap <buffer> gT :LspGotoTypeDefinition<CR>
    nmap <buffer> gt :LspPeekTypeDefinition<CR>
    nmap <buffer> sl :LspDiagCurrent<CR>
    nmap <buffer> sb :LspDiagFirst<CR>
    nmap <buffer> sc :LspDiagHere<CR>
    nmap <buffer> [g :LspDiagPrev<CR>
    nmap <buffer> ]g :LspDiagNext<CR>
    nmap <buffer> [d :LspDiagLast<CR>
    nmap <buffer> ]d :LspDiagFirst<CR>
    nmap <buffer> <space>q :LspDiagShow<CR>
    nmap <buffer> K :LspHover<CR>
    nmap <buffer> <leader>o :LspOutline<CR>
    nmap <buffer> <leader>ci :LspIncomingCalls<CR>
    nmap <buffer> <leader>co :LspOutgoingCalls<CR>

    augroup lsp_format
      autocmd! BufWritePre *.py,*.sh,*.svelte,*.toml,*.vue,*.rb,*.html,*.json,*.yaml,*.lua,*.css,*.js,*.jsx,*.ts,*.tsx,*.rs,*.go,*.dart,*.md,*.c,*.cpp :LspFormat
    augroup END
endfunction

augroup lsp_attach
    au!
    autocmd User LspAttached call s:on_lsp_buffer_attached()
augroup END

 augroup LspCustom
	au!
	au CursorMoved * silent! LspDiag! current
 augroup END

" Completion

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" Airline

let g:airline_powerline_fonts = 1

let g:airline_extensions = [
    \   'dirvish',
    \   'branch',
    \   'fugitiveline',
    \   'fzf',
    \   'hunks',
    \   'keymap',
    \   'po',
    \   'quickfix',
    \   'searchcount',
    \   'wordcount'
    \ ]

" FZF

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-d': 'wall | bdelete'
  \ }

nmap <silent><leader>ff :Files<CR>
nmap <silent><leader>fg :Rg<CR>
nmap <silent><leader>fb :Buffers<CR>
nmap <silent><leader>fh :Helptags<CR>

" Dirvish 

augroup dirvish_config
  autocmd!

  " Map `gr` to reload.
  autocmd FileType dirvish nnoremap <silent><buffer>
    \ gr :<C-U>Dirvish<CR>

  " Map `gh` to hide dot-prefixed files.  Press `R` to "toggle" (reload).
  autocmd FileType dirvish nnoremap <silent><buffer>
    \ gh :silent keeppatterns g@\v/\.[^\/]+/?$@d _<cr>:setl cole=3<cr>
augroup END


" Debug

let g:vimspector_enable_mappings = 'HUMAN'

" Test

let test#strategy = 'kitty'

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

" Cutlass

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

" Yoink

let g:yoinkIncludeDeleteOperations = 1

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

" Also replace the default gp with yoink paste so we can toggle paste in this case too
nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

nmap <c-=> <plug>(YoinkPostPasteToggleFormat)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

" Golang

let g:go_gopls_enabled = 0

" Motion

let g:sneak#label = 1

" Kitty

" Mouse support
set mouse=a
set ttymouse=sgr
set balloonevalterm
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
execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"
" Window title
let &t_ST = "\e[22;2t"
let &t_RT = "\e[23;2t"

" vim hardcodes background color erase even if the terminfo file does
" not contain bce. This causes incorrect background rendering when
" using a color theme with a background color in terminals such as
" kitty that do not support background color erase.
let &t_ut=''

" Colorscheme

colorscheme gruvbox-material
