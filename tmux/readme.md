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

