return {
	{
		"echasnovski/mini.bracketed",
		event = "BufReadPost",
		config = function()
			local bracketed = require("mini.bracketed")
			bracketed.setup({
				file = { suffix = "" },
				window = { suffix = "" },
				quickfix = { suffix = "" },
				yank = { suffix = "" },
				treesitter = { suffix = "n" },
			})
		end,
	},
}
-- Prompt by Me and code, comment by ChatGPT, plugins name by XHuyZ
-- return {
--     {
--       -- Tên plugin và nguồn của plugin
--       "echasnovski/mini.bracketed",
      
--       -- Sự kiện nào sẽ kích hoạt plugin này. Ở đây là khi mở một buffer (file).
--       event = "BufReadPost",  -- Chạy plugin khi bạn mở một file (đọc buffer)
  
--       -- Cấu hình plugin
--       config = function()
--         -- Tải và cấu hình plugin bằng cách sử dụng module 'mini.bracketed'
--         local bracketed = require("mini.bracketed")
  
--         -- Cấu hình plugin
--         bracketed.setup({
--           -- Cấu hình cho các file. Thêm suffix cho tên file nếu cần
--           file = { suffix = "" },  -- Suffix cho file (ở đây không có gì, có thể để trống)
  
--           -- Cấu hình cho cửa sổ (window). Thêm suffix cho cửa sổ nếu cần
--           window = { suffix = "" },  -- Suffix cho cửa sổ (cũng để trống)
  
--           -- Cấu hình cho quickfix. Quickfix là một cửa sổ hiện các kết quả lỗi hoặc tìm kiếm
--           quickfix = { suffix = "" },  -- Suffix cho quickfix (cũng để trống)
  
--           -- Cấu hình cho yank (lệnh copy dữ liệu vào clipboard trong Neovim)
--           yank = { suffix = "" },  -- Suffix cho yank (cũng để trống)
  
--           -- Cấu hình cho Treesitter. Treesitter giúp phân tích cú pháp mã nguồn.
--           treesitter = { suffix = "n" },  -- Suffix cho Treesitter (thêm 'n' cho các cú pháp đã phân tích với Treesitter)
--         })
--       end,
--     },
--   }
  