local ai = require("mini.ai")

ai.setup({
	n_lines = 600,

	custom_textobjects = {
		o = ai.gen_spec.treesitter({
			a = { "@block.outer", "@conditional.outer", "@loop.outer" },
			i = { "@block.inner", "@conditional.inner", "@loop.inner" },
		}),
		f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }),
		c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),
		t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" }, -- tags
		d = { "%f[%d]%d+" }, -- digits
		e = { -- Word with case
			{
				"%u[%l%d]+%f[^%l%d]",
				"%f[%S][%l%d]+%f[^%l%d]",
				"%f[%P][%l%d]+%f[^%l%d]",
				"^[%l%d]+%f[^%l%d]",
			},
			"^().*()$",
		},
		g = function(ai_type)
			local start_line, end_line = 1, vim.fn.line("$")
			if ai_type == "i" then
				local first_nonblank = vim.fn.nextnonblank(start_line)
				local last_nonblank = vim.fn.prevnonblank(end_line)
				if first_nonblank == 0 or last_nonblank == 0 then
					return {
						{ from = { line = start_line, col = 1 }, to = { line = start_line, col = 1 } },
					}
				end
				start_line, end_line = first_nonblank, last_nonblank
			end
			local to_col = math.max(vim.fn.getline(end_line):len(), 1)
			return {
				{
					from = { line = start_line, col = 1 },
					to = { line = end_line, col = to_col },
				},
			}
		end,
		u = ai.gen_spec.function_call(), -- u for "Usage"
		U = ai.gen_spec.function_call({ name_pattern = "[%w_]" }),
	},
})
