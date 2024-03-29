vim9script
set guifont=JetBrainsMono\ NFM\ 13
if has("gui_running")
    set guioptions-=m
    set guioptions-=T
endif
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
set laststatus=2
set showtabline=2
set noshowmode
set hidden
setlocal tagfunc=lsp#lsp#TagFunc
setlocal formatexpr=lsp#lsp#FormatExpr()

packadd lsp

packadd vim-vsnip
packadd vim-vsnip-integ
packadd friendly-snippets

packadd SchemaStore.vim

packadd autosuggest.vim

packadd vim-ostroga

packadd vimspector

packadd vim-doge

packadd vim-test

packadd lightline.vim
packadd mintabline.vim
packadd vim-devicons

packadd vim-system-copy
packadd vim-oscyank

packadd fzf.vim

packadd vim-fugitive

packadd vim-gitgutter

packadd nerdtree
packadd vim-nerdtree-syntax-highlight
packadd nerdtree-visual-selection
packadd nerdtree-git-plugin

packadd nerdfont.vim

packadd vim-polyglot
packadd vim-svelte
packadd vim-vue-plugin
packadd ansible-vim
packadd vim-astro

packadd vim-quickrun

packadd codi.vim

packadd eunuch
packadd endwise

packadd vim-obsession

packadd vim-rails
packadd vim-rake
packadd vim-bundler

packadd vim-go

packadd vim-sleuth

packadd vim-dadbod

packadd vim-surround
packadd vim-repeat
packadd vim-unimpaired

packadd editorconfig-vim

packadd tcomment_vim

packadd vim-cutlass

packadd vim-yoink

packadd vim-sneak

packadd vim-tmux
packadd vim-tmux-navigator

packadd undotree

packadd gruvbox-material

packadd vim-pydocstring

# LSP

if executable('vim-language-server')
    silent! call LspAddServer([{
        name: 'vimls',
        filetype: 'vim',
        path: 'vim-language-server',
        args: ['--stdio'],
        features: { 'diagnostics': v:false }
    }])
endif

if executable('bash-language-server')
    silent! call LspAddServer([{
        name: 'bashls',
        filetype: 'sh',
        path: 'bash-language-server',
        args: ['start'],
    }])
endif

if executable('awk-language-server')
    silent! call LspAddServer([{
        name: 'awkls',
        filetype: 'awk',
        path: 'awk-language-server',
        args: []
    }])
endif

if executable('astro-ls')
    silent! call LspAddServer([{
        name: 'astro-ls',
        filetype: ['astro'],
        path: 'astro-ls',
        args: ['--stdio'],
        initializationOptions: {
            'typescript': {
                'tsdk': $HOME .. '/.npm/lib/node_modules/typescript/lib'
            }
        },
        syncInit: v:true
    }])
endif

if executable('vue-language-server')
    silent! call LspAddServer([{
        name: 'volar',
        filetype: ['vue', 'typescript', 'javascript'],
        path: 'vue-language-server',
        args: ['--stdio'],
        initializationOptions: {
            'typescript': {
                'tsdk': $HOME .. '/.npm/lib/node_modules/typescript/lib'
            }
        },
        runIfSearch: [
            'nuxt.config.js',
            'nuxt.config.ts'
        ]
    }])
endif

if executable('graphql-lsp')
    silent! call LspAddServer([{
        name: 'graphql-lsp',
        filetype: ['graphql', 'typescriptreact', 'javascriptreact'],
        path: 'graphql-lsp',
        args: ['server', '-m', 'stream'],
        runIfSearch: [
            'graphql.config.json',
            'graphql.config.js',
            'graphql.config.cjs',
            'graphql.config.ts',
            'graphql.config.toml',
            'graphql.config.yaml',
            'graphql.config.yml',
            '.graphqlrc.json',
            '.graphqlrc.toml',
            '.graphqlrc.yaml',
            '.graphqlrc.yml',
            '.graphqlrc.js',
            '.graphqlrc.ts'
        ]
    }])
endif

if executable('bufls')
    silent! call LspAddServer([{
        name: 'bufls',
        filetype: 'proto',
        path: 'bufls',
        args: ['serve'],
    }])
endif

