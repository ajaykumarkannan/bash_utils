# Source .bashrc
if [ -f ~/.bashrc ];
then
   source ~/.bashrc
fi

if shopt -q login_shell; then
  fortune | cowsay
fi
