-- Auto-detect Python venv or fallback to system Python
local venv_path = os.getenv("VIRTUAL_ENV")
if venv_path and vim.fn.filereadable(venv_path.."/bin/python") == 1 then
  vim.g.python3_host_prog = venv_path .. "/bin/python"
else
  vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
end

