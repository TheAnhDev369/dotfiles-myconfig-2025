#   My dotfiles config for Arch Linux with GNU Stow

### Hướng dẫn cài đặt và sử dụng GNU Stow trên Arch Linux

---

#### Bước 1: Cài đặt GNU Stow

Sử dụng `pacman` để cài đặt:

```bash
sudo pacman -S stow
```

Kiểm tra lại phiên bản để chắc chắn cài đặt thành công:

```bash
stow --version
```

---

#### Bước 2: Tạo thư mục dotfiles

Tạo thư mục quản lý cấu hình như sau:

```bash
mkdir -p ~/dotfiles
cd ~/dotfiles
```

Tổ chức cấu trúc thư mục:

```
dotfiles/
├── nvim/
│   └── .config/
│       └── nvim/
├── zsh/
│   └── .zshrc
├── tmux/
│   └── .tmux.conf
```

> Lưu ý: Tên thư mục con (`nvim`, `zsh`, `tmux`) nên đặt rõ ràng để dễ dùng với Stow.

##  GNU Stow là một công cụ quản lý symbolic link (liên kết tượng trưng).
-   Nó giúp bạn tổ chức và cài đặt các file cấu hình (dotfiles) gọn gàng vào đúng nơi hệ thống cần
-   ví dụ: `~/.config/nvim`, `~/.zshrc`, `~/.tmux.conf`…

##  🛠️ Cài GNU Stow trên Arch Linux
**- sudo pacman -S stow**

##  🧹 Xóa symlink (gỡ cấu hình tạm thời)
-   Gỡ 1 liên kết: `stow -D ten_symlink`
-   Gỡ tất cả: `stow -D *`

##  📦 Danh sách các cấu hình đã thêm với stow:

### 🔹 Neovim
-   Thêm với: `stow nvim`
-   Đường dẫn: [`~/dotfiles-myconfig/nvim/.config/nvim`](nvim)

### 🔹 Wezterm
-   Thêm với: `stow wezterm`
-   Đường dẫn: [`~/dotfiles-myconfig/wezterm/.config/wezterm`](wezterm)

### 🔹 Tmux
-   Thêm với: `stow tmux`
-   Đường dẫn: [`~/dotfiles-myconfig/tmux/.tmux.conf`](tmux)

### 🔹 Ghostty
-   Thêm với: `stow ghostty`
-   Đường dẫn: [`~/dotfiles-myconfig/ghostty/.config/ghostty/config.md`](ghostty)

### 🔹 Kitty
-   Thêm với: `stow kitty`
-   Đường dẫn: [`~/dotfiles-myconfig/kitty/.config/kitty/kitty.conf`](kitty)

### 🔹 Alacritty
-   Thêm với: `stow alacritty`
-   Đường dẫn: [`~/dotfiles-myconfig/alacritty/.config/alacritty/alacritty.yml`](alacritty)

### 🔹 Bashrc
-   Thêm với: `stow bash`
-   Đường dẫn: [`~/dotfiles-myconfig/bash/.bashrc`](bash)


### 🔹 Zshrc
-   Thêm với: `stow zsh`
-   Đường dẫn: [`~/dotfiles-myconfig/zsh/.zshrc`](zsh)