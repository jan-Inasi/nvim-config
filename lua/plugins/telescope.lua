local utils = require("utils")
local map = utils.map

local function tmap(mode, input, t_cmd, desc, opts)
    local cmd = '<cmd>Telescope ' .. t_cmd .. '<CR>'
    map(mode, input, cmd, desc, opts)
end


local function wrap_git(fn) 
    return function()
        local git_available, info = utils.git_available()
        if git_available then
            fn()
        else
            vim.notify(info, vim.log.levels.WARN)
        end
    end
end

return {
    'nvim-telescope/telescope.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
        tmap('n', '<leader>ff', 'find_files', 'find files')
        tmap('n', '<leader>fg', 'live_grep', 'live grep')
        tmap('n', '<leader>fb', 'buffers', 'telescope buffers')
        tmap('n', '<leader>fo', 'oldfiles', 'telescope old files')
        tmap('n', '<leader>fm', 'marks', 'telescope marks')

        local tbi = require("telescope.builtin")

        map('n', '<leader>gc', wrap_git(tbi.git_commits), 'git commits')
        map('n', '<leader>gb', wrap_git(tbi.git_branches), 'git branches')
        map('n', '<leader>gs', wrap_git(tbi.git_status), 'git status')
        map('n', '<leader>gt', wrap_git(tbi.git_stash), 'git stash')
    end
}

