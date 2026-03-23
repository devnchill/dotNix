vim.keymap.set("n", "<F5>", function()
	vim.fn.mkdir("/tmp/dsa_binaries", "p")

	local file = vim.fn.expand("%:p")
	local output = "/tmp/dsa_binaries/" .. vim.fn.expand("%:t:r")

	vim.opt_local.makeprg = "g++ -g -std=c++17 -Wall -Wextra -o " .. output .. " " .. file

	vim.cmd("compiler gcc")
	vim.cmd("silent make | redraw!")

	local qf = vim.fn.getqflist()
	if #qf > 0 then
		vim.cmd("copen")
		vim.cmd("cc")
		return
	end

	vim.cmd("cclose")

	print("Compiled successfully")

	if vim.fn.executable(output) == 1 then
		vim.cmd("terminal " .. output)
	else
		print("Binary not found")
	end
end, { buffer = true })
