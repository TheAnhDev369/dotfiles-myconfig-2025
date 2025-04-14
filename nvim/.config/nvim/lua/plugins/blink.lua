---@module "lazy"
---@type LazySpec
return {
	"saghen/blink.cmp",
	dependencies = "rafamadriz/friendly-snippets",
	version = "*",
	event = { "InsertEnter", "CmdlineEnter" },

	---@module 'blink.cmp'
	---@type blink.cmp.Config
	opts = {
		appearance = {
			use_nvim_cmp_as_default = false,
			nerd_font_variant = "mono",
		},
		completion = {
			ghost_text = { enabled = true },
			accept = { auto_brackets = { enabled = true } },
			documentation = {
				auto_show = true,
				auto_show_delay_ms = 250,
				update_delay_ms = 50,
				treesitter_highlighting = true,
				window = { border = "rounded" },
			},
			list = {
				selection = {
					preselect = false,
					auto_insert = false,
				},
			},
			menu = {
				auto_show = function(ctx)
					return vim.fn.getcmdtype() == ":"
					-- enable for inputs as well, with:
					-- or vim.fn.getcmdtype() == '@'
				end,
				border = "rounded",
				draw = {
					columns = {
						{ "label", "label_description", gap = 1 },
						{ "kind_icon", "kind" },
					},
					treesitter = { "lsp" },
				},
			},
		},

		-- My super-TAB configuration
		keymap = {
			["<C-space>"] = { "show", "show_documentation", "hide_documentation" },
			["<C-e>"] = { "hide", "fallback" },
			["<CR>"] = { "accept", "fallback" },
			["<Tab>"] = {
				function(cmp)
					if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
						return cmp.accept()
					end
				end,
				"show_and_insert",
				"select_next",
			},
			["<S-Tab>"] = {
				function(cmp)
					return cmp.select_prev()
				end,
				"snippet_backward",
				"fallback",
			},
			["<Up>"] = { "select_prev", "fallback" },
			["<Down>"] = { "select_next", "fallback" },
			["<C-p>"] = { "select_prev", "fallback" },
			["<C-n>"] = { "select_next", "fallback" },
			["<C-up>"] = { "scroll_documentation_up", "fallback" },
			["<C-down>"] = { "scroll_documentation_down", "fallback" },
		},

		-- Experimental signature help support
		signature = {
			enabled = true,
			window = { border = "rounded" },
		},

		sources = {
			default = { "lazydev", "lsp", "path", "snippets", "buffer", "cmdline" },
			providers = {
				lazydev = {
					name = "LazyDev",
					module = "lazydev.integrations.blink",
					-- Make lazydev completions top priority (see `:h blink.cmp`)
					score_offset = 100,
				},
				lsp = {
					min_keyword_length = 0, -- Number of characters to trigger provider
					score_offset = 0, -- Boost/penalize the score of the items
				},
				path = {
					min_keyword_length = 0,
				},
				snippets = {
					min_keyword_length = 2,
				},
				buffer = {
					min_keyword_length = 4,
					max_items = 5,
				},
				cmdline = {
					min_keyword_length = function(ctx)
						-- when typing a command, only show when the keyword is 3 characters or longer
						if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
							return 3
						end
						return 0
					end,
				},
			},
		},
	},
}

