return {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      filesystem = {
        filtered_items = {
          visible = true,
        },
      },
    },
  }

--  M&C&X
--   return {
--  {--     "nvim-neo-tree/neo-tree.nvim",
--     opts = {
--       filesystem = {
--         filtered_items = {
--           visible = true,         -- 1️⃣ Cho phép hiển thị các file bị ẩn (filtered items)
--           hide_dotfiles = false,  -- 2️⃣ Không ẩn file bắt đầu bằng dấu chấm, ví dụ: .env, .gitignore
--           hide_gitignored = false, -- 3️⃣ Không ẩn các file bị git ignore (nằm trong .gitignore)
--         },
--       },
--     },
--  }
-- }
