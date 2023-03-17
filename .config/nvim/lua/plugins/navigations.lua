return {
    --[[ {
        "kyazdani42/nvim-tree.lua",
        lazy = true,
        cmd = "NvimTreeToggle",
        config = function()
            require("configs.tree")
        end,
    }, ]]
    --[[ {
		"prochri/telescope-all-recent.nvim",
		lazy = true,
		dependencies = "nvim-telescope/telescope.nvim",
		cmd = "Telescope",
		config = function()
			require 'telescope-all-recent'.setup()
		end
	}, ]]
    {
        "nvim-telescope/telescope.nvim",
        lazy = true,
        cmd = "Telescope",
        config = function()
            require("configs.telescope")
        end,
        dependencies = {
            "nvim-telescope/telescope-dap.nvim",
            "tsakirist/telescope-lazy.nvim",
            "debugloop/telescope-undo.nvim",
            -- "nvim-telescope/telescope-fzf-writer.nvim",
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope-file-browser.nvim",
            {
                "nvim-telescope/telescope-fzf-native.nvim",
                build = "make",
            },
            "jvgrootveld/telescope-zoxide",
            {
                "rudism/telescope-dict.nvim",
                ft = { "markdown", "tex" },
            },
            {
                "nvim-telescope/telescope-frecency.nvim",
                dependencies = { "kkharji/sqlite.lua" },
            },
        },
    },
}
