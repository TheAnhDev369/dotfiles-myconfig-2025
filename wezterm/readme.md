##  Bước 1: Backup lại folder cũ
-   mv ~/.wezterm.lua ~/.wezterm.lua.bak

##  Bước 2: Copy lại vào dotfiles-myconfig và chạy lại lệnh stow
-   mkdir -p ~/dotfiles-myconfig/wezterm/.config/wezterm   
-   cd ~/dotfiles-myconfig
-   stow wezterm    

##  Bước 3: Kiểm tra
-   ls -l ~/.config | grep wezterm
-   ls -l ~/.config/wezterm/wezterm.lua

### Vậy là thành công 🎉


##  Bước 4: Lấy lại config cũ
-   cp ~/.wezterm.lua.bak ~/dotfiles-myconfig/wezterm/.config/wezterm/wezterm.lua
**- Rồi restow lại**
-   stow -R wezterm


##  Bước 5: Copy lại config/plugins từ bản cũ

-   cp ~/.wezterm.lua.bak ~/dotfiles-myconfig/wezterm/.config/wezterm/
-   cp ~/.wezterm.lua.bak ~/dotfiles-myconfig/wezterm/.config/wezterm/ 2>/dev/null


##  Bước 6: Kiểm tra lại nội dung thu mục mới
-   ls ~/dotfiles-myconfig/wezterm/.config/wezterm

**- TA thấy file .wezterm.lua

**- Mở lại wezterm để tự động cài lại plugin:**
-   wezterm

**- 4. Xóa bản backup (nếu mọi thứ OK)**
-   rm -rf ~/.config/wezterm.lua.bak


#   Tóm tắt lại quá trình đã làm :
1.  Đã tạo folder wezterm/.config/wezterm đúng chuẩn cho stow.

2.  Đã backup và xóa folder ~/.config/wezterm cũ.

3.  Đã chạy stow wezterm để tạo symlink mới.

4.  Đang chuẩn bị copy lại config/plugin từ wezterm.lua.bak .
