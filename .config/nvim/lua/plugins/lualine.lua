return {
  {
    "justinhj/battery.nvim",
    requires = { { "nvim-tree/nvim-web-devicons" }, { "nvim-lua/plenary.nvim" } },
    config = function()
      local battery = require("battery")
      battery.setup({
        update_rate_seconds = 30, -- Number of seconds between checking battery status
        show_status_when_no_battery = true, -- Don't show any icon or text when no battery found (desktop for example)
        show_plugged_icon = true, -- If true show a cable icon alongside the battery icon when plugged in
        show_unplugged_icon = true, -- When true show a diconnected cable icon when not plugged in
        show_percent = true, -- Whether or not to show the percent charge remaining in digits
        vertical_icons = true, -- When true icons are vertical, otherwise shows horizontal battery icon
        multiple_battery_selection = 1, -- Which battery to choose when multiple found. "max" or "maximum", "min" or "minimum" or a number to pick the nth battery found (currently linux acpi only)
      })
    end,
  },
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    init = function()
      vim.g.lualine_laststatus = vim.o.laststatus
      if vim.fn.argc(-1) > 0 then
        -- set an empty statusline till lualine loads
        vim.o.statusline = " "
      else
        -- hide the statusline on the starter page
        vim.o.laststatus = 0
      end
    end,
    opts = function()
      -- PERF: we don't need this lualine require madness 🤷
      local lualine_require = require("lualine_require")
      lualine_require.require = require

      local icons = LazyVim.config.icons

      vim.o.laststatus = vim.g.lualine_laststatus

      local opts = {
        options = {
          theme = "auto",
          globalstatus = vim.o.laststatus == 3,
          disabled_filetypes = { statusline = { "dashboard", "alpha", "ministarter" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = { "branch" },

          lualine_c = {
            LazyVim.lualine.root_dir(),
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
              separator = "",
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            { LazyVim.lualine.pretty_path() },
          },
          lualine_x = {
          -- stylua: ignore
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = function() return LazyVim.ui.fg("Statement") end,
          },
          -- stylua: ignore
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = function() return LazyVim.ui.fg("Constant") end,
          },
          -- stylua: ignore
          {
            function() return "  " .. require("dap").status() end,
            cond = function() return package.loaded["dap"] and require("dap").status() ~= "" end,
            color = function() return LazyVim.ui.fg("Debug") end,
          },
          -- stylua: ignore
          {
            require("lazy.status").updates,
            cond = require("lazy.status").has_updates,
            color = function() return LazyVim.ui.fg("Special") end,
          },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
              source = function()
                local gitsigns = vim.b.gitsigns_status_dict
                if gitsigns then
                  return {
                    added = gitsigns.added,
                    modified = gitsigns.changed,
                    removed = gitsigns.removed,
                  }
                end
              end,
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              function()
                return require("battery").get_status_line()
              end,
            },
            {
              function()
                return os.date("%I:%M:%S %p")
              end,
            },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }

      -- do not add trouble symbols if aerial is enabled
      if vim.g.trouble_lualine and LazyVim.has("trouble.nvim") then
        local trouble = require("trouble")
        local symbols = trouble.statusline
          and trouble.statusline({
            mode = "symbols",
            groups = {},
            title = false,
            filter = { range = true },
            format = "{kind_icon}{symbol.name:Normal}",
            hl_group = "lualine_c_normal",
          })
        table.insert(opts.sections.lualine_c, {
          symbols and symbols.get,
          cond = symbols and symbols.has,
        })
      end

      return opts
    end,
  },
}
