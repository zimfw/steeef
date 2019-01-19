# vim:et sts=2 sw=2 ft=zsh
#
# A customizable version of the steeef theme from
# https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/steeef.zsh-theme
#
# Requires the `git-info` zmodule to be included in the .zimrc file.

_prompt_steeef_venv() {
  [[ -n ${VIRTUAL_ENV} ]] && print -n " (%F{blue}${VIRTUAL_ENV:t}%f)"
}

# use extended color palette if available
if (( terminfo[colors] >= 256 )); then
  : ${USER_COLOR=135}
  : ${HOST_COLOR=166}
  : ${PWD_COLOR=118}
  : ${BRANCH_COLOR=81}
  : ${UNINDEXED_COLOR=166}
  : ${INDEXED_COLOR=118}
  : ${UNTRACKED_COLOR=161}
else
  : ${USER_COLOR=magenta}
  : ${HOST_COLOR=yellow}
  : ${PWD_COLOR=green}
  : ${BRANCH_COLOR=cyan}
  : ${UNINDEXED_COLOR=yellow}
  : ${INDEXED_COLOR=green}
  : ${UNTRACKED_COLOR=red}
fi
: ${UNINDEXED_IND=●}
: ${INDEXED_IND=●}
: ${UNTRACKED_IND=●}
VIRTUAL_ENV_DISABLE_PROMPT=1

setopt nopromptbang promptcr promptpercent promptsp promptsubst

typeset -gA git_info
if (( ${+functions[git-info]} )); then
  zstyle ':zim:git-info' verbose yes
  zstyle ':zim:git-info:branch' format '%b'
  zstyle ':zim:git-info:commit' format '%c'
  zstyle ':zim:git-info:action' format '(%F{${INDEXED_COLOR}}%s%f)'
  zstyle ':zim:git-info:unindexed' format '%F{${UNINDEXED_COLOR}}${UNINDEXED_IND}'
  zstyle ':zim:git-info:indexed' format '%F{${INDEXED_COLOR}}${INDEXED_IND}'
  zstyle ':zim:git-info:untracked' format '%F{${UNTRACKED_COLOR}}${UNTRACKED_IND}'
  if [[ -n ${STASHED_IND} ]]; then
    zstyle ':zim:git-info:stashed' format '%F{${STASHED_COLOR}}${STASHED_IND}'
  fi
  zstyle ':zim:git-info:keys' format \
      'prompt' ' (%F{${BRANCH_COLOR}}%b%c%I%i%u%f%S%f)%s'

  autoload -Uz add-zsh-hook && add-zsh-hook precmd git-info
fi

PS1='
%F{${USER_COLOR}}%n%f at %F{${HOST_COLOR}}%m%f in %F{${PWD_COLOR}}%~%f${(e)git_info[prompt]}$(_prompt_steeef_venv)
%(!.#.$) '
unset RPS1
