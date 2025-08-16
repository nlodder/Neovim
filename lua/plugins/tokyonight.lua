return {
    "folke/tokyonight.nvim",
    lazy = false,          -- load on startup
    priority = 1000,       -- load before other plugins
    config = function()
        require("tokyonight").setup({
            style = "night", -- options: storm, night, day, moon
        })
       vim.cmd.colorscheme("tokyonight")
    end
}

