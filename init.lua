-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

local null_ls = require("null-ls")

local google_java_format = {
  method = null_ls.methods.FORMATTING,
  filetypes = { "java" },
  generator = {
    command = "google-java-format",
    args = { "--replace", "$FILENAME" },
    to_stdin = true,
    format = "raw",
    fn = function(params)
      local diagnostics = {}
      -- sources have access to a params object
      -- containing info about the current file and editor state
      for i, line in ipairs(params.content) do
        local col, end_col = line:find("really")
        if col and end_col then
          -- null-ls fills in undefined positions
          -- and converts source diagnostics into the required format
          table.insert(diagnostics, {
            row = i,
            col = col,
            end_col = end_col + 1,
            source = "no-really",
            message = "Don't use 'really!'",
            severity = vim.diagnostic.severity.WARN,
          })
        end
      end
      return diagnostics
    end,
  },
}

null_ls.register(google_java_format)
