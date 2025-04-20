## 🔧 Hướng dẫn quản lý cấu hình Kitty bằng GNU Stow

### ✅ Bước 1: Backup lại folder cũ
```bash
mv ~/.config/alacritty ~/.config/alacritty-backup
```

---

### ✅ Bước 2: Tạo folder dotfiles và chạy lại lệnh stow
```bash
mkdir -p ~/dotfiles-myconfig/alacritty/.config/alacritty
cd ~/dotfiles-myconfig
stow alacritty
```

---

### ✅ Bước 3: Kiểm tra
```bash
ls -l ~/.config | grep alacritty
```
> **Kết quả mong muốn**: `alacritty -> ../dotfiles-myconfig/alacritty/.config/alacritty`

🎉 **Vậy là thành công**

---

### ✅ Bước 4: Lấy lại config cũ
```bash
cp -r ~/.config/alacritty-backup/* ~/dotfiles-myconfig/alacritty/.config/alacritty/
cp -r ~/.config/alacritty-backup/.* ~/dotfiles-myconfig/alacritty/.config/alacritty/ 2>/dev/null
stow -R alacritty
```

---

### ✅ Bước 5: Copy lại config/plugins từ bản cũ (nếu có)
```bash
cp -r ~/.config/alacritty-backup/* ~/dotfiles-myconfig/alacritty/.config/alacritty/
cp -r ~/.config/alacritty-backup/.* ~/dotfiles-myconfig/alacritty/.config/alacritty/ 2>/dev/null
```
> ⚠️ Không sao nếu lệnh `cp` báo lỗi với `.` và `..`.

---

### ✅ Bước 6: Kiểm tra lại nội dung thư mục mới
```bash
ls ~/dotfiles-myconfig/alacritty/.config/alacritty
```
**→ Bạn nên thấy lại file như: `alacrrit.yml`, `themes`, v.v.**

---

### ✅ Bước 7: Mở lại kitty để kiểm tra
```bash
alacritty
```

---

### ✅ Bước 8: Xoá bản backup (nếu mọi thứ OK)
```bash
rm -rf ~/.config/alacritty-backup
```

---

### ✅ Tóm tắt quá trình:
1. Đã tạo folder alacritty/.config/alacritty đúng chuẩn cho stow.
2. Đã backup và xóa folder `~/.config/kitty` cũ.
3. Đã chạy stow alacritty để tạo symlink mới.
4. Đã copy lại config/plugin từ alacritty-backup.

