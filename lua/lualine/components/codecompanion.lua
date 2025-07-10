local M = require("lualine.component"):extend()

local default_options = {
	icon = " ",
	spinner_symbols = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
	done_symbol = "✓",
}

function M:init(options)
	M.super.init(self, options)

	self.options = vim.tbl_deep_extend("keep", self.options or {}, default_options)
	self.n_requests = 0
	self.spinner_index = 0

	vim.api.nvim_create_autocmd("User", {
		pattern = "CodeCompanionRequestStarted",
		callback = function()
			self.n_requests = self.n_requests + 1
		end,
	})

	vim.api.nvim_create_autocmd("User", {
		pattern = "CodeCompanionRequestFinished",
		callback = function()
			self.n_requests = self.n_requests - 1
		end,
	})
end

function M:update_status()
	if not package.loaded["codecompanion"] then
		return nil
	end

	local symbol = nil
	if self.n_requests > 0 then
		self.spinner_index = (self.spinner_index % #self.options.spinner_symbols) + 1
		symbol = self.options.spinner_symbols[self.spinner_index]
	else
		symbol = self.options.done_symbol
		self.spinner_index = 0
	end
	return ("%d %s"):format(self.n_requests, symbol)
end

return M
