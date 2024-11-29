set -U fish_greeting ""

fish_vi_key_bindings

alias icat "kitty +kitten icat"
set -Ux DOCKER_HOST "unix:///run/user/1000/docker.sock"
set -Ux QT_QPA_PLATFORMTHEME gtk3
set -Ux TDESKTOP_I_KNOW_ABOUT_GTK_INCOMPATIBILITY 1
set -Ux TOKENIZERS_PARALLELISM false
set -Ux LD_LIBRARY_PATH /opt/cuda/lib64
set -Ux VISUAL nvim
set -Ux EDITOR nvim
set -Ux SDL_VIDEODRIVER x11
set -Ux CHROME_EXECUTABLE /usr/bin/brave
set -Ux BROWSER /usr/bin/brave
set -Ux JAVA_HOME /usr/lib/jvm/java-21-openjdk
set -Ux ANDROID_SDK_ROOT /opt/android-sdk
set -Ux BAT_THEME ansi
set -Ux PYDEVD_WARN_SLOW_RESOLVE_TIMEOUT 0
set -Ux PYTHONWARNINGS ignore
set -Ux GOPATH $HOME/go/bin
set -Ux GLFW_IM_MODULE none
set -Ux PAGER "less -R"
set -Ux YAMLFIX_EXPLICIT_START false

fish_add_path $HOME/.local/share/nvim/mason/bin
fish_add_path $GEM_HOME/bin
fish_add_path $JAVA_HOME/bin
fish_add_path $ANDROID_SDK_ROOT/platform-tools/
fish_add_path $ANDROID_SDK_ROOT/tools/bin/
fish_add_path $ANDROID_SDK_ROOT/tools/emulator
fish_add_path $ANDROID_SDK_ROOT/tools/
fish_add_path $HOME/.local/bin
fish_add_path $HOME/.cargo/bin
fish_add_path $HOME/go/bin
fish_add_path $HOME/bin
fish_add_path $HOME/.npm/bin
fish_add_path $HOME/.deno/bin
fish_add_path $HOME/.rbenv/bin
fish_add_path $(go env GOPATH)/bin

rbenv init - | source

# fzf
set -Ux FZF_DEFAULT_OPTS "
--color=fg:#c0caf5,bg:#24283b,hl:#ff9e64
--color=fg+:#c0caf5,bg+:#292e42,hl+:#ff9e64
--color=info:#7aa2f7,prompt:#7dcfff,pointer:#7dcfff
--color=marker:#9ece6a,spinner:#9ece6a,header:#9ece6a"

# fish
set -U __done_min_cmd_duration 5000
set sponge_allow_previously_successful false

# zellij
function zellij_tab_name_update --on-variable PWD
    if set -q ZELLIJ
        set tab_name ''
        if git rev-parse --is-inside-work-tree >/dev/null 2>&1
            set git_root (basename (git rev-parse --show-toplevel))
            set git_prefix (git rev-parse --show-prefix)
            set tab_name "$git_root/$git_prefix"
            set tab_name (string trim -c / "$tab_name")
        else
            set tab_name $PWD
            if test "$tab_name" = "$HOME"
                set tab_name "~"
            else
                set tab_name (basename "$tab_name")
            end
        end
        command nohup zellij action rename-tab $tab_name >/dev/null 2>&1 &
    end
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
