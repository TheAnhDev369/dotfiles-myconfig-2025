
#   Issue
-   stow nvim
-   Stow muốn tạo symlink từ 
-   ~/.config/nvim → ~/dotfiles-myconfig/nvim/.config/nvim
-   Nhưng thư mục ~/.config/nvim đã tồn tại từ trước (có real file rồi), nên stow sẽ bỏ qua để tránh ghi đè, và không báo lỗi rõ ràng 😤

#  Cách xử lý đúng:

##  Bước 1: Backup lại folder cũ
-   mv ~/.config/nvim ~/.config/nvim-backup

##  Bước 2: chạy lại lệnh stow
-   mkdir nvim/.config/nvim/   
-   cd ~/dotfiles-myconfig
-   stow nvim    


##   Bước 3: Kiểm tra
-   ls -l ~/.config | grep nvim
-   nvim -> /home/theanhdev/dotfiles-myconfig/nvim/.config/nvim

### Vậy là thành công 🎉


##  Bước 4: Lấy lại config cũ
**- Nếu bạn muốn lấy lại config cũ**
**- Sau khi test ok, bạn có thể copy lại file từ nvim-bak vào folder stow, ví dụ:**
-   cp -r ~/.config/nvim-backup/* ~/dotfiles-myconfig/nvim/.config/nvim/
**- Rồi restow lại**
-   stow -R nvim


##  Bước 5: Copy lại config/plugins từ bản cũ
**- Giả sử file cũ của bạn trong ~/.config/nvim-backup, bạn chạy:**
-   cp -r ~/.config/nvim-backup/* ~/dotfiles-myconfig/nvim/.config/nvim/
**- Hoặc nếu bạn có file ẩn (dotfiles) trong đó nữa:**
-   cp -r ~/.config/nvim-backup/.* ~/dotfiles-myconfig/nvim/.config/nvim/ 2>/dev/null

### ⚠️ Đừng lo nếu cp báo lỗi với . và .., cứ kệ, bình thường.


##  Bước 6: Kiểm tra lại nội dung thu mục mới
-   ls ~/dotfiles-myconfig/nvim/.config/nvim
**- Bạn nên thấy lại file như: init.lua, lua/, lazy-lock.json, v.v.**

**- Mở lại nvim để tự động cài plugin:**
-   nvim
-   Nếu bạn dùng Lazy.nvim, thì lần đầu mở lại nó sẽ tự sync lại plugin (giống như :Lazy sync). Nếu không tự chạy, bạn có thể gõ:
-   Lazy sync

**- 4. Xóa bản backup (nếu mọi thứ OK)**
-   rm -rf ~/.config/nvim-backup


#   Tóm tắt lại quá trình đã làm :
1.  Đã tạo folder nvim/.config/nvim đúng chuẩn cho stow.

2.  Đã backup và xóa folder ~/.config/nvim cũ.

3.  Đã chạy stow nvim để tạo symlink mới.

4.  Đang chuẩn bị copy lại config/plugin từ nvim-backup.