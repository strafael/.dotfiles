# Install yay
sudo pacman -S --needed git base-devel && git clone https://aur.archlinux.org/yay-bin.git && cd yay-bin && makepkg -si
cd ~

# Update system
yay -Syu --noconfirm

# Install common apps
yay -Sy --noconfirm \
	neovim-nightly-build \
	ripgrep \
	tldr \
	eza \
	fd \
	fzf \
	btop \
	bat \
	aria2

