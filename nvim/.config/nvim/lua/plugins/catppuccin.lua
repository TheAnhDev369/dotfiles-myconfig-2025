return {
    {
      "catppuccin/nvim",
      name = "catppuccin",
      lazy = false,
      priority = 1000,
      config = function()
        require("catppuccin").setup({
          flavour = "mocha", -- latte, frappe, macchiato, mocha
          transparent_background = false,
          integrations = {
            telescope = true,
            which_key = true,
            cmp = true,
            gitsigns = true,
            treesitter = true,
            notify = true,
            mini = true,
            native_lsp = {
              enabled = true,
              underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
              },
            },
          },
        })
        vim.cmd.colorscheme("catppuccin")
      end,
    },
  }
  