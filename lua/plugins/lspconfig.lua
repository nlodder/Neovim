return {
  "neovim/nvim-lspconfig",

  config = function()
    local lspconfig = require("lspconfig")
    local capabilities = require("cmp_nvim_lsp").default_capabilities()

    -- Clangd Setup
    lspconfig.clangd.setup {
      cmd = {
        "clangd",
        "--background-index",
        "--clang-tidy",
        "--header-insertion=iwyu",
        "--completion-style=detailed",
        "--function-arg-placeholders",
        "--fallback-style=llvm",
        "--compile-commands-dir=."
      },
      keys = {
        { "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch Source/Header (C/C++)" },
      },
      root_dir = function(fname)
        return require("lspconfig.util").root_pattern(
          "Makefile",
          "configure.ac",
          "configure.in",
          "config.h.in",
          "meson.build",
          "meson_options.txt",
          "build.ninja"
        )(fname) or require("lspconfig.util").root_pattern("compile_commands.json", "compile_flags.txt")(
          fname
        ) or require("lspconfig.util").find_git_ancestor(fname)
      end,
      capabilities = vim.tbl_deep_extend("force", capabilities, {
        offsetEncoding = { "utf-16" }
      }),
      init_options = {
        usePlaceholders = true,
        completeUnimported = true,
        clangdFileStatus = true,
      },
    }

    -- Lua LS Setup
    lspconfig.lua_ls.setup {
      capabilities = capabilities,
      on_init = function(client)
        if client.workspace_folders then
          local path = client.workspace_folders[1].name
          if path ~= vim.fn.stdpath('config') and
              (vim.loop.fs_stat(path .. '/.luarc.json') or vim.loop.fs_stat(path .. '/.luarc.jsonc')) then
            return
          end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
          runtime = { version = 'LuaJIT' },
          workspace = {
            checkThirdParty = false,
            library = { vim.env.VIMRUNTIME }
          }
        })
      end,
      settings = {
        Lua = {}
      },
    }

    -- Pyright Setup for Python
    lspconfig.pyright.setup {
      capabilities = capabilities,
      settings = {
        python = {
          pythonPath = vim.fn.exepath("python3"),
        },
      },
    }

    -- HTML LSP Setup
    lspconfig.html.setup {
      capabilities = capabilities,
    }

    -- CSS LSP Setup
    lspconfig.cssls.setup {
      capabilities = capabilities,
    }

    -- JSON LSP Setup
    lspconfig.jsonls.setup {
      capabilities = capabilities,
    }
  end
}

