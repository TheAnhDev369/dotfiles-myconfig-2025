## 🔧 Hướng dẫn quản lý cấu hình Ghostty bằng GNU Stow

### ✅ Bước 1: Backup lại folder cũ
```bash
mv ~/.bashrc ~/.bashrc.bak
```

---

### ✅ Bước 2: Tạo folder dotfiles và chạy lại lệnh stow
```bash
mkdir -p ~/dotfiles-myconfig/bash
cd ~/dotfiles-myconfig
stow bash
```

---

### ✅ Bước 3: Kiểm tra
```bash
ls -l ~/.bashrc
```
> **Kết quả mong muốn**: `.bashrc -> dotfiles-myconfig/bash/.bashrc`

🎉 **Vậy là thành công**

---

### ✅ Bước 4: Lấy lại config cũ
```bash
cp ~/.bashrc.bak ~/dotfiles-myconfig/bash/.bashrc
stow -R bash
```

---

### ✅ Bước 5: Copy lại config/plugins từ bản cũ (nếu có)
```bash
cp ~/.bashrc.bak ~/dotfiles-myconfig/bash/.bashrc
```
> ⚠️ Không sao nếu lệnh `cp` báo lỗi với `.` và `..`.

---

### ✅ Bước 6: Kiểm tra lại nội dung thư mục mới
```bash
ls -l ~/.bashrc

---

### ✅ Bước 7: Mở lại .bashrc để kiểm tra
```bash
bash
```

---

### ✅ Bước 8: Xoá bản backup (nếu mọi thứ OK)
```bash
rm ~/.bashrc.bak
```

---

### ✅ Tóm tắt quá trình:
1. Tạo folder bash đúng chuẩn để dùng với stow.

2.  Backup và xóa .bashrc gốc.

3.  Copy config cũ vào dotfiles.

4.  Dùng stow để tạo symlink.

5.  Khôi phục nếu cần, kiểm tra lại.

6.  Xóa bản backup khi đã ổn.



