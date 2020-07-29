# Source .bashrc
if [ -f ~/.bashrc ];
then
  source ~/.bashrc
fi

if shopt -q login_shell; then
  if command -v fortune && command -v cowsay; then
    fortune | cowsay
  fi
fi