--  Prompted by Me and render code,comment by ChatGPT
-- ---@module "lazy"
-- ---@type LazySpec
-- return {
--     "saghen/blink.cmp",  -- Đây là tên plugin mà bạn đang sử dụng, bao gồm tên tác giả và tên plugin.
--     dependencies = "rafamadriz/friendly-snippets", -- Plugin này phụ thuộc vào "friendly-snippets", giúp bạn sử dụng các đoạn mã nhanh.
--     version = "*", -- Chỉ định plugin sử dụng bất kỳ phiên bản nào của "blink.cmp".
--     event = { "InsertEnter", "CmdlineEnter" }, -- Plugin này sẽ được tải khi bạn vào chế độ "Insert" hoặc "Cmdline".

--     -- Phần cấu hình của plugin 'blink.cmp'
--     opts = {
--         appearance = {
--             use_nvim_cmp_as_default = false,  -- Sử dụng nvim-cmp làm công cụ hoàn thành mặc định hay không.
--             nerd_font_variant = "mono", -- Sử dụng variant phông chữ "mono" trong Nerd Fonts.
--         },
--         completion = {
--             ghost_text = { enabled = true },  -- Hiển thị văn bản ma (ghost text) trong phần gợi ý hoàn thành.
--             accept = { auto_brackets = { enabled = true } },  -- Tự động chèn dấu ngoặc khi chọn một gợi ý.
--             documentation = {
--                 auto_show = true,  -- Tự động hiển thị tài liệu khi bạn di chuyển chuột hoặc chọn một phần gợi ý.
--                 auto_show_delay_ms = 250,  -- Thời gian trì hoãn trước khi tài liệu hiển thị.
--                 update_delay_ms = 50,  -- Thời gian cập nhật tài liệu khi di chuyển con trỏ.
--                 treesitter_highlighting = true,  -- Kích hoạt làm nổi bật cú pháp với Treesitter trong tài liệu.
--                 window = { border = "rounded" },  -- Đặt cửa sổ tài liệu có viền bo tròn.
--             },
--             list = {
--                 selection = {
--                     preselect = false,  -- Không chọn mặc định khi hiển thị gợi ý.
--                     auto_insert = false,  -- Không tự động chèn gợi ý khi chọn.
--                 },
--             },
--             menu = {
--                 auto_show = function(ctx)
--                     return vim.fn.getcmdtype() == ":"  -- Hiển thị menu tự động khi bạn nhập lệnh.
--                 end,
--                 border = "rounded",  -- Cửa sổ menu có viền bo tròn.
--                 draw = {
--                     columns = {
--                         { "label", "label_description", gap = 1 },  -- Hiển thị nhãn và mô tả của gợi ý.
--                         { "kind_icon", "kind" },  -- Hiển thị biểu tượng loại gợi ý.
--                     },
--                     treesitter = { "lsp" },  -- Sử dụng Treesitter cho các loại gợi ý từ LSP.
--                 },
--             },
--         },

--         -- Cấu hình các phím tắt cho việc hoàn thành và điều khiển.
--         keymap = {
--             ["<C-space>"] = { "show", "show_documentation", "hide_documentation" },  -- Hiển thị/ẩn gợi ý và tài liệu.
--             ["<C-e>"] = { "hide", "fallback" },  -- Ẩn gợi ý.
--             ["<CR>"] = { "accept", "fallback" },  -- Chấp nhận gợi ý.
--             ["<Tab>"] = {
--                 function(cmp)
--                     if cmp.is_ghost_text_visible() and not cmp.is_menu_visible() then
--                         return cmp.accept()  -- Nếu văn bản ma đang hiển thị và menu không hiển thị, chấp nhận gợi ý.
--                     end
--                 end,
--                 "show_and_insert",  -- Hiển thị và chèn gợi ý.
--                 "select_next",  -- Chọn gợi ý tiếp theo.
--             },
--             ["<S-Tab>"] = {
--                 function(cmp)
--                     return cmp.select_prev()  -- Chọn gợi ý trước đó.
--                 end,
--                 "snippet_backward",  -- Quay lại đoạn mã trước đó.
--                 "fallback",  -- Nếu không có gì, quay lại trạng thái trước đó.
--             },
--             ["<Up>"] = { "select_prev", "fallback" },  -- Chọn gợi ý trước đó.
--             ["<Down>"] = { "select_next", "fallback" },  -- Chọn gợi ý tiếp theo.
--             ["<C-p>"] = { "select_prev", "fallback" },  -- Chọn gợi ý trước đó bằng phím tắt Ctrl+P.
--             ["<C-n>"] = { "select_next", "fallback" },  -- Chọn gợi ý tiếp theo bằng phím tắt Ctrl+N.
--             ["<C-up>"] = { "scroll_documentation_up", "fallback" },  -- Cuộn tài liệu lên.
--             ["<C-down>"] = { "scroll_documentation_down", "fallback" },  -- Cuộn tài liệu xuống.
--         },

--         -- Cấu hình cho hỗ trợ giúp đỡ chữ ký (signature).
--         signature = {
--             enabled = true,  -- Bật hỗ trợ chữ ký.
--             window = { border = "rounded" },  -- Cửa sổ chữ ký có viền bo tròn.
--         },

--         -- Các nguồn dữ liệu cho plugin này.
--         sources = {
--             default = { "lazydev", "lsp", "path", "snippets", "buffer", "cmdline" },  -- Các nguồn hoàn thành mặc định.
--             providers = {
--                 lazydev = {
--                     name = "LazyDev",
--                     module = "lazydev.integrations.blink",  -- Sử dụng module từ LazyDev.
--                     score_offset = 100,  -- Tăng điểm của LazyDev để nó có ưu tiên cao hơn khi hoàn thành.
--                 },
--                 lsp = {
--                     min_keyword_length = 0,  -- Sử dụng các từ khóa có độ dài tối thiểu là 0.
--                     score_offset = 0,  -- Không thay đổi điểm số của LSP.
--                 },
--                 path = {
--                     min_keyword_length = 0,  -- Sử dụng từ khóa có độ dài tối thiểu là 0 cho đường dẫn.
--                 },
--                 snippets = {
--                     min_keyword_length = 2,  -- Sử dụng từ khóa có độ dài tối thiểu là 2 cho đoạn mã.
--                 },
--                 buffer = {
--                     min_keyword_length = 4,  -- Sử dụng từ khóa có độ dài tối thiểu là 4 cho bộ đệm.
--                     max_items = 5,  -- Giới hạn số lượng gợi ý từ bộ đệm là 5.
--                 },
--                 cmdline = {
--                     min_keyword_length = function(ctx)
--                         if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
--                             return 3  -- Khi nhập lệnh, chỉ hiển thị gợi ý nếu từ khóa dài ít nhất 3 ký tự.
--                         end
--                         return 0  -- Nếu không, không yêu cầu độ dài tối thiểu.
--                     end,
--                 },
--             },
--         },
--     },
-- }
