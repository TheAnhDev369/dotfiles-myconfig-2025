return
{
    "simrat39/rust-tools.nvim",
    ft = "rust",
    config = function()
      local rt = require("rust-tools")
      rt.setup({
        server = {
          on_attach = function(_, bufnr)
            -- Keybinds for Rust
            vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
          end,
        },
      })
    end,
}
-- { 
--     "simrat39/rust-tools.nvim",
--      Đây là **tên plugin** bạn muốn dùng, cụ thể là tên tác gải của plugins và tên plugins.
--      Plugin này mở rộng chức năng của LSP(Language Server Protocol) cho Rust, dựa trên rust-analyzer. 
--      Nó giúp hiển thị inlay hints, cho phép hover, code actions, runnables`,...

--      ft = "rust",
--      =>  file type
--      Chỉ load plugin này khi bạn mở file có định dạng là .rs, tức là file Rust. 
--      Giúp tăng tốc khởi động Neovim vì chỉ load khi cần.
--      
--      config = function() //  config = function() ... end
--      Đây là đoạn cấu hình plugin sau khi nó được load. Mọi thứ bạn khai báo ở đây sẽ được thực thi khi mở file Rust.

--      local rt = require("rust-tools")
--      require chính là gọi module  rust-tools để sử dụng trong biến rt. Sau đó mình sẽ dùng rt.setup(...) để cấu hình.


--        rt.setup({
--        server = { // = { ... } })
--      Gọi hàm setup() để cấu hình plugin.
--      Trong đó server là nơi bạn có thể tùy chỉnh rust-analyzer, vì rust-tools tích hợp trực tiếp với LSP.


--          on_attach = function(_, bufnr) ... // end
--      Khi rust-analyzer được kích hoạt cho 1 file, hàm on_attach này sẽ chạy.
--      bufnr: là buffer hiện tại (file đang mở).
--      Tại đây bạn có thể gán các keymap riêng cho buffer đó, ví dụ như:
--      vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })

--          vim.keymap.set("n", "<Leader>ca", rt.code_action_group.code_action_group, { buffer = bufnr })
--      Keybinds for Rust <Leader ca>
--      Keybind: <Leader>ca
--      Khi bạn nhấn <Leader> + c + a (ví dụ nếu <Leader> là \, thì là \ca), 
--      nó sẽ gọi ra code_action_group của Rust Tools, 
--      tương tự như các code actions gợi ý sửa lỗi, thêm type, refactor, v.v.

--           end,
--         },
--       })
--     end,
-- }