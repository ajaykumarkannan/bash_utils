# Source .bashrc
if [ -f ~/.bashrc ];
then
   source ~/.bashrc
fi

if shopt -q login_shel; then
  fortune | cowsay
fi
