#    _               _              
#   | |__   __ _ ___| |__  _ __ ___ 
#   | '_ \ / _` / __| '_ \| '__/ __|
#  _| |_) | (_| \__ \ | | | | | (__ 
# (_)_.__/ \__,_|___/_| |_|_|  \___|
# 
# -----------------------------------------------------
# ML4W bashrc loader
# -----------------------------------------------------

# DON'T CHANGE THIS FILE

# You can define your custom configuration by adding
# files in ~/.config/bashrc 
# or by creating a folder ~/.config/bashrc/custom
# with copies of files from ~/.config/bashrc 
# You can also create a .bashrc_custom file in your home directory
# -----------------------------------------------------

# -----------------------------------------------------
# Load modular configarion
# -----------------------------------------------------

for f in ~/.config/bashrc/*; do 
    if [ ! -d $f ]; then
        c=`echo $f | sed -e "s=.config/bashrc=.config/bashrc/custom="`
        [[ -f $c ]] && source $c || source $f
    fi
done

# -----------------------------------------------------
# Load single customization file (if exists)
# -----------------------------------------------------

if [ -f ~/.bashrc_custom ]; then
    source ~/.bashrc_custom
fi

#   Mở nhanh VScode
alias code-oss='/usr/bin/code-oss'
alias vscode='/opt/vscode/bin/code'

# Cấu hình cho IBus
export XMODIFIERS=@im=ibus
export GTK_IM_MODULE=ibus
export QT_IM_MODULE=ibus
ibus-daemon -d

# Alias cho các ngôn ngữ
alias ibus-vi="ibus engine Unikey"
alias ibus-en="ibus engine xkb:us::eng"

# Khởi động IBus tự động
if ! pgrep -x "ibus-daemon" > /dev/null; then
    ibus-daemon -d
fi

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

#   Cargo cho Rust
. "$HOME/.cargo/env"

#   Solidity
export PATH=$PATH:~/solidity/build/solc

#   fzf suggestions
__fzf_history_suggest() {
  BUFFER=$(history | fzf --height 40% --reverse --prompt="History> " | sed 's/ *[0-9]* *//')
  READLINE_LINE=$BUFFER
  READLINE_POINT=${#BUFFER}
}
bind -x '"\C-r": __fzf_history_suggest'

