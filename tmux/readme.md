##  Bước 1: Backup lại folder cũ
-   mv ~/.tmux.conf ~/.tmux.conf.bak

##  Bước 2: Copy lại vào dotfiles-myconfig và chạy lại lệnh stow
-   mkdir -p ~/dotfiles-myconfig/tmux
-   cd ~/dotfiles-myconfig
-   stow tmux    

##  Bước 3: Kiểm tra
-   ls -l ~/.tmux.conf

### Vậy là thành công 🎉

##  Bước 4: Lấy lại config cũ
-   cp ~/.tmux.conf.bak ~/dotfiles-myconfig/tmux/.tmux.conf
**- Rồi restow lại**
-   stow -R tmux

##  Bước 5: Copy lại config/plugins từ bản cũ

-   cp ~/.tmux.conf.bak ~/dotfiles-myconfig/tmux/
-   cp ~/.tmux.conf.bak ~/dotfiles-myconfig/tmux/ 2>/dev/null

##  Bước 6: Kiểm tra lại nội dung thu mục mới
-   ls -l ~/.tmux.conf

**- Ta thấy file .tmux.conf

**- Mở lại tmux để tự động cài lại plugin:**
-   tmux
**- Cập nhật thay đổi cho tmux với source-file path/to/file.**
-   tmux -> Ctrl+a :source-file

**- 4. Xóa bản backup (nếu mọi thứ OK)**
-   rm ~/.tmux.conf.bak

#   Tóm tắt lại quá trình đã làm :
1.  Đã tạo folder /tmux/.tmux.conf đúng chuẩn cho stow.

2.  Đã backup và xóa file ~/.tmux.conf cũ.

3.  Đã chạy stow tmux để tạo symlink mới.

4.  Đang chuẩn bị copy lại config/plugin từ .tmux.config.bak .
