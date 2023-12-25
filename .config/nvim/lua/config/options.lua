-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

local os = vim.loop.os_uname().sysname

-- I don't use a real Linux machine for now so... Linux should be Windows WSL
if os == "Linux" then
  vim.g.clipboard = {
    name = "WslClipboard",
    copy = {
      ["+"] = "clip.exe",
      ["*"] = "clip.exe",
    },
    paste = {
      ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('', ''))",
      ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace('', ''))",
    },
    cache_enabled = true,
  }
end
