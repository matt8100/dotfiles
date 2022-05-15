# if not running interactively, don't do anything
[ -z "$PS1" ] && return

### Style
if type "oh-my-posh" > /dev/null; then
	eval "$(oh-my-posh init bash --config ~/.poshthemes/slim.omp.json)"
fi
export PS1='\[\e[0m\][\[\e[1;1;4;32m\]\h\[\e[0m\]]\[\e[0m\][\[\e[1;1;4;36m\]\u\[\e[0m\]]\[\e[0m\][ \[\e[1;1;36m\]\w \[\e[0m\]]\n\[\e[0m\]% \[\e[0m\]'

### Alias definitions
if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

### Bash Options
HISTCONTROL=ignoreboth
HISTFILESIZE=2000
HISTSIZE=1000
HISTTIMEFORMAT=""

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s direxpand
shopt -s dirspell
shopt -s globstar
shopt -s histappend
shopt -s histverify
shopt -s lithist

# set color scheme of ls
if type "vivid" > /dev/null; then
	export LS_COLORS="$(vivid generate dracula)"
fi

# colored GCC warnings and errors
export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
