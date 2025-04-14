return {
	{
		"smjonas/inc-rename.nvim",
		config = function()
			require("inc_rename").setup({
				-- the name of the command
				cmd_name = "IncRename",
				-- the highlight group used for highlighting the identifier's new name
				hl_group = "Substitute",
				-- whether an empty new name should be previewed; if false the command preview will be cancelled instead
				preview_empty_name = false,
				-- whether to display a `Renamed m instances in n files` message after a rename operation
				show_message = true,
				-- whether to save the "IncRename" command in the commandline history (set to false to prevent issues with
				-- navigating to older entries that may arise due to the behavior of command preview)
				save_in_cmdline_history = true,
				-- the type of the external input buffer to use (the only supported value is currently "dressing")
				input_buffer_type = nil,
				-- callback to run after renaming, receives the result table (from LSP handler) as an argument
				post_hook = nil,
			})
		end,
	},
}

--  M&C&X
-- return {
-- 	{
-- 		"smjonas/inc-rename.nvim", -- Plugin hỗ trợ đổi tên biến/hàm/... một cách trực tiếp (interactive rename) qua LSP
-- 		config = function()
-- 			require("inc_rename").setup({
-- 				-- Tên của lệnh sẽ dùng để gọi rename, mặc định là "IncRename"
-- 				-- Bạn có thể gọi lệnh bằng :IncRename
-- 				cmd_name = "IncRename",

-- 				-- Nhóm highlight sẽ được dùng để tô sáng tên mới khi gõ
-- 				-- "Substitute" là highlight mặc định giống như khi dùng :%s trong Vim
-- 				hl_group = "Substitute",

-- 				-- Nếu đặt là false, khi tên mới trống sẽ hủy bỏ thao tác rename thay vì vẫn preview
-- 				preview_empty_name = false,

-- 				-- Sau khi rename xong, sẽ hiện thông báo kiểu: "Renamed 3 instances in 2 files"
-- 				show_message = true,

-- 				-- Có lưu lệnh "IncRename" vào lịch sử commandline hay không
-- 				-- Nếu để true, bạn có thể dùng phím mũi tên lên để gọi lại lệnh
-- 				-- Tuy nhiên đôi lúc gây lỗi nhỏ nếu dùng tính năng preview nên bạn có thể tắt
-- 				save_in_cmdline_history = true,

-- 				-- Loại buffer dùng làm input bên ngoài (chỉ hỗ trợ "dressing" nếu có plugin dressing.nvim)
-- 				-- Nếu bạn dùng plugin dressing.nvim, bạn có thể đặt input_buffer_type = "dressing"
-- 				input_buffer_type = nil,

-- 				-- Hàm callback chạy sau khi rename xong
-- 				-- Nhận vào bảng kết quả trả về từ LSP, bạn có thể xử lý kết quả ở đây nếu muốn (VD: log, thông báo riêng, v.v.)
-- 				post_hook = nil,
-- 			})
-- 		end,
-- 	},
-- }
