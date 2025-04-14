return {
    -- Tên plugin và nguồn của plugin
    "sphamba/smear-cursor.nvim",
  
    opts = {
      -- Cấu hình cho plugin
  
      -- Khi chuyển đổi giữa các buffer hoặc cửa sổ, cursor sẽ bị "mờ" (smear)
      smear_between_buffers = true,
  
      -- Khi di chuyển con trỏ trong cùng một dòng hoặc giữa các dòng lân cận, cursor sẽ bị "mờ"
      smear_between_neighbor_lines = true,
  
      -- Vẽ hiệu ứng smear trong không gian của buffer thay vì không gian của màn hình khi cuộn trang
      scroll_buffer_space = true,
  
      -- Nếu font của bạn hỗ trợ các ký tự tính toán legacy (block unicode symbols),
      -- các smear sẽ hòa quyện tốt hơn trên tất cả các nền
      legacy_computing_symbols_support = false,
    },
  }
-- M&C&X 
-- return {
-- 	"sphamba/smear-cursor.nvim",

-- 	opts = {
-- 		-- Smear cursor when switching buffers or windows.
-- 		smear_between_buffers = true,

-- 		-- Smear cursor when moving within line or to neighbor lines.
-- 		smear_between_neighbor_lines = true,

-- 		-- Draw the smear in buffer space instead of screen space when scrolling
-- 		scroll_buffer_space = true,

-- 		-- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
-- 		-- Smears will blend better on all backgrounds.
-- 		legacy_computing_symbols_support = false,
-- 	},
-- }
