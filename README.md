install brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

install git and chezmoi
brew install git chezmoi

git login
git config --global user.name “tiopio”
git config --global user.email “304202834+tiopio@users.noreply.github.com”

generate ssh key and add to github
ssh-keygen -t ed25519 -C “securepio@proton.me”
pbcopy < ~/.ssh/id_ed25519.pub

chezmoi init --apply git@github.com:tiopio/dotfiles.git

brew bundle --file=~/Brewfile

agents install
curl -fsSL https://opencode.ai/v2/install | bash
curl -fsSL https://pi.dev/install.sh | sh
