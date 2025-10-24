# Install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
cd ~

# Install common apps
yay -S \
	neovim-nightly-build \
	ripgrep \
	tldr \
	eza \
	fd \
	fzf \
	btop \
	bat \
	aria2

