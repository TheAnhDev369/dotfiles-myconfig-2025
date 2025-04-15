## 🔧 Hướng dẫn quản lý cấu hình Kitty bằng GNU Stow

### ✅ Bước 1: Backup lại folder cũ
```bash
mv ~/.config/kitty ~/.config/kitty-backup
```

---

### ✅ Bước 2: Tạo folder dotfiles và chạy lại lệnh stow
```bash
mkdir -p ~/dotfiles-myconfig/kitty/.config/kitty
cd ~/dotfiles-myconfig
stow kitty
```

---

### ✅ Bước 3: Kiểm tra
```bash
ls -l ~/.config | grep kitty
```
> **Kết quả mong muốn**: `kitty -> ../dotfiles-myconfig/kitty/.config/kitty`

🎉 **Vậy là thành công**

---

### ✅ Bước 4: Lấy lại config cũ
```bash
cp -r ~/.config/kitty-backup/* ~/dotfiles-myconfig/kitty/.config/kitty/
cp -r ~/.config/kitty-backup/.* ~/dotfiles-myconfig/kitty/.config/kitty/ 2>/dev/null
stow -R kitty
```

---

### ✅ Bước 5: Copy lại config/plugins từ bản cũ (nếu có)
```bash
cp -r ~/.config/kitty-backup/* ~/dotfiles-myconfig/kitty/.config/kitty/
cp -r ~/.config/kitty-backup/.* ~/dotfiles-myconfig/kitty/.config/kitty/ 2>/dev/null
```
> ⚠️ Không sao nếu lệnh `cp` báo lỗi với `.` và `..`.

---

### ✅ Bước 6: Kiểm tra lại nội dung thư mục mới
```bash
ls ~/dotfiles-myconfig/kitty/.config/kitty
```
**→ Bạn nên thấy lại file như: `kitty.conf`, `theme.conf`, v.v.**

---

### ✅ Bước 7: Mở lại kitty để kiểm tra
```bash
kitty
```

---

### ✅ Bước 8: Xoá bản backup (nếu mọi thứ OK)
```bash
rm -rf ~/.config/kitty-backup
```

---

### ✅ Tóm tắt quá trình:
1. Đã tạo folder `kitty/.config/kitty` đúng chuẩn cho stow.
2. Đã backup và xóa folder `~/.config/kitty` cũ.
3. Đã chạy `stow kitty` để tạo symlink mới.
4. Đã copy lại config/plugin từ `kitty-backup`.

