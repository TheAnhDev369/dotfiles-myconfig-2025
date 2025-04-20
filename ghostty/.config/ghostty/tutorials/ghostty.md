## 🔧 Hướng dẫn quản lý cấu hình Ghostty bằng GNU Stow

### ✅ Bước 1: Backup lại folder cũ
```bash
mv ~/.config/ghostty ~/.config/ghostty-backup
```

---

### ✅ Bước 2: Tạo folder dotfiles và chạy lại lệnh stow
```bash
mkdir -p ~/dotfiles-myconfig/ghostty/.config/ghostty
cd ~/dotfiles-myconfig
stow ghostty
```

---

### ✅ Bước 3: Kiểm tra
```bash
ls -l ~/.config | grep ghostty
```
> **Kết quả mong muốn**: `ghostty -> ../dotfiles-myconfig/ghostty/.config/ghostty`

🎉 **Vậy là thành công**

---

### ✅ Bước 4: Lấy lại config cũ
```bash
cp -r ~/.config/ghostty-backup/* ~/dotfiles-myconfig/ghostty/.config/ghostty/
cp -r ~/.config/ghostty-backup/.* ~/dotfiles-myconfig/ghostty/.config/ghostty/ 2>/dev/null
stow -R ghostty
```

---

### ✅ Bước 5: Copy lại config/plugins từ bản cũ (nếu có)
```bash
cp -r ~/.config/ghostty-backup/* ~/dotfiles-myconfig/ghostty/.config/ghostty/
cp -r ~/.config/ghostty-backup/.* ~/dotfiles-myconfig/ghostty/.config/ghostty/ 2>/dev/null
```
> ⚠️ Không sao nếu lệnh `cp` báo lỗi với `.` và `..`.

---

### ✅ Bước 6: Kiểm tra lại nội dung thư mục mới
```bash
ls ~/dotfiles-myconfig/ghostty/.config/ghostty
```
**→ Bạn nên thấy lại file như: `config`, `themes`, v.v.**

---

### ✅ Bước 7: Mở lại ghostty để kiểm tra
```bash
ghostty
```

---

### ✅ Bước 8: Xoá bản backup (nếu mọi thứ OK)
```bash
rm -rf ~/.config/ghostty-backup
```

---

### ✅ Tóm tắt quá trình:
1. Đã tạo folder `ghostty/.config/ghostty` đúng chuẩn cho stow.
2. Đã backup và xóa folder `~/.config/ghostty` cũ.
3. Đã chạy `stow ghostty` để tạo symlink mới.
4. Đã copy lại config/plugin từ `ghostty-backup`.


