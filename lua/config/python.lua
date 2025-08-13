-- Auto-detect Python venv or fallback to system Python
local venv_path = os.getenv("VIRTUAL_ENV")
if venv_path then
  vim.g.python3_host_prog = venv_path .. "/bin/python"
else
  vim.g.python3_host_prog = '/usr/local/bin/python3'
end

