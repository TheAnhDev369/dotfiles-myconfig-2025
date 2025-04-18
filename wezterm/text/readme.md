## 🔧 Hướng dẫn sử dụng `stow` cho Kitty

### Bước 1: Backup lại folder cũ

```bash
mv ~/.config/kitty ~/.config/kitty-backup
```

### Bước 2: Tạo folder đúng chuẩn stow và copy config cũ vào

```bash
mkdir -p ~/dotfiles-myconfig/kitty/.config/kitty
cp -r ~/.config/kitty-backup/* ~/dotfiles-myconfig/kitty/.config/kitty/
cp -r ~/.config/kitty-backup/.* ~/dotfiles-myconfig/kitty/.config/kitty/ 2>/dev/null
```

### Bước 3: Chạy `stow`

```bash
cd ~/dotfiles-myconfig
stow kitty
```

### Bước 4: Kiểm tra

```bash
ls -l ~/.config | grep kitty
```

- Kết quả: `kitty -> ../dotfiles-myconfig/kitty/.config/kitty`

✅ **Vậy là thành công!** 🎉

### Bước 5: Xóa bản backup nếu mọi thứ đã OK

```bash
rm -rf ~/.config/kitty-backup
```

---

## 🔧 Hướng dẫn sử dụng `stow` cho Tmux

### Bước 1: Backup lại file cũ

```bash
mv ~/.tmux.conf ~/.tmux.conf.bak
```

### Bước 2: Copy lại vào dotfiles-myconfig và chạy lệnh `stow`

```bash
mkdir -p ~/dotfiles-myconfig/tmux
cp ~/.tmux.conf.bak ~/dotfiles-myconfig/tmux/.tmux.conf
cd ~/dotfiles-myconfig
stow tmux
```

### Bước 3: Kiểm tra

```bash
ls -l ~/.tmux.conf
```

✅ **Vậy là thành công!** 🎉

### Bước 4: Lấy lại config cũ nếu cần

```bash
cp ~/.tmux.conf.bak ~/dotfiles-myconfig/tmux/.tmux.conf
stow -R tmux
```

### Bước 5: Kiểm tra lại nội dung thư mục mới

```bash
ls -l ~/.tmux.conf
```

- Mở lại tmux để cài lại plugin nếu có:

```bash
tmux
Ctrl+a :source-file ~/.tmux.conf
```

### Bước 6: Xóa bản backup nếu mọi thứ OK

```bash
rm ~/.tmux.conf.bak
```

---

## 🔧 Hướng dẫn sử dụng `stow` cho Wezterm

### Bước 1: Backup lại file cũ

```bash
mv ~/.wezterm.lua ~/.wezterm.lua.bak
```

### Bước 2: Copy lại vào dotfiles-myconfig và chạy lệnh `stow`

```bash
mkdir -p ~/dotfiles-myconfig/wezterm/.config/wezterm
cp ~/.wezterm.lua.bak ~/dotfiles-myconfig/wezterm/.config/wezterm/wezterm.lua
cd ~/dotfiles-myconfig
stow wezterm
```

### Bước 3: Kiểm tra

```bash
ls -l ~/.config | grep wezterm
ls -l ~/.config/wezterm/wezterm.lua
```

✅ **Vậy là thành công!** 🎉

### Bước 4: Lấy lại config cũ nếu cần

```bash
cp ~/.wezterm.lua.bak ~/dotfiles-myconfig/wezterm/.config/wezterm/wezterm.lua
stow -R wezterm
```

### Bước 5: Kiểm tra lại nội dung thư mục mới

```bash
ls ~/dotfiles-myconfig/wezterm/.config/wezterm
```

- Mở lại Wezterm để cập nhật:

```bash
wezterm
```

### Bước 6: Xóa bản backup nếu mọi thứ OK

```bash
rm ~/.wezterm.lua.bak
```

