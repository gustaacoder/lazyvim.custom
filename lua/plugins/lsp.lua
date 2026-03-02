return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        phpactor = { enabled = false },
        intelephense = {
          settings = {
            intelephense = {
              diagnostics = {
                enable = true,
                undefinedClassDeclarations = true,
                undefinedFunctions = true,
                undefinedConstants = true,
                undefinedProperties = true,
                undefinedTypes = true,
              },
              completion = {
                insertUseDeclaration = true,
              },
              files = {
                maxSize = 5000000,
              },

              stubs = {
                "composer",
                "spl",
                "core",
                "apache",
                "bcmath",
                "bzip2",
                "calendar",
                "ctype",
                "curl",
                "date",
                "dba",
                "dom",
                "enchant",
                "mbstring",
                "fileinfo",
                "filter",
                "ftp",
                "gd",
                "gettext",
                "gmp",
                "hash",
                "iconv",
                "imap",
                "intl",
                "json",
                "ldap",
                "libxml",
                "openssl",
                "pcntl",
                "pcre",
                "pdo",
                "phar",
                "posix",
                "pspell",
                "readline",
                "реcode",
                "session",
                "shmop",
                "simplexml",
                "snmp",
                "soap",
                "sockets",
                "sodium",
                "sqlite3",
                "standard",
                "sysvmsg",
                "sysvsem",
                "sysvshm",
                "tidy",
                "tokenizer",
                "xml",
                "xmlreader",
                "xmlrpc",
                "xmlwriter",
                "xsl",
                "zip",
                "zlib",
                "laravel",
                "eloquent",
                "phpstorm-stubs",
              },
            },
          },
        },
      },
    },

    config = function(_, opts)
      vim.diagnostic.config({
        virtual_text = {
          spacing = 4,
          severity_enum = { "error", "warn", "info", "hint" },
          source = "always",
        },
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "✖",
            [vim.diagnostic.severity.WARN] = "⚠",
            [vim.diagnostic.severity.HINT] = "•",
          },

          numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
          },
        },

        update_in_insert = true,
        float = {
          focusable = false,
          style = "minimal",
          border = "rounded",
          source = "always",
          header = "",
          prefix = "",
        },
      })
      local lspconfig = require("lspconfig")
      local util = require("lspconfig.util")
      local intelephense_opts = opts.servers.intelephense
      lspconfig.intelephense.setup({
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php", "blade" },
        root_dir = util.root_pattern("composer.json", ".git", "artisan")(vim.fn.getcwd()),
        settings = intelephense_opts.settings,
      })

      for server, server_opts in pairs(opts.servers) do
        if server ~= "intelephense" and server_opts.enabled ~= false then
          lspconfig[server].setup(server_opts)
        end
      end
    end,
  },
}
