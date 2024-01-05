set -U fish_greeting ""

fish_vi_key_bindings

alias icat "kitty +kitten icat"

set -Ux TOKENIZERS_PARALLELISM false
set -Ux LD_LIBRARY_PATH /opt/cuda/lib64
set -Ux VISUAL vim
set -Ux SDL_VIDEODRIVER x11
set -Ux CHROME_EXECUTABLE /usr/bin/google-chrome-stable
set -Ux JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -Ux ANDROID_SDK_ROOT /opt/android-sdk
set -Ux BAT_THEME gruvbox-dark
set -Ux QT_QPA_PLATFORMTHEME gtk3
set -Ux TDESKTOP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY 1
set -Ux PYDEVD_WARN_SLOW_RESOLVE_TIMEOUT 0
set -Ux PYTHONWARNINGS ignore
set -Ux GOPATH $HOME/go/bin
set -Ux GLFW_IM_MODULE none
set -Ux TMUX_FZF_OPTIONS "-p -w 60% -h 50% -m"
set -Ux PAGER "less -R"
set -Ux YAMLFIX_EXPLICIT_START false
set -Ux BUN_INSTALL_CACHE_DIR $HOME/.bun/install/cache/
set -Ux _JAVA_OPTIONS "-Dswing.defaultlaf=com.sun.java.swing.plaf.gtk.GTKLookAndFeel"

fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $GEM_HOME/bin
fish_add_path $HOME/.flutter/bin
fish_add_path $JAVA_HOME/bin
fish_add_path $ANDROID_SDK_ROOT/platform-tools/
fish_add_path $ANDROID_SDK_ROOT/tools/bin/
fish_add_path $ANDROID_SDK_ROOT/tools/emulator
fish_add_path $ANDROID_SDK_ROOT/tools/
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path ~/.deno/bin/
fish_add_path $HOME/go/bin

set sponge_successful_exit_codes 0 127
set sponge_allow_previously_successful false

status --is-interactive
rbenv init - fish | source

set -l color00 '#282828'
set -l color01 '#3c3836'
set -l color02 '#504945'
set -l color03 '#665c54'
set -l color04 '#bdae93'
set -l color05 '#d5c4a1'
set -l color06 '#ebdbb2'
set -l color07 '#fbf1c7'
set -l color08 '#fb4934'
set -l color09 '#fe8019'
set -l color0A '#fabd2f'
set -l color0B '#b8bb26'
set -l color0C '#8ec07c'
set -l color0D '#83a598'
set -l color0E '#d3869b'
set -l color0F '#d65d0e'

set -l FZF_NON_COLOR_OPTS

for arg in (echo $FZF_DEFAULT_OPTS | tr " " "\n")
    if not string match -q -- "--color*" $arg
        set -a FZF_NON_COLOR_OPTS $arg
    end
end

set -Ux FZF_DEFAULT_OPTS "$FZF_NON_COLOR_OPTS"\
" --color=bg+:$color01,bg:$color00,spinner:$color0C,hl:$color0D"\
" --color=fg:$color04,header:$color0D,info:$color0A,pointer:$color0C"\
" --color=marker:$color0C,fg+:$color06,prompt:$color0A,hl+:$color0D"

function rga-fzf
    set RG_PREFIX 'rga --files-with-matches'
    if test (count $argv) -gt 1
        set RG_PREFIX "$RG_PREFIX $argv[1..-2]"
    end
    set -l file $file
    set file (
        FZF_DEFAULT_COMMAND="$RG_PREFIX '$argv[-1]'" \
        fzf --sort \
            --preview='test ! -z {} && \
                rga --pretty --context 5 {q} {}' \
            --phony -q "$argv[-1]" \
            --bind "change:reload:$RG_PREFIX {q}" \
            --preview-window='50%:wrap'
    ) && echo "opening $file" && open "$file"
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
