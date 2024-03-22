                    #########################
                    #Oh-My-ZSH Configuration#
                    #########################
# Path to my oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- if set to "random", it will
ZSH_THEME="arrow"

HYPHEN_INSENSITIVE="true"

plugins=(
    zsh-syntax-highlighting
    vi-mode
    fzf
    git
    macos
    poetry
    emacs
)

source $ZSH/oh-my-zsh.sh
export PATH="/usr/local/sbin:$PATH"
# eval "$(starship init zsh)"

                        ##############################
                        ##User general configuration##
                        ##############################
# Editor settings
# export VISUAL="code --wait"
export EDITOR="nvim"

export TERM=xterm-256color

                        ###########
                        #Utilities#
                        ###########
# Compress the size of a  PDF using Ghostscript
compresspdf() {
    gs -sDEVICE=pdfwrite -dNOPAUSE -dQUIET -dBATCH -dPDFSETTINGS=/${3:-"screen"} -dCompatibilityLevel=1.4 -sOutputFile="$2" "$1"
}

# Restarts core audio on MacOS
alias restart_audio="sudo kill -9 `ps ax|grep 'coreaudio[a-z]' | awk '{print $1}'`"

# yabai restart alias
alias restart_yabai="launchctl kickstart -k "gui/${UID}/homebrew.mxcl.yabai""

                        ##########
                        # Config #
                        ##########
# TODO: Move this to a single configure command, somthing like config <config_name>
alias config_skhd="nvim $HOME/.config/skhd/skhdrc"
alias config_yabai="nvim $HOME/.yabairc"
alias config_nvim="nvim $HOME/.config/nvim/init.vim"
alias config_mathematica="nvim $HOME/Library/Mathematica/Kernel/init.m"

                        ################
                        # User scripts #
                        ################
PATH=$PATH:$HOME/Documents/cli-apps/scripts/
export PATH;

# Open a window of a specific application
openwin() { osascript -e "tell application \"$1\" to activate" -e 'tell application "System Events" to keystroke "n" using command down'; }

#[ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env
# [ -f "$HOME/.ghcup/env" ] && source "$HOME/.ghcup/env" # ghcup-env

# goto command and save bookmarks
if [ -d "$HOME/.bookmarks" ]; then
    goto() {
        cd $HOME/.bookmarks
        cd $(fd --type l | fzf)
    }
    ## Add a new bookmark
    save_bookmark() {
        ln -s $(pwd) $HOME/.bookmarks/@$1
    }
fi

                        ###########
                        # Wolfram #
                        ###########
alias mathematica="/Applications/Mathematica.app/Contents/MacOS/WolframKernel -noinit \
    -nopaclet -noicon -nostartuppaclets"
alias wolfram="/Applications/Mathematica.app/Contents/MacOS/WolframKernel -nopaclet -noicon -nostartuppaclets"
alias wri="cd $HOME/WolframProjects"
alias wyatt="cd $HOME/WolframWorkspaces/Base/wyatterp/"
alias openwolfproj="$HOME/Documents/cli-apps/scripts/openwolfproj.sh"
alias ak='ssh-add --apple-load-keychain'

                        #######
                        # Git #
                        #######
# Alias for the bare repo of my dot files
alias gitconfigfiles='/usr/bin/git --git-dir=$HOME/Documents/config-files --work-tree=$HOME'

# Fuzzy checkout of branches by name
gch() {
 git checkout $(git branch --all | fzf)
}

# Add git-recover script
PATH=$PATH:$HOME/Documents/cli-apps/git-recover/
export PATH;

# Internal variable to setup git commands defined on the .gitconfig file
REVIEW_BASE="develop"

                        #############
                        #FZF related#
                        #############
[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh

                        ###########
                        # Aliases #
                        ###########
alias vault="$HOME/Library/Mobile\ Documents/iCloud\~md\~obsidian/Documents/"

alias kitty="/Applications/Kitty.app/Contents/MacOS/kitty"

# Delete with confirmation
alias rm="rm -i"

# Connect to my aws instance
alias connect-to-aws="ssh -i $HOME/Documents/AWS/keys/LightsailDefaultKey-us-east-2.pem bitnami@3.144.15.11"

                        ##########
                        # Python #
                        ##########
# Poetry config
PATH="$HOME/.local/bin:$PATH"
fpath+=$HOME/.zfunc
autoload -Uz compinit && compinit

# pyenv config
# Load pyenv automatically
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

                        ############
                        # API Keys #
                        ############
if [ -f $HOME/.api_keys ]; then
    source $HOME/.api_keys
fi

