return {
  {
    "neovim/nvim-lspconfig",
    ft = "python",
    config = function()
      local lspconfig = require("lspconfig")
      lspconfig.pyright.setup({})
    end
  },
  {
    "psf/black",
    ft = "python",
    config = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function()
          vim.cmd("Black")
        end,
      })
    end
  },
  {
    "mfussenegger/nvim-lint",
    ft = "python",
    config = function()
      local lint = require("lint")
      lint.linters_by_ft = { python = { "ruff" } }
      vim.api.nvim_create_autocmd({ "BufWritePost", "BufEnter" }, {
        pattern = "*.py",
        callback = function() lint.try_lint() end
      })
    end
  },
  {
    "PyCQA/isort",
    ft = "python",
    config = function()
      vim.api.nvim_create_autocmd("BufWritePre", {
        pattern = "*.py",
        callback = function()
          vim.cmd("!isort %")
        end
      })
    end
  }
}

