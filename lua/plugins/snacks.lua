return {
  {
    "folke/snacks.nvim",
    opts = function(_, opts)
      opts = opts or {}
      opts.picker = {
        enabled = false,
        sources = {
          explorer = {
            layout = {
              preset = "sidebar",
              preview = false,
              layout = {
                position = "right",
              },
            },
          },
        },
      }

      opts.dashboard = {
        preset = {
          header = [[
 ██████╗ ██╗   ██╗███████╗████████╗ █████╗ ██╗   ██╗██╗███╗   ███╗
██╔════╝ ██║   ██║██╔════╝╚══██╔══╝██╔══██╗██║   ██║██║████╗ ████║
██║  ███╗██║   ██║███████╗   ██║   ███████║██║   ██║██║██╔████╔██║
██║   ██║██║   ██║╚════██║   ██║   ██╔══██║╚██╗ ██╔╝██║██║╚██╔╝██║
╚██████╔╝╚██████╔╝███████║   ██║   ██║  ██║ ╚████╔╝ ██║██║ ╚═╝ ██║
 ╚═════╝  ╚═════╝ ╚══════╝   ╚═╝   ╚═╝  ╚═╝  ╚═══╝  ╚═╝╚═╝     ╚═╝

    Faça dinheiro, se mantenha vivo.
                                                                  ]],
        },
      }

      return opts
    end,
  },
}
