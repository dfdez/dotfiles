apt update
apt install git zsh stow wget curl -y
apt install ripgrep trash-cli catimg httpie -y

# Install OhMyZSH
sh -c "$(wget -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
chsh -s $(which zsh)

# zsh-autosuggestions zsh-completions zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install

# nvm installation
wget -qO- https://raw.githubusercontent.com/creationix/nvm/master/install.sh | bash
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm

# Install node
nvm install 14

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

# vim plug
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Neovim checkhealth
npm install -g neovim typescript prettier -y
apt install python3-pip python-pip -y
pip3 install neovim
pip install neovim

mkdir -p ~/.config/nvim
mkdir -p ~/.vim

# Apply dotfile
stow --adopt --ignore init.sh --ignore .git -t ~ .

dir=$(dirname $0)
git=$dir/.git

git --git-dir $git --work-tree $dir stash -u

zsh
