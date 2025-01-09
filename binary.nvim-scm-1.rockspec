rockspec_format = "3.0"
package = "binary.nvim"
version = "scm-1"
source = {
	url = "git+https://github.com/jackplus-xyz/binary.nvim",
}
description = "A minmal Neovim colorscheme using only two colors for a plain text editor experience."
license = "MIT"
dependencies = {
	-- Add runtime dependencies here
	-- e.g. "plenary.nvim",
	"lua >= 5.1",
}
test_dependencies = {
	"nlua",
}
build = {
	type = "builtin",
	copy_directories = {
		-- Add runtimepath directories, like
		-- 'plugin', 'ftplugin', 'doc'
		-- here. DO NOT add 'lua' or 'lib'.
	},
}
