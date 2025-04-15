## Neovim Config với Stow

### Issue
-   Khi chạy `stow nvim`, Stow muốn tạo symlink từ:
    -   `~/.config/nvim` → `~/dotfiles-myconfig/nvim/.config/nvim`
-   Nhưng nếu thư mục `~/.config/nvim` đã tồn tại sẵn (có real file/folder), Stow sẽ bỏ qua để tránh ghi đè, và **không báo lỗi rõ ràng** 😤

---

## Bước 1: Backup lại folder cũ
```bash
mv ~/.config/nvim ~/.config/nvim-backup
```

## Bước 2: Tạo thư mục chuẩn cho Stow và chạy lại lệnh stow
```bash
mkdir -p ~/dotfiles-myconfig/nvim/.config/nvim
cd ~/dotfiles-myconfig
stow nvim
```

## Bước 3: Kiểm tra symlink
```bash
ls -l ~/.config | grep nvim
```

Kết quả mong muốn:
```bash
nvim -> /home/theanhdev/dotfiles-myconfig/nvim/.config/nvim
```

🎉 **Vậy là thành công!**

---

## Bước 4: Lấy lại config cũ (nếu cần)
```bash
cp -r ~/.config/nvim-backup/* ~/dotfiles-myconfig/nvim/.config/nvim/
stow -R nvim
```

## Bước 5: Copy lại plugin và file ẩn (nếu có)
```bash
cp -r ~/.config/nvim-backup/* ~/dotfiles-myconfig/nvim/.config/nvim/
cp -r ~/.config/nvim-backup/.* ~/dotfiles-myconfig/nvim/.config/nvim/ 2>/dev/null
```
⚠️ Lỗi `.` và `..` là bình thường, có thể bỏ qua.

## Bước 6: Kiểm tra lại nội dung thư mục mới
```bash
ls ~/dotfiles-myconfig/nvim/.config/nvim
```
Bạn nên thấy lại các file như `init.lua`, thư mục `lua/`, `lazy-lock.json`, v.v.

## Mở lại Neovim để test
```bash
nvim
```
- Nếu bạn dùng **Lazy.nvim**, lần đầu sẽ tự động sync lại plugin.
- Nếu không, có thể dùng `:Lazy sync` để cập nhật thủ công.

---

## Bước 7: Xóa backup nếu mọi thứ ổn
```bash
rm -rf ~/.config/nvim-backup
```

---

## ✅ Tóm tắt lại quá trình:
1.  Đã tạo folder `nvim/.config/nvim` đúng chuẩn cho Stow.
2.  Đã backup và xóa folder `~/.config/nvim` cũ.
3.  Đã chạy `stow nvim` để tạo symlink mới.
4.  Đang chuẩn bị copy lại config/plugin từ `nvim-backup`.

