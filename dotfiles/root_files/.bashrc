[ -n "$PS1" ] && . ~/bin/dotfiles/zshrc

# ONLY uncomment it when use bash
# [ -s "$HOME/.scm_breeze/scm_breeze.sh" ] && source "$HOME/.scm_breeze/scm_breeze.sh"

export CPPFLAGS="-I/usr/local/opt/openssl/include"
export LDFLAGS="-L/usr/local/opt/openssl/lib"

# gcc is in .zshrc