if executable('clangd')
    silent! call LspAddServer([{
        name: 'clangd',
        filetype: ['c', 'cpp'],
        path: 'clangd',
        args: ['--background-index', '--clang-tidy'],
        runUnlessSearch: ['config.def.h']
    }])
    silent! call LspAddServer([{
        name: 'clangd',
        filetype: ['cpp'],
        path: 'clangd',
        args: ['--background-index'],
        features: {'diagnostics': v:false},
        runIfSearch: ['config.def.h']
    }])
endif

if executable('dart')
    silent! call LspAddServer([{
        name: 'dart',
        filetype: ['dart'],
        path: 'dart',
        args: ['language-server', '--client-id', 'vim']
    }])
endif

if executable('emmet-language-server')
    silent! call LspAddServer([{
        name: 'emmet',
        filetype: ['html'],
        path: 'emmet-language-server',
        args: ['--stdio'],
    }])
endif

if executable('docker-compose-langserver')
    silent! call LspAddServer([{
        name: 'docker-compose-langserver',
        filetype: ['yaml.docker-compose'],
        path: 'docker-compose-langserver',
        args: ['--stdio'],
    }])
endif

if executable('docker-langserver')
    silent! call LspAddServer([{
        name: 'docker-langserver',
        filetype: ['dockerfile'],
        path: 'docker-langserver',
        args: ['--stdio'],
    }])
endif

if executable('yaml-language-server')
    silent! call LspAddServer([{
        name: 'yaml-language-server',
        filetype: ['yaml'],
        path: 'yaml-language-server',
        args: ['--stdio'],
        workspaceConfig: {
            'yaml': {
                'schemas': {
                    'https://json.schemastore.org/github-workflow.json': '/.github/workflows/*'
                }
            },
            'redhat': {
                'enabled': v:false
            }
        }
    }])
endif


