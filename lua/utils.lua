local M = {}

local function expand_modes(modes_str)
    local modes = {}
    for m in string.gmatch(modes_str, '.') do
        table.insert(modes, m)
    end
    return modes
end

function M.map(modes, input, output, desc, opts)
    opts = opts or {}
    opts.desc = desc
    modes = expand_modes(modes)
    vim.keymap.set(modes, input, output, opts)
end

function M.cmd(command)
    return "<cmd>" .. command .. "<CR>"
end


function M.git_available()
  if vim.fn.executable("git") == 0 then
    return false, "git not in path!"
  end

  local git_dir = vim.fn.system("git rev-parse --is-inside-work-tree 2>/dev/null")

  if vim.v.shell_error ~= 0 then
    return false, "not in git repo!"
  else
    return true, nil
  end
end


return M

