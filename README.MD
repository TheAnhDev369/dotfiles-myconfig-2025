#   My dotfiles config for Arch linux with GNU Stow 

##  GNU Stow là một công cụ quản lý symbolic link (liên kết tượng trưng). 
-   Nó giúp bạn tổ chức và cài đặt các file cấu hình (dotfiles) gọn gàng vào đúng nơi hệ thống cần 
-   ví dụ: ~/.config/nvim, ~/.zshrc, ~/.tmux.conf…

##  🛠️ Cài GNU Stow trên Arch Linux.
**- sudo pacman -S stow .**

##  🧹 Xóa symlink (gỡ cấu hình tạm thời)
-   Gỡ 1 liên kết
**- stow -D ten_symlink**
-   Gỡ tất cả
**- stow -D * .**

-   Thêm nvim với stow nvim [/home/theanhdev/dotfiles-myconfig/nvim/.config/nvim](nvim)

-   Thêm wezterm với stow wezterm [/home/theanhdev/dotfiles-myconfig/wezterm/.config/wezterm](wezterm)


-   Thêm tmux với stow tmux [/home/theanhdev/dotfiles-myconfig/tmux/.tmux.conf](tmux)