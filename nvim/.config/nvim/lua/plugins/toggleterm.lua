return {
  'akinsho/toggleterm.nvim',
  version = "*",
  opts = {
    size = 15,
    direction = "horizontal",
    open_mapping = [[<C-\>]],
    start_in_insert = true,
    close_on_exit = true,
    shell = vim.o.shell,
  },
  config = function()
    require("toggleterm").setup()

    -- Gán phím tắt trong terminal mode (Alt+q để thoát terminal)
    function _G.set_terminal_keymaps()
      local opts = { noremap = true, silent = true }
      -- Thoát terminal mode bằng Alt+q
      vim.api.nvim_buf_set_keymap(0, "t", "<A-q>", [[<C-\><C-n><cmd>q!<CR>]], opts)
      -- Thoát cửa sổ terminal (dạng vertical split) bằng <leader>tq
      vim.api.nvim_buf_set_keymap(0, "t", "<A-1", [[<C-\><C-n><cmd>q<CR>]], opts)
    end

    vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

    -- Phím tắt mở terminal dạng vertical split (không liên quan toggleterm)
    vim.api.nvim_set_keymap("n", "<leader>vt", ":vsplit | terminal<CR>", { noremap = true, silent = true })
  end,
}

-- return {
--   'akinsho/toggleterm.nvim',
--   version = "*",
--   opts = {
--     size = 15,
--     direction = "horizontal",
--     open_mapping = [[<C-\>]],
--     start_in_insert = true,
--     close_on_exit = true,
--     shell = vim.o.shell,
--   },
--   config = function()
--     require("toggleterm").setup()
--     -- Gán phím tắt trong terminal mode (Alt+q để thoát)
--     function _G.set_terminal_keymaps()
--       local opts = { noremap = true, silent = true }
--       vim.api.nvim_buf_set_keymap(0, "t", "<A-q>", [[<C-\><C-n><cmd>q!<CR>]], opts)
--     end
--     vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")
--   end,
-- }
