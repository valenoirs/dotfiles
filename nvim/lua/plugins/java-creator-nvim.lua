return {
	"alessio-vivaldelli/java-creator-nvim",
	ft = "java",
	opts = {
		keymaps = {
			java_new = "<leader>Jn",
			java_class = "<leader>Jc",
			java_interface = "<leader>Ji",
			java_enum = "<leader>Je",
			java_record = "<leader>Jr",
		},
		options = {
			auto_open = true, -- open file after creation
			java_version = 17, -- minimum Java version
		},
	},
}
