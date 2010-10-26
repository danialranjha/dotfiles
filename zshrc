echo "+++Reading .zshrc."
[[ -o interactive ]] && echo "+++  (for interactive use)."

autoload -U compinit zrecompile

zsh_cache=${HOME}/.zsh-cache
mkdir -p $zsh_cache

if [ $UID -eq 0 ]; then
  compinit
else
  compinit -d $zsh_cache/zcomp-$HOST

  for f in ~/.zshrc $zsh_cache/zcomp-$HOST; do
    zrecompile -p $f && rm -f $f.zwc.old
  done
fi

setopt EXTENDED_GLOB
for zshrc in ~/.zsh.d/[0-9][0-9]*[^~] ; do
  if [[ ! -z $ZSHDEBUG ]]; then
    echo +++ $(basename $zshrc)
  fi
  source $zshrc
done
unsetopt EXTENDED_GLOB

[[ -f ~/.zsh.d/zsh.${OS} ]] && source ~/.zsh.d/zsh.${OS}

# Move these from zshenv because /etc/zprofile will overwrite.
PATH=/opt/local/bin:/opt/local/sbin:$PATH
PATH=/usr/local/bin:/usr/local/sbin:$PATH
PATH=$HOME/bin:$PATH
