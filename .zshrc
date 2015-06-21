# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="pgollucci"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Comment this out to disable weekly auto-update checks
DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

ZSH_CUSTOM=$HOME/.zsh

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(
        rbenv pyenv
        golang python postgresql emacs git github
	p6rwscd p6rwsalias
        p6fbsdalias
	p6alias
	ec2
	gh
	)

# PATH
function path_if {
  local dir=$1
  if [ -d $dir ]; then
    PATH="${PATH}:$dir"
  fi
}
PATH=

path_if $HOME/bin
path_if $HOME/fbsd/bin
path_if $HOME/Applications/Aquamacs.app/Contents/MacOS
path_if $HOME/Applications/Aquamacs.app/Contents/MacOS/bin
path_if $HOME/repos/aws/ec2-api-tools/bin
path_if $HOME/repos/fbsd/poudriere/src/bin
path_if /usr/local/opt/go/libexec/bin
path_if /usr/local/packer/bin
path_if /opt/X11/bin
path_if /bin
path_if /sbin
path_if /usr/bin
path_if /usr/sbin
path_if /usr/local/bin
path_if /usr/local/sbin


export PATH

fpath=(~/.zsh/completion $fpath)
source $ZSH/oh-my-zsh.sh

# Customize to your needs...

# added by travis gem
[ -f /Users/pgollucci/.travis/travis.sh ] && source /Users/pgollucci/.travis/travis.sh
