lxrun /install /y

lxrun /setdefaultuser root
bash -c @"
apt install -y inotify-tools make tree zsh

useradd -g users -G sudo -m -s /bin/zsh \
        -p `$(perl -e 'print crypt("vagrant", "tnargav")') vagrant
"@

lxrun /setdefaultuser vagrant /y
bash ~ -c @"
   mkdir -p ~/.vim/autoload && mkdir -p ~/.vim/bundle \
&& curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim

   git init \
&& git config user.name seb\! \
&& git config user.email sebi@sebi.one.pl \
&& git remote add origin http://192.168.99.100:8082/sebi/my-babun.git \
&& git fetch --all \
&& git checkout --force bash-on-windows \
&& git reset --hard HEAD \
&& git submodule update --init --recursive

   cd gitflow \
&& make install prefix=~

~/.tmux/plugins/tpm/bin/install_plugins
"@

Get-VpnConnection |
  % { Add-VpnConnectionTriggerApplication -ConnectionName $_.Name -ApplicationID `
      C:\Windows\system32\bash.exe
  }
