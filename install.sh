apt update
apt install git zsh stow wget curl -y
apt install ripgrep trash-cli catimg httpie -y

# Yarn
apt install gnupg2 -y
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
apt update
apt install yarn -y

# vim
wget https://github.com/neovim/neovim/releases/download/nightly/nvim-linux64.tar.gz
tar -xf nvim-linux64.tar.gz
cp -R ./nvim-linux64/* /usr
rm -r nvim-linux64*

apt install python3-pip python-pip -y

# tmux
apt install tmux -y
