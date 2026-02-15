local utils = require("utils")

local function tmap(mode, input, t_cmd, desc, opts)
    local cmd = '<cmd>Telescope ' .. t_cmd .. '<CR>'
    utils.map(mode, input, cmd, desc, opts)
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
    end
}

