require "nvchad.options"

-- Enable cursorline!
local o = vim.o
o.cursorlineopt ='both'

vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ['+'] = "clip.exe",
    ['*'] = "clip.exe",
  },
  paste = {
    ['+'] = function()
      local output = vim.fn.system("powershell.exe -c Get-Clipboard")
      return output:gsub("\r$", "")
    end,
    ['*'] = function()
      local output = vim.fn.system("powershell.exe -c Get-Clipboard")
      return output:gsub("\r$", "")
    end,
  },
  cache_enabled = 0,
}

-- Disable inline diagnostics and enable floating windows
vim.diagnostic.config({
  virtual_text = false,    -- Disable inline text (warnings, errors, etc.)
  float = {
    severity_sort = true,  -- Sort by severity: errors first, then warnings
    border = 'rounded',    -- Style of the floating window border
    source = true,     -- Always show the source (e.g., LSP server name)
    header = '',           -- Optional header text (can be set to an empty string)
    prefix = '●',          -- Prefix for the diagnostic message (e.g., '●', '>>', etc.)
  },
})
