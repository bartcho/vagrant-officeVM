Copy-Item -Force -Recurse \\VBOXSVR\bartcho\.ssh C:\Users\vagrant\

lxrun /install /y

lxrun /setdefaultuser root
bash -c "apt install -y inotify-tools make tree zsh stow"
bash -c "update-alternatives --set editor /usr/bin/vim.basic"
bash -c @"
useradd -g users -G sudo -m -s /bin/zsh \
-p `$(perl -e 'print crypt("vagrant", "tnargav")') vagrant
"@

lxrun /setdefaultuser vagrant /y
bash ~ -c @"
ln -sf /mnt/c/Users/vagrant/.ssh ~/.ssh && \
git config --global user.email "bartcho@gmail.com" && \
git config --global user.name "bartcho" && \
git clone git@bitbucket.org:bartcho/dotfiles.git .dotfiles && \
cd .dotfiles && \
git submodule update --init --recursive && \
./wls-stow.sh && \
cd /mnt/c/Users/vagrant/MyProjects && \
git clone ssh://tfs2:22/tfs/enova/enova-git/_git/enova.git && \
cd enova && \
git config --add oh-my-zsh.hide-dirty 1 && \
git config user.email "bartosz.chodakowski@enova.pl" && \
git config user.name "Bartosz Chodakowski" && \
echo "enova:/mnt/c/Users/vagrant/MyProjects/enova" >> ~/.warprc
"@