#   bash-completions
[[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \

    . /usr/share/bash-completion/bash_completion
    
#   StartShip
#   Load starship prompt
#   eval "$(starship init bash)

# Clean memory
alias cleanram='sync && sudo sysctl -w vm.drop_caches=3'

# llt: hiển thị dạng cây (tree) có icon
alias llt='eza --tree --icons --level=2'
# lls: hiển thị danh sách dọc (long list) có icon
alias lls='eza -l --icons'
# lss: hiển thị dạng ngang có icon
alias lss='eza -x --icons'

#   Homebrew
eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# 🔥 crml = clean RAM, memory, logs
alias crml='~/clean-linux.sh'

# Golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin




# # Enable the subsequent settings only in interactive sessions
# case $- in
#   *i*) ;;
#     *) return;;
# esac

# # Path to your oh-my-bash installation.
# export OSH='/home/theanhdev/.oh-my-bash'

# # Set name of the theme to load. Optionally, if you set this to "random"
# # it'll load a random theme each time that oh-my-bash is loaded.
# OSH_THEME="nekonight"

# # If you set OSH_THEME to "random", you can ignore themes you don't like.
# # OMB_THEME_RANDOM_IGNORED=("powerbash10k" "wanelo")

# # Uncomment the following line to use case-sensitive completion.
# # OMB_CASE_SENSITIVE="true"

# # Uncomment the following line to use hyphen-insensitive completion. Case
# # sensitive completion must be off. _ and - will be interchangeable.
# # OMB_HYPHEN_SENSITIVE="false"

# # Uncomment the following line to disable bi-weekly auto-update checks.
# # DISABLE_AUTO_UPDATE="true"

# # Uncomment the following line to change how often to auto-update (in days).
# # export UPDATE_OSH_DAYS=13

# # Uncomment the following line to disable colors in ls.
# # DISABLE_LS_COLORS="true"

# # Uncomment the following line to disable auto-setting terminal title.
# # DISABLE_AUTO_TITLE="true"

# # Uncomment the following line to enable command auto-correction.
# # ENABLE_CORRECTION="true"

# # Uncomment the following line to display red dots whilst waiting for completion.
# # COMPLETION_WAITING_DOTS="true"

# # Uncomment the following line if you want to disable marking untracked files
# # under VCS as dirty. This makes repository status check for large repositories
# # much, much faster.
# # DISABLE_UNTRACKED_FILES_DIRTY="true"

# # Uncomment the following line if you don't want the repository to be considered dirty
# # if there are untracked files.
# # SCM_GIT_DISABLE_UNTRACKED_DIRTY="true"

# # Uncomment the following line if you want to completely ignore the presence
# # of untracked files in the repository.
# # SCM_GIT_IGNORE_UNTRACKED="true"

# # Uncomment the following line if you want to change the command execution time
# # stamp shown in the history command output.  One of the following values can
# # be used to specify the timestamp format.
# # * 'mm/dd/yyyy'     # mm/dd/yyyy + time
# # * 'dd.mm.yyyy'     # dd.mm.yyyy + time
# # * 'yyyy-mm-dd'     # yyyy-mm-dd + time
# # * '[mm/dd/yyyy]'   # [mm/dd/yyyy] + [time] with colors
# # * '[dd.mm.yyyy]'   # [dd.mm.yyyy] + [time] with colors
# # * '[yyyy-mm-dd]'   # [yyyy-mm-dd] + [time] with colors
# # If not set, the default value is 'yyyy-mm-dd'.
# # HIST_STAMPS='yyyy-mm-dd'

# # Uncomment the following line if you do not want OMB to overwrite the existing
# # aliases by the default OMB aliases defined in lib/*.sh
# # OMB_DEFAULT_ALIASES="check"

# # Would you like to use another custom folder than $OSH/custom?
# # OSH_CUSTOM=/path/to/new-custom-folder

# # To disable the uses of "sudo" by oh-my-bash, please set "false" to
# # this variable.  The default behavior for the empty value is "true".
# OMB_USE_SUDO=true

# # To enable/disable display of Python virtualenv and condaenv
# # OMB_PROMPT_SHOW_PYTHON_VENV=true  # enable
# # OMB_PROMPT_SHOW_PYTHON_VENV=false # disable

# # To enable/disable Spack environment information
# # OMB_PROMPT_SHOW_SPACK_ENV=true  # enable
# # OMB_PROMPT_SHOW_SPACK_ENV=false # disable

# # Which completions would you like to load? (completions can be found in ~/.oh-my-bash/completions/*)
# # Custom completions may be added to ~/.oh-my-bash/custom/completions/
# # Example format: completions=(ssh git bundler gem pip pip3)
# # Add wisely, as too many completions slow down shell startup.
# completions=(
#   git
#   composer
#   ssh
# )

# # Which aliases would you like to load? (aliases can be found in ~/.oh-my-bash/aliases/*)
# # Custom aliases may be added to ~/.oh-my-bash/custom/aliases/
# # Example format: aliases=(vagrant composer git-avh)
# # Add wisely, as too many aliases slow down shell startup.
# aliases=(
#   general
# )

# # Which plugins would you like to load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# # Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# # Example format: plugins=(rails git textmate ruby lighthouse)
# # Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git
#   bashmarks
# )

# # Which plugins would you like to conditionally load? (plugins can be found in ~/.oh-my-bash/plugins/*)
# # Custom plugins may be added to ~/.oh-my-bash/custom/plugins/
# # Example format:
# #  if [ "$DISPLAY" ] || [ "$SSH" ]; then
# #      plugins+=(tmux-autoattach)
# #  fi

# source "$OSH"/oh-my-bash.sh

# # User configuration
# # export MANPATH="/usr/local/man:$MANPATH"

# # You may need to manually set your language environment
# # export LANG=en_US.UTF-8

# # Preferred editor for local and remote sessions
# # if [[ -n $SSH_CONNECTION ]]; then
# #   export EDITOR='vim'
# # else
# #   export EDITOR='mvim'
# # fi

# # Compilation flags
# # export ARCHFLAGS="-arch x86_64"

# # ssh
# # export SSH_KEY_PATH="~/.ssh/rsa_id"

# # Set personal aliases, overriding those provided by oh-my-bash libs,
# # plugins, and themes. Aliases can be placed here, though oh-my-bash
# # users are encouraged to define aliases within the OSH_CUSTOM folder.
# # For a full list of active aliases, run `alias`.
# #
# # Example aliases
# # alias bashconfig="mate ~/.bashrc"
# # alias ohmybash="mate ~/.oh-my-bash"
# #   Mở nhanh VScode
# alias code-oss='/usr/bin/code-oss'
# #code-oss %F
# alias vscode='/opt/vscode/bin/code'

# # Cấu hình cho IBus
# export XMODIFIERS=@im=ibus
# export GTK_IM_MODULE=ibus
# export QT_IM_MODULE=ibus
# ibus-daemon -d

# # Alias cho các ngôn ngữ
# alias ibus-vi="ibus engine Unikey"
# alias ibus-en="ibus engine xkb:us::eng"

# # # Khởi động IBus tự động
# if ! pgrep -x "ibus-daemon" > /dev/null; then
#     ibus-daemon -d
# fi

# # bun
# export BUN_INSTALL="$HOME/.bun"
# export PATH="$BUN_INSTALL/bin:$PATH"

# #   Cargo cho Rust
# . "$HOME/.cargo/env"

# #   Solidity
# export PATH=$PATH:~/solidity/build/solc
# #   fzf suggestions
# __fzf_history_suggest() {
#   BUFFER=$(history | fzf --height 40% --reverse --prompt="History> " | sed 's/ *[0-9]* *//')
#   READLINE_LINE=$BUFFER
#   READLINE_POINT=${#BUFFER}
# }
# bind -x '"\C-r": __fzf_history_suggest'
# #   bash-completions
# [[ $PS1 && -f /usr/share/bash-completion/bash_completion ]] && \
#     . /usr/share/bash-completion/bash_completion

# #   StartShip
# # Load starship prompt
# # eval "$(starship init bash)