if executable('ansible-language-server')

    silent! call LspAddServer([{
        name: 'ansible-language-server',
        filetype: 'yaml.ansible',
        path: 'ansible-language-server',
        args: ['--stdio']
    }])

    augroup buffer_ansible
        au BufRead,BufNewFile */playbooks/*.yml set filetype=yaml.ansible
    augroup END

endif

if executable('marksman')
    silent! call LspAddServer([{
        name: 'marksman',
        filetype: ['markdown'],
        path: 'marksman',
        args: ['server'],
        syncInit: v:true
    }])
endif

if executable('zk')
    silent! call LspAddServer([{
        name: 'zk',
        filetype: ['markdown'],
        path: 'zk',
        args: ['lsp'],
        runIfSearch: ['.zk/']
    }])
endif

if executable('nginx-language-server')
    silent! call LspAddServer([{
        name: 'nginx-language-server',
        filetype: ['nginx'],
        path: 'nginx-language-server',
        args: [],
    }])
endif

if executable('gopls')
    silent! call LspAddServer([{
        name: 'gopls',
        filetype: 'go',
        path: 'gopls',
        args: ['serve'],
        workspaceConfig: {
            'gopls': {
                'hints': {
                    'assignVariableTypes': v:true,
                    'compositeLiteralFields': v:true,
                    'compositeLiteralTypes': v:true,
                    'constantValues': v:true,
                    'functionTypeParameters': v:true,
                    'parameterNames': v:true,
                    'rangeVariableTypes': v:true
                }
            }
        }
    }])
endif

if executable('lua-language-server')
    silent! call LspAddServer([{
        name: 'luals',
        filetype: 'lua',
        path: 'lua-language-server',
        args: ['--stdio'],
        runIfSearch: [
            '.luarc.json',
            '.luarc.jsonc',
            '.luacheckrc',
            '.stylua.toml',
            'stylua.toml',
            'selene.toml',
            'selene.yml'
        ]
    }])
endif

if executable('ruff-lsp')
    silent! call LspAddServer([{
        name: 'ruff-lsp',
        filetype: 'python',
        path: 'ruff-lsp',
        args: [],
        runIfSearch: ['.ruff.toml', 'ruff.toml']
    }])
endif

if executable('pyright-langserver')
    silent! call LspAddServer([{
        name: 'pyright',
        filetype: 'python',
        path: 'pyright-langserver',
        args: ['--stdio'],
        workspaceConfig: {
            'pyright': {
               'disableOrganizeImports': v:true,
            },
            'python': {
                'ignore': ['*'],
            }
        },
        features: { 'documentFormatting': v:false, 'diagnostics': v:false },
        runIfSearch: ['pyproject.toml', 'requirements.txt', 'pyrightconfig.json'],
        syncInit: v:true
    }])
endif

if executable('rust-analyzer')
    silent! call LspAddServer([{
        name: 'rustanalyzer',
        filetype: ['rust'],
        path: 'rust-analyzer',
        args: [],
        syncInit: v:true,
        initializationOptions: {
            'inlayHints': {
               'typeHints': {
                   'enable': v:true
               },
               'parameterHints': {
                   'enable': v:true
               }
            },
        },
    }])
endif

if executable('solargraph')
    silent! call LspAddServer([{
        name: 'solargraph',
        filetype: ['ruby'],
        path: 'solargraph',
        args: ['stdio'],
        workspaceConfig: {
            solargraph: {
                'diagnostics': v:true,
            },
        },
        initializationOptions: {
            'formatting': v:true,
        },
        syncInit: v:true,
    }])
endif

if executable('bin/tapioca')
    silent! call LspAddServer([{
        name: 'sorbet',
        filetype: ['ruby'],
        path: 'bundle',
        args: ['exec', 'srb', 'tc', '--lsp', '--disable-watchman'],
    }])
endif

if executable('bunx') && executable('typescript-language-server')
    silent! call LspAddServer([{
        name: 'bun-typescript-language-server',
        filetype: [
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact'
        ],
        path: 'bunx',
        args: ['--bun', 'typescript-language-server', '--stdio'],
        runIfSearch: ['bun.lockb'],
    }])
endif

if executable('typescript-language-server')
    silent! call LspAddServer([{
        name: 'tsserver',
        filetype: [
            'javascript',
            'typescript',
            'javascriptreact',
            'typescriptreact'
        ],
        path: 'typescript-language-server',
        args: ['--stdio'],
        runIfSearch: ['yarn.lock', 'package-lock.json'],
        }])
endif

if executable('cssmodules-language-server')
    silent! call LspAddServer([{
        name: 'cssmodules-language-server',
        filetype: [
            'javascriptreact',
            'typescriptreact'
        ],
        path: 'cssmodules-language-server',
        args: [],
    }])
endif

if executable('lemminx')
    silent! call LspAddServer([{
        name: 'lemminx',
        filetype: [
            'xml', 'xsd', 'xsl', 'xslt', 'svg'
        ],
        path: 'lemminx',
        args: [],
    }])
endif

if executable('sql-language-server')
    silent! call LspAddServer([{
        name: 'sql-language-server',
        filetype: ['sql', 'mysql'],
        path: 'sql-language-server',
        args: ['up', '--method', 'stdio']
    }])
endif

if executable('vscode-css-language-server')
    silent! call LspAddServer([{
        name: 'vscode-css-language-server',
        filetype: ['css', 'sass', 'scss', 'less'],
        path: 'vscode-css-language-server',
        args: ['--stdio'],
        workspaceConfig: {
            css: { 'validate': v:false },
            scss: { 'validate': v:false },
            less: { 'validate': v:false },
        }
    }])
endif

if executable($HOME .. '/.npm/bin/tailwindcss-language-server')
    silent! call LspAddServer([{
        name: $HOME .. '/.npm/bin/tailwindcss-language-server',
        filetype: [
            'astro',
            'gohtml',
            'gohtmltmpl',
            'liquid',
            'mdx',
            'css',
            'less',
            'postcss',
            'sass',
            'scss',
            'html',
            'javascriptreact',
            'typescriptreact',
            'vue',
            'svelte'
        ],
        path: 'tailwindcss-language-server',
        args: ['--stdio'],
        runIfSearch: [
            'tailwind.config.js',
            'tailwind.config.ts',
            'tailwind.config.cjs',
            'tailwind.config.mjs',
            'postcss.config.js',
            'postcss.config.cjs',
            'postcss.config.mjs',
            'postcss.config.ts'
        ]
    }])
endif

if executable('stylelint-lsp')
    silent! call LspAddServer([{
        name: 'stylelint-lsp',
        filetype: [
            'css',
            'sass',
            'scss',
            'less',
            'vue',
            'svelte',
            'javascriptreact',
            'typescriptreact'
        ],
        path: 'stylelint-lsp',
        args: ['--stdio'],
        workspaceConfig: {
            'stylelintplus': {
                'autoFixOnFormat': v:true,
                'autoFixOnSave': v:true
            },
        }
    }])
endif

if executable('vscode-eslint-language-server')
    silent! call LspAddServer([{
        name: 'vscode-eslint-language-server',
        runIfSearch: [
            '.eslintrc',
            '.eslintrc.js',
            '.eslintrc.cjs',
            '.eslintrc.yaml',
            '.eslintrc.yml',
            '.eslintrc.json',
        ],
        filetype: [
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'svelte',
            'vue'
        ],
        path: 'vscode-eslint-language-server',
        args: ['--stdio'],
        workspaceConfig: {
            nodePath: '',
            onIgnoredFiles: 'off',
            packageManager: 'npm',
            rulesCustomizations: [],
            run: 'onSave',
            useESLintClass: v:false,
            validate: 'on',
            codeAction: {
               'disableRuleComment': {
                   'enable': v:true,
                   'location': 'separateLine'
               },
               'showDocumentation': {
                   'enable': v:true
               }
            },
            codeActionOnSave: { 'mode': 'all' },
            experimental: {},
            problems: { 'shortenToSingleLine': v:false },
            workingDirectory: { 'mode': 'auto' }
        }
    }])
endif

if executable('vscode-html-language-server')
    silent! call LspAddServer([{
        name: 'vscode-html-language-server',
        filetype: ['html'],
        path: 'vscode-html-language-server',
        args: ['--stdio'],
        initializationOptions: {
            'provideFormatter': v:true,
            'embeddedLanguages': {
                'css': v:true,
                'javascript': v:true
            },
            'configurationSection': [ 'html', 'css', 'javascript' ]
        }
    }])
endif

if executable('unocss-language-server')
    silent! call LspAddServer([{
        name: 'unocss-language-server',
        filetype: [
            'html',
            'javascriptreact',
            'typescriptreact',
            'vue',
            'svelte'
        ],
        path: 'unocss-language-server',
        args: ['--stdio'],
        runIfSearch: [
            'unocss.config.js',
            'unocss.config.ts',
            'uno.config.js',
            'uno.config.ts'
        ]
    }])
endif

import "SchemaStore.vim"
const schemata = SchemaStore.schemata
const schemas  = SchemaStore.schemas

if executable('vscode-json-language-server')
    silent! call LspAddServer([{
        name: 'vscode-json-language-server',
        filetype: ['json', 'jsonc'],
        path: 'vscode-json-language-server',
        args: ['--stdio'],
        initializationOptions: { 'provideFormatter': v:true },
        workspaceConfig: {
            json: {
                format: { enable: true },
                validate: { enable: true },
                schemas: g:SchemaStore#Schemata(),
            }
        },
    }])
endif

if executable('efm-langserver')
    silent! call LspAddServer([{
        name: 'efm',
        filetype: [
            'javascript',
            'javascriptreact',
            'typescript',
            'typescriptreact',
            'fish',
            'gitcommit',
            'lua',
            'python',
            'vue',
            'sh',
            'svelte',
            'markdown',
            'rst',
            'yaml'
        ],
        path: 'efm-langserver',
        args: [],
        initializationOptions: {
            'documentFormatting': v:true
        },
        features: {
            'documentFormatting': v:true
        },
        syncInit: v:true
    }])
endif

if executable('svelteserver')
    silent! call LspAddServer([{
        name: 'svelteserver',
        filetype: ['svelte'],
        path: 'svelteserver',
        args: ['--stdio'],
        syncInit: v:true
    }])
endif

if executable('jdtls')
    silent! call LspAddServer([{
        name: 'jdtls',
        filetype: 'java',
        path: 'jdtls',
        args: [],
        initializationOptions: {
            'settings': {
                'java': {
                    'completion': {
                        'filteredTypes': [
                            'com.sun.*', 
                            'java.awt.*', 
                            'jdk.*', 
                            'org.graalvm.*', 
                            'sun.*', 
                            'javax.awt.*', 
                            'javax.swing.*'
                        ]
                    }
                } 
            }
        }
    }])
endif


augroup lsp_options
    silent! call LspOptionsSet({
        \   'autoComplete': v:true,
        \   'autoHiglight': v:false,
        \   'autoHigightDiags': v:true,
        \   'autoPopulateDiags': v:false,
        \   'completionMatcher': 'case',
        \   'completionTextEdit': v:false,
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


def OnLspBufferAttached()
    nmap <buffer> <leader>ca :LspCodeAction<CR>
    vmap <buffer> <leader>ca :LspCodeAction<CR>
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
    nmap <buffer> [dl :LspDiagLast<CR>
    nmap <buffer> ]df :LspDiagFirst<CR>
    nmap <buffer> <space>q :LspDiagShow<CR>
    nmap <buffer> K :LspHover<CR>
    nmap <buffer> <leader>o :LspOutline<CR>
    nmap <buffer> <leader>ci :LspIncomingCalls<CR>
    nmap <buffer> <leader>co :LspOutgoingCalls<CR>

    augroup lsp_format
      autocmd! BufWritePre *.py,*.sh,*.svelte,*.toml,*.vue,*.rb,*.html,*.json,*.yaml,*.lua,*.css,*.js,*.jsx,*.ts,*.tsx,*.rs,*.go,*.dart,*.md,*.h,*.c,*.cpp :LspFormat
    augroup END
enddef

augroup lsp_attach
    au!
    au User LspAttached call s:OnLspBufferAttached()
augroup END

augroup lsp_show_under_curso
    au!
    au CursorMoved * silent! LspDiag! current
augroup END

# Completion

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

# Lightline

g:lightline = {
      enable: {
          'statusline': 1,
          'tabline': 0
      },
      active: {
          'left': [ [ 'mode', 'paste' ],
                    [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      },
      component_function: {
          'gitbranch': 'FugitiveHead'
      },
      separator: { 'left': "\ue0b0", 'right': "\ue0b2" },
      subseparator: { 'left': "\ue0b1", 'right': "\ue0b3" },
}

if !has('gui_running')
  set t_Co=256
endif

# Tabline

nnoremap <silent><leader>1 <Cmd>tabfirst<CR>
nnoremap <silent><leader>2 <Cmd>tabn 2<CR>
nnoremap <silent><leader>3 <Cmd>tabn 3<CR>
nnoremap <silent><leader>4 <Cmd>tabn 4<CR>
nnoremap <silent><leader>5 <Cmd>tabn 5<CR>
nnoremap <silent><leader>6 <Cmd>tabn 6<CR>
nnoremap <silent><leader>7 <Cmd>tabn 7<CR>
nnoremap <silent><leader>8 <Cmd>tabn 8<CR>
nnoremap <silent><leader>9 <Cmd>tabn 9<CR>
nnoremap <silent><leader>$ <Cmd>tablast<CR>

nnoremap <silent>[b :tabnext<CR>
nnoremap <silent>b] :tabprevious<CR>

nnoremap <silent>td1 <Cmd>tabc 1<CR>
nnoremap <silent>td2 <Cmd>tabc 2<CR>
nnoremap <silent>td3 <Cmd>tabc 3<CR>
nnoremap <silent>td4 <Cmd>tabc 4<CR>
nnoremap <silent>td5 <Cmd>tabc 5<CR>
nnoremap <silent>td6 <Cmd>tabc 6<CR>
nnoremap <silent>td7 <Cmd>tabc 7<CR>
nnoremap <silent>td8 <Cmd>tabc 8<CR>
nnoremap <silent>td9 <Cmd>tabc 9<CR>
nnoremap <silent>td$ <Cmd>tabc $<CR>

nnoremap <silent>td :tabc<CR>
nnoremap <silent>to :tabo<CR>

# FZF

g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }

g:fzf_action = {
    'ctrl-t': 'tab split',
    'ctrl-x': 'split',
    'ctrl-v': 'vsplit',
    'ctrl-d': 'wall | bdelete'
}

nmap <silent><leader>ff :Files<CR>
nmap <silent><leader>fg :Rg<CR>
nmap <silent><leader>fb :Buffers<CR>
nmap <silent><leader>fh :Helptags<CR>

# NERDTree

if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

# Debug

g:vimspector_enable_mappings = 'HUMAN'

# Test

g:test#strategy = 'kitty'

nmap <silent> <leader>t :TestNearest<CR>
nmap <silent> <leader>T :TestFile<CR>
nmap <silent> <leader>a :TestSuite<CR>
nmap <silent> <leader>l :TestLast<CR>
nmap <silent> <leader>g :TestVisit<CR>

# Cutlass

nnoremap m d
xnoremap m d

nnoremap mm dd
nnoremap M D

# Yoink

g:yoinkIncludeDeleteOperations = 1

nmap <c-n> <plug>(YoinkPostPasteSwapBack)
nmap <c-p> <plug>(YoinkPostPasteSwapForward)

nmap p <plug>(YoinkPaste_p)
nmap P <plug>(YoinkPaste_P)

# Also replace the default gp with yoink paste so we can toggle paste in this case too

nmap gp <plug>(YoinkPaste_gp)
nmap gP <plug>(YoinkPaste_gP)

nmap [y <plug>(YoinkRotateBack)
nmap ]y <plug>(YoinkRotateForward)

nmap <c-=> <plug>(YoinkPostPasteToggleFormat)

nmap y <plug>(YoinkYankPreserveCursorPosition)
xmap y <plug>(YoinkYankPreserveCursorPosition)

# Oscyank

nmap <leader>c <Plug>OSCYankOperator
nmap <leader>cc <leader>c_
vmap <leader>c <Plug>OSCYankVisual

# Golang

g:go_gopls_enabled = 0

# Motion

g:sneak#label = 1

# Pydocstring

g:pydocstring_doq_path = $HOME .. '/.local/bin/doq'

g:pydocstring_enable_mapping = 0

nmap <silent> <leader>nn <Plug>(pydocstring)

# Tabline

nmap <silent> <Space>l :tabprevious<CR>
nmap <silent> <Space>r :tabnext<CR>
nmap <silent> <Space>d :tabclose<CR>

# Ostroga

nnoremap <leader>fe <cmd>OstrogaJump<cr>

# Kitty

# Mouse support

set mouse=a
set ttymouse=sgr
set balloonevalterm

# Styled and colored underline support

&t_AU = "\e[58:5:%dm"
&t_8u = "\e[58:2:%lu:%lu:%lum"
&t_Us = "\e[4:2m"
&t_Cs = "\e[4:3m"
&t_ds = "\e[4:4m"
&t_Ds = "\e[4:5m"
&t_Ce = "\e[4:0m"

# Strikethrough

&t_Ts = "\e[9m"
&t_Te = "\e[29m"

# Truecolor support

&t_8f = "\e[38:2:%lu:%lu:%lum"
&t_8b = "\e[48:2:%lu:%lu:%lum"
&t_RF = "\e]10;?\e\\"
&t_RB = "\e]11;?\e\\"

# Bracketed paste

&t_BE = "\e[?2004h"
&t_BD = "\e[?2004l"
&t_PS = "\e[200~"
&t_PE = "\e[201~"

# Cursor control

&t_RC = "\e[?12$p"
&t_SH = "\e[%d q"
&t_RS = "\eP$q q\e\\"
&t_SI = "\e[5 q"
&t_SR = "\e[3 q"
&t_EI = "\e[1 q"
&t_VS = "\e[?12l"

# Focus tracking

&t_fe = "\e[?1004h"
&t_fd = "\e[?1004l"

execute "set <FocusGained>=\<Esc>[I"
execute "set <FocusLost>=\<Esc>[O"

# Window title

&t_ST = "\e[22;2t"
&t_RT = "\e[23;2t"

# vim hardcodes background color erase even if the terminfo file does
# not contain bce. This causes incorrect background rendering when
# using a color theme with a background color in terminals such as
# kitty that do not support background color erase.

&t_ut = ''

# Colorscheme

silent! colorscheme gruvbox-material
