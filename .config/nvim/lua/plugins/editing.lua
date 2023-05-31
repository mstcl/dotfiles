return {
    {
        "echasnovski/mini.cursorword",
        event = "CursorMoved",
        version = false,
        config = function()
            require("mini.cursorword").setup()
        end,
    },
    {
        "b3nj5m1n/kommentary",
        lazy = true,
        event = "CursorMoved",
        config = function()
            require("configs.comment")
        end,
    },
    {
        "max397574/better-escape.nvim",
        lazy = true,
        event = "InsertEnter",
        config = function()
            require("configs.escape")
        end,
    },
    --[[ {
        "LunarWatcher/auto-pairs",
        lazy = true,
        event = "InsertEnter",
        config = function()
            require("configs.autopairs")
        end,
    }, ]]
    {
        "windwp/nvim-autopairs",
        config = function()
            require("nvim-autopairs").setup({})
        end,
    },
    {
        "echasnovski/mini.align",
        version = false,
        event = "VeryLazy",
        lazy = true,
        config = function()
            require("mini.align").setup()
        end,
    },
    {
        "echasnovski/mini.map",
        ft = { "python", "tex", "lua", "markdown", "md" },
        version = false,
        config = function()
            require("configs.map")
            vim.cmd("lua MiniMap.toggle()")
        end,
    },
    --[[ {
		"mbbill/undotree",
		lazy = true,
		cmd = "UndotreeToggle",
		config = function()
			require("configs.undotree")
		end,
	}, ]]
    {
        "ur4ltz/surround.nvim",
        lazy = true,
        keys = {
            { "s", mode = { "n", "v" } },
            { "c", mode = { "n", "v" } },
            { "d", mode = { "n", "v" } },
        },
        config = function()
            require("surround").setup({
                mappings_style = "surround",
                space_on_alias = false,
                space_on_closing_char = false,
            })
        end,
    },
    {
        "tversteeg/registers.nvim",
        lazy = true,
        cmd = "Registers",
        keys = {
            { '"',     mode = { "n", "v" } },
            { "<C-R>", mode = "i" },
        },
        config = function()
            require("configs.registers")
        end,
    },
    {
        "godlygeek/tabular",
        lazy = true,
        dependencies = { "vim-markdown" },
        -- ft = {"markdown"},
    },
    {
        "chentoast/marks.nvim",
        lazy = true,
        ft = "markdown",
        config = function()
            require("configs.marks")
        end,
    },
    {
        "nmac427/guess-indent.nvim",
        lazy = true,
        event = "BufRead",
        config = function()
            require("guess-indent").setup {
                auto_cmd = true,
                override_editorconfig = true
            }
        end,
    },
    --[[ {
		"tzachar/local-highlight.nvim",
		lazy = true,
		ft = { "python", "cpp", "lua", "bash", "sh" },
		config = function()
			require("local-highlight").setup({
				file_types = { "python", "cpp", "lua", "bash", "sh" },
				hlgroup = "LocalHighlight",
				cw_hlgroup = "LocalHighlight",
			})
		end,
	}, ]]
    {
        "gbprod/stay-in-place.nvim",
        lazy = true,
        event = "CursorMoved",
        config = function()
            require("stay-in-place").setup({})
        end,
    },
    --[[ {
		"toppair/peek.nvim",
		build = "deno task --quiet build:fast",
		lazy = true,
		ft = "markdown",
		config = function()
			require("peek").setup({
				theme = "light",
				app = { "chromium", "--new-window" },
			})
		end,
	}, ]]
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreview", "MarkdownPreviewStop" },
        build = function()
            vim.fn["mkdp#util#install"]()
        end,
        ft = { "markdown" },
        lazy = true,
        config = function()
            require("configs.mdpreview")
        end,
    },
    {
        "fedepujol/move.nvim",
        lazy = true,
        event = "CursorMoved",
    },
    {
        "dimfeld/section-wordcount.nvim",
        lazy = true,
        ft = { "markdown" },
        config = function()
            require("section-wordcount").setup({
                -- These are the default values and can be omitted
                highlight = "NonText",
                virt_text_pos = "eol",
            })
        end,
    },
}
