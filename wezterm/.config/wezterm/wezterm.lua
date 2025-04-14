local wezterm = require("wezterm")
local config = wezterm.config_builder()
local io = require("io")
local os = require("os")

-- 💡 Biến toàn cục
local brightness = 0.03
local user_home = os.getenv("HOME")
local background_folders = {
  user_home .. "/Pictures/AllWallpaper",  -- Đường dẫn thư mục ảnh đầu tiên
  "/home/theanhdev/wallpaper",            -- Đường dẫn thư mục ảnh thứ hai
}
local bg_image = background_folders[1] .. "/bg.jpg"  -- Đặt ảnh mặc định từ thư mục đầu tiên

-- 🖼️ Hàm lấy ảnh ngẫu nhiên từ tất cả các thư mục
local function pick_random_background()
  -- Xử lý lấy ngẫu nhiên một thư mục từ danh sách
  local folder = background_folders[math.random(#background_folders)]
  local success, handle = pcall(io.popen, 'ls "' .. folder .. '"')  -- Adjusted for Linux (using ls instead of dir)
  
  if success and handle then
    local files = handle:read("*a")
    handle:close()

    local images = {}
    for file in string.gmatch(files, "[^\r\n]+") do
      table.insert(images, file)
    end

    if #images > 0 then
      return folder .. "/" .. images[math.random(#images)]  -- Adjusted for Linux paths
    end
  end
  return nil
end

-- 🎨 Giao diện
config.color_scheme = "Tokyo Night"
config.font = wezterm.font("JetBrainsMono Nerd Font ", { weight = "Medium" })
config.font_size = 10

config.window_padding = { left = 2, right = 2, top = 2, bottom = 2 }
config.window_background_opacity = 0.9
--  config.window_background_blur = 30
config.window_decorations = "RESIZE"
config.enable_tab_bar = false
config.window_background_image = bg_image
config.window_background_image_hsb = {
  brightness = brightness,
  hue = 1.0,
  saturation = 0.8,
}
config.warn_about_missing_glyphs = false

-- 💡 Cursor
config.default_cursor_style = "BlinkingBar"
config.cursor_thickness = 1
config.cursor_blink_ease_in = "Ease"

-- 🧠 PHÍM TẮT ĐẦY ĐỦ
config.keys = {
  -- 🎨 Đổi hình nền ngẫu nhiên
  {
    key = "b", mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      local random_bg = pick_random_background()
      if random_bg then
        bg_image = random_bg
        window:set_config_overrides({ window_background_image = bg_image })
        wezterm.log_info("New bg: " .. bg_image)
      else
        wezterm.log_error("No background image found!")
      end
    end),
  },

  -- 🔗 Mở link dưới con trỏ
  { key = "L", mods = "CTRL|SHIFT", action = wezterm.action.OpenLinkAtMouseCursor },

  -- 🔆 Tăng độ sáng
  {
    key = ">", mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      brightness = math.min(brightness + 0.01, 1.0)
      window:set_config_overrides({
        window_background_image_hsb = { brightness = brightness, hue = 1.0, saturation = 0.8 },
        window_background_image = bg_image,
      })
    end),
  },

  -- 🔅 Giảm độ sáng
  {
    key = "<", mods = "CTRL|SHIFT",
    action = wezterm.action_callback(function(window)
      brightness = math.max(brightness - 0.01, 0.01)
      window:set_config_overrides({
        window_background_image_hsb = { brightness = brightness, hue = 1.0, saturation = 0.8 },
        window_background_image = bg_image,
      })
    end),
  },

  -- ➕ Mở tab mới
  { key = "T", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },

  -- ❌ Đóng tab hiện tại
  { key = "W", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = true } },

  -- 🔲 Bật/tắt fullscreen
  { key = "Enter", mods = "ALT", action = "ToggleFullScreen" },

  -- 🛑 Thoát ứng dụng
  { key = "Q", mods = "CTRL|SHIFT", action = wezterm.action.QuitApplication },

  -- 📂 Mở thư mục ảnh trong File Manager (assuming using Nautilus or similar on Arch Linux)
  {
    key = "O", mods = "CTRL|SHIFT",
    action = wezterm.action.SpawnCommandInNewWindow {
      args = { "nautilus", background_folders[1] },  -- Adjusted to open the first folder with Nautilus
    },
  },
}

-- 💡 Tự động thay đổi hình nền sau mỗi 5 phút
wezterm.on("startup", function()
  local function change_background_periodically(window)
    local function change_bg()
      local random_bg = pick_random_background()
      if random_bg then
        bg_image = random_bg
        window:set_config_overrides({ window_background_image = bg_image })
        wezterm.log_info("New bg: " .. bg_image)
      else
        wezterm.log_error("No background image found!")
      end
    end

    -- Thực hiện thay đổi hình nền ngay khi bắt đầu
    change_bg()

    -- Thiết lập thay đổi hình nền mỗi 5 phút (300 giây)
    wezterm.add_timer(300, function() change_bg() end)
  end

  wezterm.active_window():set_callback("resize", change_background_periodically)
end)

-- 🚀 Tự động mở nvim nếu muốn (optional)
-- config.default_prog = { "bash", "-c", "nvim" }  -- Optional, if you want to start nvim automatically

return config


--  Version 1
-- local wezterm = require("wezterm")
-- local config = wezterm.config_builder()
-- local io = require("io")
-- local os = require("os")

-- -- 💡 Biến toàn cục
-- local brightness = 0.03
-- local user_home = os.getenv("HOME")
-- local background_folder = user_home .. "/Pictures/AllWallpaper"  -- Adjusted for Linux paths
-- local bg_image = background_folder .. "/bg.jpg"  -- Adjusted for Linux paths

-- -- 🖼️ Hàm lấy ảnh ngẫu nhiên
-- local function pick_random_background(folder)
--   local success, handle = pcall(io.popen, 'ls "' .. folder .. '"')  -- Adjusted for Linux (using ls instead of dir)
--   if success and handle then
--     local files = handle:read("*a")
--     handle:close()

--     local images = {}
--     for file in string.gmatch(files, "[^\r\n]+") do
--       table.insert(images, file)
--     end

--     if #images > 0 then
--       return folder .. "/" .. images[math.random(#images)]  -- Adjusted for Linux paths
--     end
--   end
--   return nil
-- end

-- -- 🎨 Giao diện
-- config.color_scheme = "Tokyo Night"
-- config.font = wezterm.font("JetBrainsMono Nerd Font ", { weight = "Medium" })
-- config.font_size = 10

-- config.window_padding = { left = 2, right = 2, top = 2, bottom = 2 }
-- config.window_background_opacity = 0.9
-- --  config.window_background_blur = 30
-- config.window_decorations = "RESIZE"
-- config.enable_tab_bar = false
-- config.window_background_image = bg_image
-- config.window_background_image_hsb = {
-- brightness = brightness,
-- hue = 1.0,
-- saturation = 0.8,
-- }
-- config.warn_about_missing_glyphs = false

-- -- 💡 Cursor
-- config.default_cursor_style = "BlinkingUnderline"
-- config.cursor_thickness = 2

-- -- 🧠 PHÍM TẮT ĐẦY ĐỦ
-- config.keys = {
--   -- 🎨 Đổi hình nền ngẫu nhiên
--   {
--     key = "b", mods = "CTRL|SHIFT",
--     action = wezterm.action_callback(function(window)
--       local random_bg = pick_random_background(background_folder)
--       if random_bg then
--         bg_image = random_bg
--         window:set_config_overrides({ window_background_image = bg_image })
--         wezterm.log_info("New bg: " .. bg_image)
--       else
--         wezterm.log_error("No background image found!")
--       end
--     end),
--   },

--   -- 🔗 Mở link dưới con trỏ
--   { key = "L", mods = "CTRL|SHIFT", action = wezterm.action.OpenLinkAtMouseCursor },

--   -- 🔆 Tăng độ sáng
--   {
--     key = ">", mods = "CTRL|SHIFT",
--     action = wezterm.action_callback(function(window)
--       brightness = math.min(brightness + 0.01, 1.0)
--       window:set_config_overrides({
--         window_background_image_hsb = { brightness = brightness, hue = 1.0, saturation = 0.8 },
--         window_background_image = bg_image,
--       })
--     end),
--   },

--   -- 🔅 Giảm độ sáng
--   {
--     key = "<", mods = "CTRL|SHIFT",
--     action = wezterm.action_callback(function(window)
--       brightness = math.max(brightness - 0.01, 0.01)
--       window:set_config_overrides({
--         window_background_image_hsb = { brightness = brightness, hue = 1.0, saturation = 0.8 },
--         window_background_image = bg_image,
--       })
--     end),
--   },

--   -- ➕ Mở tab mới
--   { key = "T", mods = "CTRL|SHIFT", action = wezterm.action.SpawnTab("DefaultDomain") },

--   -- ❌ Đóng tab hiện tại
--   { key = "W", mods = "CTRL|SHIFT", action = wezterm.action.CloseCurrentTab { confirm = true } },

--   -- 🔲 Bật/tắt fullscreen
--   { key = "Enter", mods = "ALT", action = "ToggleFullScreen" },

--   -- 🛑 Thoát ứng dụng
--   { key = "Q", mods = "CTRL|SHIFT", action = wezterm.action.QuitApplication },

--   -- 📂 Mở thư mục ảnh trong File Manager (assuming using Nautilus or similar on Arch Linux)
--   {
--     key = "O", mods = "CTRL|SHIFT",
--     action = wezterm.action.SpawnCommandInNewWindow {
--       args = { "nautilus", background_folder },  -- Adjusted to open the folder with Nautilus (Arch Linux's file manager)
--     },
--   },
-- }

-- -- 🚀 Tự động mở nvim nếu muốn (optional)
-- -- config.default_prog = { "bash", "-c", "nvim" }  -- Optional, if you want to start nvim automatically

-- return config
