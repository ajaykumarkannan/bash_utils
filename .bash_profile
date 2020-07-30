# Source .bashrc
if [ -f ~/.bashrc ];
then
  source ~/.bashrc
fi

if shopt -q login_shell; then
  if command -v fortune > /dev/null && command -v cowsay > /dev/null; then
    fortune | cowsay
  fi
fi
