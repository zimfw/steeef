steeef
======

A customizable version of oh-my-zsh's
[steeef](https://github.com/robbyrussell/oh-my-zsh/blob/master/themes/steeef.zsh-theme)
theme.

![steeef theme](https://i.eriner.me/zim_prompt_steeef.png)

What does it show?
------------------

  * "`user` at `hostname` in `working directory`"
  * Git branch name, or commit short hash when in
    ['detached HEAD' state](http://gitfaq.org/articles/what-is-a-detached-head.html).
    Also, unindexed, indexed, and untracked indicators, and an optional stashed
    indicator (must be customized, see below).
  * Python [`venv`](https://docs.python.org/3/library/venv.html) indicator.

Usage
-----

This theme can be customized with:

    prompt steeef [username_color] [hostname_color] [pwd_color] [branch_color] \
        [unindexed_color] [unindexed_indicator] [indexed_color] [indexed_indicator] \
        [untracked_color] [untracked_indicator] [stashed_color] [stashed_indicator]

The parameters with their default values, for 256-color terminals (or otherwise),
are the following:

  1. Username color: `135` (or `magenta`)
  2. Hostname color: `166` (or `yellow`)
  3. Current working directory color: `118` (or `green`)
  4. Git branch name color: `81` (or `cyan`)
  5. Git unindexed color: `166` (or `yellow`)
  6. Git unindexed indicator: `●`
  7. Git indexed color: `118` (or `green`)
  8. Git indexed indicator: `●`
  9. Git untracked color: `161` (or `red`)
 10. Git untracked indicator: `●`
 11. Git stashed color: *undefined*
 12. Git stashed indicator: *undefined*

The git stashed indicator will not be shown unless defined.

If you enabled Zim's [`prompt`](https://github.com/zimfw/prompt) module, you can
set this as your default theme with the following zstyle:

    zstyle ':zim:prompt' theme 'steeef'

Additional customization parameters can be passed too. For example:

    zstyle ':zim:prompt' theme 'steeef' 'magenta' 'yellow' 'green' 'cyan' \
        'magenta' '!' 'green' '+' 'red' '?' 'yellow' '$'

Requirements
------------

Requires Zim's [`git-info`](https://github.com/zimfw/git-info) module to show
git information.
