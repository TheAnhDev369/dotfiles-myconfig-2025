## 🔧 Hướng dẫn quản lý cấu hình Ghostty bằng GNU Stow

### ✅ Bước 1: Backup lại file `.zshrc` cũ
```bash
mv ~/.zshrc ~/.zshrc.bak
```

---

### ✅ Bước 2: Tạo folder dotfiles và chạy lại lệnh stow
```bash
mkdir -p ~/dotfiles-myconfig/zsh
cd ~/dotfiles-myconfig
stow zsh
```

---

### ✅ Bước 3: Kiểm tra
```bash
ls -l ~/.zshrc
```
> **Kết quả mong muốn**: `.zshrc -> dotfiles-myconfig/zsh/.zshrc`

🎉 **Vậy là thành công**

---

### ✅ Bước 4: Lấy lại config cũ
```bash
cp ~/.zshrc.bak ~/dotfiles-myconfig/zsh/.zshrc
stow -R zsh
```

---

### ✅ Bước 5: Copy lại config/plugins từ bản cũ (nếu có)
```bash
cp ~/.zshrc.bak ~/dotfiles-myconfig/zsh/.zshrc
```
> ⚠️ Không sao nếu lệnh `cp` báo lỗi với `.` và `..`.

---

### ✅ Bước 6: Kiểm tra lại nội dung thư mục mới
```bash
ls -l ~/.zshrc

---

### ✅ Bước 7: Mở lại .bashrc để kiểm tra
```zsh
bash
```

---

### ✅ Bước 8: Xoá bản backup (nếu mọi thứ OK)
```bash
rm ~/.zshrc.bak
```

---

### ✅ Tóm tắt quá trình:
1.  Tạo folder zsh đúng chuẩn để dùng với stow.

2.  Backup và xóa .zshrc gốc.

3.  Copy config cũ vào dotfiles.

4.  Dùng stow để tạo symlink.

5.  Khôi phục nếu cần, kiểm tra lại.

6.  Xóa bản backup khi đã ổn.



