return {
  "nvim-treesitter/nvim-treesitter",
  lazy = false,        -- required: plugin does not support lazy-loading
  build = ":TSUpdate",
  config = function()
    local ts = require("nvim-treesitter")

    ts.setup({
      -- optional; default is fine too
      install_dir = vim.fn.stdpath("data") .. "/site",
    })

    -- install parsers (async; no-op if already installed)
    ts.install({ "lua", "python" })

    -- start treesitter for buffers automatically (highlighting, etc.)
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "python" },
      callback = function()
        pcall(vim.treesitter.start)
      end,
    })
  end,
}
