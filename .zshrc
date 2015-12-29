autoload -U compinit        #補完機能
compinit                 #補完を賢く...
alias ls='ls --color=auto'
setopt autopushd            # cdの履歴表示、cd - で一つ前のディレクトリへ
setopt auto_cd              # ディレクトリ名のみでcd
export EDITOR=vim           # エディタはvim


# 履歴
HISTFILE=~/.zsh_history # historyファイル
HISTFILESIZE=1000000
HISTSIZE=1000000 # ファイルサイズ
SAVEHIST=1000000 # saveする量
setopt hist_ignore_dups # 重複を記録しない
setopt hist_reduce_blanks # スペース排除
setopt share_history # 履歴ファイルを共有
setopt EXTENDED_HISTORY # zshの開始終了を記録

# history 操作
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end
