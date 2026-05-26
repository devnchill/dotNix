vim.lsp.config["jdtls"] = {
	cmd = { "jdtls" },
	filetypes = { "java" },
	root_markers = { ".git", "mvnw", "gradlew", "pom.xml", "build.gradle" },
}

vim.lsp.enable("jdtls")
