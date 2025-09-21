Snacks = Snacks

return {
	{
		"folke/snacks.nvim",
		priority = 1000,
		lazy = false,
		opts = {
			bigfile = { enabled = true },
			bufdelete = { enabled = true },
			dashboard = { enabled = false },
      treminal = { enabled = true },
			explorer = { enabled = true },
			indent = { enabled = true },
			input = { enabled = SyHoMadaraVim.minimal_mode == false },
			notifier = {
				enabled = SyHoMadaraVim.minimal_mode == false,
				notification_history = {
					border = SyHoMadaraVim.ui.float.border or "rounded",
					zindex = 100,
					minimal = false,
					title = " Notification History ",
					title_pos = "center",
					ft = "markdown",
					bo = { filetype = "snacks_notif_history", modifiable = false },
					wo = { winhighlight = "Normal:SnacksNotifierHistory" },
					keys = { q = "close" },
				},
			},
			picker = {
				enabled = true,
				explorer = {
					opts = {
						win = {
							list = {
								keys = {
									["<c-]>"] = "explorer_cd",
								},
							},
						},
					},
				},
				previewers = {
					git = {
						native = true, -- use native (terminal) or Neovim for previewing git diffs and commits
					},
				},
				win = {
					-- input window
					input = {
						keys = {
							["<Esc>"] = { "close", mode = { "n", "i" } },
							["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
							["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
							["<c-b>"] = { "list_scroll_up", mode = { "i", "n" } },
							["<c-f>"] = { "list_scroll_down", mode = { "i", "n" } },
						},
					},
				},
			},
			quickfile = { enabled = false },
			scroll = { enabled = false },
			statuscolumn = {
				enabled = true,
			},
			words = { enabled = false },
		},
		keys = {
      -- ╭─────────────────────────────────────────────────────────╮
			-- │ Terminal                                                 │
			-- ╰─────────────────────────────────────────────────────────╯
      {
        "<M-h>",
        function()
          Snacks.terminal.toggle()
        end,
        desc = "Toggle Terminal",
      },
      --  ╭─────────────────────────────────────────────────────────╮
			-- ╭─────────────────────────────────────────────────────────╮
			-- │ Lazygit                                                 │
			-- ╰─────────────────────────────────────────────────────────╯
			{
				"<leader>lg",
				function()
					Snacks.lazygit()
				end,
				desc = "Lazygit",
			},
			{
				"<leader>lga",
				function()
					Snacks.lazygit.log()
				end,
				desc = "Lazygit Log (cwd)",
			},
			{
				"<leader>llc",
				function()
					Snacks.lazygit.log_file()
				end,
				desc = "Lazygit Current File History",
			},
			-- ╭─────────────────────────────────────────────────────────╮
			-- │ Zen                                                     │
			-- ╰─────────────────────────────────────────────────────────╯
			{
				"<leader>z",
				function()
					Snacks.zen({ win = { width = 200 } })
				end,
				desc = "Zen Mode",
			},
			{
				"<leader>Z",
				function()
					Snacks.zen.zoom()
				end,
				desc = "Zoom Mode",
			},
			-- ╭─────────────────────────────────────────────────────────╮
			-- │ Picker                                                  │
			-- ╰─────────────────────────────────────────────────────────╯
			{
				"<C-n>",

				function()
					Snacks.picker.explorer()
				end,
				desc = "explorer",
			},
			{
				"<leader>ff",
				function()
					Snacks.picker.smart()
				end,
				desc = "smart files",
			},
			{
				"<leader>fw",
				function()
					Snacks.picker.grep()
				end,
				desc = "grep",
			},
			{
				"<leader>fs",
				function()
					Snacks.picker.grep_word()
				end,
				desc = "grep selected",
				mode = { "n", "v" },
			},

			{
				"<leader>pl",
				function()
					Snacks.picker.projects()
				end,
				desc = "projects list",
			},

			{
				"<leader>cd",
				function()
					Snacks.picker.diagnostics()
				end,
				desc = "diagnostics",
			},

			{
				"<leader>sf",
				function()
					Snacks.picker.files()
				end,
				desc = "files",
			},
			{
				"<leader>sb",
				function()
					Snacks.picker.buffers()
				end,
				desc = "buffers",
			},
			{
				"<leader>sh",
				function()
					Snacks.picker.recent()
				end,
				desc = "recent files",
			},
			{
				"<leader>sH",
				function()
					Snacks.picker.command_history()
				end,
				desc = "command history",
			},
			{
				"<leader>ss",
				function()
					Snacks.picker.search_history()
				end,
				desc = "search history",
			},
			{
				"<leader>sq",
				function()
					Snacks.picker.qflist()
				end,
				desc = "quickfix list",
			},
			{
				"<leader>sc",
				function()
					Snacks.picker.colorschemes()
				end,
				desc = "color schemes",
			},
			{
				"<leader>sd",
				function()
					Snacks.picker.files({ cwd = vim.fn.stdpath("config") })
				end,
				desc = "dotfiles",
			},
      -- ╭─────────────────────────────────────────────────────────╮
			-- │ Git                                                     │
			-- ╰─────────────────────────────────────────────────────────╯
			{
				"<leader>gf",
				function()
					Snacks.picker.git_files()
				end,
				desc = "git files",
			},
			{
				"<leader>gs",
				function()
					Snacks.picker.git_status()
				end,
				desc = "git status",
			},
			{
				"<leader>glA",
				function()
					Snacks.picker.git_log()
				end,
				desc = "log",
			},
			{
				"<leader>glC",
				function()
					Snacks.picker.git_log_file()
				end,
				desc = "file commits",
			},

			-- ╭─────────────────────────────────────────────────────────╮
			-- │ Notifier                                                │
			-- ╰─────────────────────────────────────────────────────────╯

			{
				"<leader>hn",
				function()
					Snacks.notifier.show_history(Snacks.notifier.notification_history)
				end,
				desc = "Show Notification History",
			},
		},
	},
}
