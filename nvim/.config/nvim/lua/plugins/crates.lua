return {
    "saecki/crates.nvim",
    event = { "BufRead Cargo.toml" },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = true,
}

-- return {
--     "saecki/crates.nvim",
--      Đây là tên plugin bạn muốn dùng(bao gồm tên tác giả/tên plugins).
--     Mục đích: hỗ trợ làm việc với file Cargo.toml của Rust:

--         Gợi ý phiên bản mới nhất của các crate.
--         Xem changelog.
--         Tự động cập nhật phiên bản.
--         Tích hợp với Telescope, nvim-cmp,...

--     event = { "BufRead Cargo.toml" },
--     Đây là lazy loading event — plugin này sẽ chỉ được load khi bạn mở hoặc đọc một file tên là Cargo.toml.
--     BufRead: là sự kiện xảy ra khi bạn mở một file.
--     Cargo.toml: là file chính của Rust project, giống như package.json của Node.js vậy.
-- 💡 Nhờ khai báo như thế này, Neovim sẽ không load plugin khi không cần, giúp khởi động nhanh hơn.

--     dependencies = { "nvim-lua/plenary.nvim" },
--     Plugin crates.nvim phụ thuộc vào plenary.nvim, nên cần phải đảm bảo nó được cài.
--     plenary.nvim là một thư viện tiện ích được nhiều plugin Lua dùng trong Neovim.
--     Lazy.nvim sẽ tự động ức là: tự động gọi require("crates").setup() với cấu hình mặc định.

--     config = true,
--     Tức là: tự động gọi require("crates").setup() với cấu hình mặc định.
--     Đây là tính năng tiện lợi của Lazy.nvim.
--     Nếu bạn để config = true, thì Lazy sẽ hiểu là:

--     require("crates").setup()
--     Tương tự với:
--     config = function()
--      require("crates").setup()
--     end
-- }