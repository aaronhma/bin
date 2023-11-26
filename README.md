# bin

## lightweight. fast. no legacy code

### Notes

#### 0. macOS Changes

In macOS Catalina, [Apple replaced Bash with Zsh as the default login shell](https://support.apple.com/en-ca/HT208050). This is true of Apple Silicon Macs as well. The majority of Bash scripts have been removed, but are available [here](https://github.com/aaronhma/bin/commit/c8547427195fc4c71441db5172f4fcdc2f120730).

[more on StackExchange...](https://apple.stackexchange.com/questions/361870/what-are-the-practical-differences-between-bash-and-zsh)

Some Bash scripts in macOS Catalina and later are kept for compatibility purposes for Intel Macs. Make sure to change your `zsh` settings [here](https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where).

[more on StackExchange...](https://apple.stackexchange.com/questions/388622/zsh-zprofile-zshrc-zlogin-what-goes-where)

#### 1. `git` Bash Autocomplete

1. `git` Autocomplete in Bash was removed, use this:

* <https://stackoverflow.com/questions/12399002/how-to-configure-git-bash-command-line-completion>

2. `git flow` Autocomplete in Bash was removed, use this:

* <https://stackoverflow.com/questions/8892985/how-do-i-enable-auto-complete-for-a-git-flow-alias>
* <https://github.com/bobthecow/git-flow-completion>
* <https://fig.io/plugins/completion/git-flow-completion>

#### 2. `ssh` Bash Autocomplete

1. Copy [this](https://github.com/aaronhma/bin/commit/c8547427195fc4c71441db5172f4fcdc2f120730#diff-9a5cc2bb8b28fdb05ee455514ea6fac831f6f05e3e5aee75026cce25de65e7c3) and put it into `dotfiles/plugins/completion/ssh.completion.bash`.
2. Add `. ~/bin/dotfiles/plugins/completion/ssh.completion.bash` into `dotfiles/bashrc`.

[more on tecadmin...](https://tecadmin.net/enable-bash-completion-on-macos/)
[more on StackOverflow...](https://stackoverflow.com/questions/61539494/how-does-bash-do-ssh-autocompletion)

#### 3. Terminals

1. Apple Terminal [[1]](https://apple.stackexchange.com/a/382327)
2. iTerm [[1]](https://iterm2.com/downloads.html), [[2]](https://iterm2.com/documentation-shell-integration.html)
3. Fig (Amazon CodeWhisperer) [[1]](https://fig.io/), [[2]](https://aws.amazon.com/blogs/devops/introducing-amazon-codewhisperer-for-command-line/)

#### 4. `dotfiles/root_files/.gitignore_global`

See [github/gitignore](https://github.com/github/gitignore).

#### 5. `scm_breeze` removed

See [scmbreeze/scm_breeze](https://github.com/scmbreeze/scm_breeze).

#### 6. More Zsh Autocomplete

See [marlonrichert/zsh-autocomplete](https://github.com/marlonrichert/zsh-autocomplete).

### Releases

#### 0.0.3 / 2023-11-26

* Bug fixes
* Minimize files

#### 0.0.2 / 2023-05-19

* Bug fixes

#### 0.0.1 / 2022-04-14

* Initial project commit
