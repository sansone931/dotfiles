# Set LS_COLORS
if [ -f $HOME/.dircolors ]; then
   eval $(dircolors -b $HOME/.dircolors)
else
   eval $(dircolors -b)
fi

# {{{ Options
setopt correct              # Auto correct mistakes
setopt extendedglob         # Extended globbing. Allows using regular expressions with *
setopt nocaseglob           # Case insensitive globbing
setopt rcexpandparam        # Array expension with parameters
setopt nocheckjobs          # Don't warn about running processes when exiting
setopt numericglobsort      # Sort filenames numerically when it makes sense
setopt nobeep               # No beep
setopt appendhistory        # Immediately append history instead of overwriting
setopt histignorealldups    # If a new command is a duplicate, remove the older one
setopt autocd               # if only directory path is entered, cd there.

unsetopt flow_control       # Disable output flow control via start/stop characters (^S/^Q)

# completion
autoload -Uz compinit
compinit

zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}' \
  'r:|[._-]=* r:|=*' 'l:|=* r:|=*'                         # Case insensitive tab completion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"    # Colored completion (different colors for dirs/files/etc)
zstyle ':completion:*' rehash true                         # automatically find new executables in path
# Speed up completions
zstyle ':completion:*' accept-exact '*(N)'
zstyle ':completion:*' use-cache on
zstyle ':completion:*' cache-path ~/.cache/zsh

# bracketed paste url magic
autoload -Uz bracketed-paste-url-magic
zle -N bracketed-paste bracketed-paste-url-magic

# history
HISTFILE=$HOME/.zhistory
HISTSIZE=10000
SAVEHIST=10000
setopt BANG_HIST                 # Treat the '!' character specially during expansion.
setopt EXTENDED_HISTORY          # Write the history file in the ":start:elapsed;command" format.
setopt INC_APPEND_HISTORY        # Write to the history file immediately, not when the shell exits.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire duplicate entries first when trimming history.
setopt HIST_IGNORE_DUPS          # Don't record an entry that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete old recorded entry if new entry is a duplicate.
setopt HIST_FIND_NO_DUPS         # Do not display a line previously found.
setopt HIST_IGNORE_SPACE         # Don't record an entry starting with a space.
setopt HIST_SAVE_NO_DUPS         # Don't write duplicate entries in the history file.
setopt HIST_REDUCE_BLANKS        # Remove superfluous blanks before recording entry.
setopt HIST_VERIFY               # Don't execute immediately upon history expansion.
setopt HIST_BEEP                 # Beep when accessing nonexistent history.

WORDCHARS=${WORDCHARS//\/[&.;]}    # Don't consider certain characters part of the word
# }}}

# {{{ Keybindings
bindkey -e
bindkey '^[[7~' beginning-of-line                    # Home key
bindkey '^[[H' beginning-of-line                     # Home key
if [[ "${terminfo[khome]}" != "" ]]; then
  bindkey "${terminfo[khome]}" beginning-of-line     # [Home] - Go to beginning of line
fi
bindkey '^[[8~' end-of-line                          # End key
bindkey '^[[F' end-of-line                           # End key
if [[ "${terminfo[kend]}" != "" ]]; then
  bindkey "${terminfo[kend]}" end-of-line            # [End] - Go to end of line
fi
bindkey '^[[2~' overwrite-mode                       # Insert key
bindkey '^[[3~' delete-char                          # Delete key
bindkey '^[[C'  forward-char                         # Right key
bindkey '^[[D'  backward-char                        # Left key
bindkey '^[[5~' history-beginning-search-backward    # Page up key
bindkey '^[[6~' history-beginning-search-forward     # Page down key

# Navigate words with ctrl+arrow keys
bindkey '^[Oc' forward-word
bindkey '^[Od' backward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word

# Edit command line in editor with ctrl+x ctrl+e
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^X^E' edit-command-line
# }}}

# {{{ Aliases
alias cp='cp -i'
alias mv='mv -i'
alias rm='rm -i'
alias ls='ls --color=auto -F'
alias ll='ls -lh'
alias la='ll -A'
alias diff='diff --color=auto'
alias grep='grep --color=auto'
alias ip='ip -color=auto'
# }}}

# {{{ Theming
autoload -Uz colors
colors

# enable substitution for prompt
setopt prompt_subst

# Prompt (left side)
PROMPT="%B%{$fg[red]%}[%{$fg[yellow]%}%n%{$fg[green]%}@%{$fg[blue]%}%M\
 %{$fg[magenta]%}%(4~|%-1~/.../%2~|%~)%{$fg[red]%}]%{$reset_color%}%(?..%{$fg[red]%})$%{$reset_color%}%b "

# Prompt (right side)
source $HOME/.config/zsh/git_prompt.zsh
# }}}

# {{{ Plugins
# Use syntax highlighting (https://github.com/zsh-users/zsh-syntax-highlighting)
if [ -f /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi

# Use history substring search (https://github.com/zsh-users/zsh-history-substring-search)
if [ -f /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh ]; then
  source /usr/share/zsh/plugins/zsh-history-substring-search/zsh-history-substring-search.zsh

  # bind UP and DOWN arrow keys to history substring search
  zmodload zsh/terminfo
  bindkey "^P" history-substring-search-up
  bindkey "^N" history-substring-search-down
  bindkey '^[[A' history-substring-search-up
  bindkey '^[[B' history-substring-search-down
fi

# Use autosuggestion (https://github.com/zsh-users/zsh-autosuggestions)
if [ -f /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

  ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20
  ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'
fi
# }}}

# Untracked local configuration
if [ -f $HOME/.config/zsh/local.zsh ]; then
  source $HOME/.config/zsh/local.zsh
fi
