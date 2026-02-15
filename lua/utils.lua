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


return M

