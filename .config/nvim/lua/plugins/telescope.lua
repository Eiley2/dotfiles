return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim", "mollerhoj/telescope-recent-files.nvim" },
    keys = {
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
      --{ "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      --{ "<leader>sG", LazyVim.pick("live_grep"), desc = "Grep (Root Dir)" },
      --{ "<leader>sg", LazyVim.pick("live_grep", { root = false }), desc = "Grep (cwd)" },
      --{ "<leader>fF", LazyVim.pick("auto"), desc = "Find Files (Root Dir)" },
      --{ "<leader>ff", LazyVim.pick("auto", { root = false }), desc = "Find Files (cwd)" },
    },
    config = function()
      require("telescope").load_extension("recent-files")
      vim.keymap.set("n", "<leader>fc", ":Telescope grep_string<CR>", { desc = "Find string under cursor in project" })
      vim.keymap.set("n", "<leader>fr", function()
        require("telescope").extensions["recent-files"].recent_files({})
      end, { desc = "Find recent files (cwd)", noremap = true, silent = true })
    end,
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown({}),
          },
        },
        defaults = {
          file_ignore_patterns = {
            "node_modules/.*",
            ".git/.*",
            "*-lock.*",
          },
        },
      })
      require("telescope").load_extension("ui-select")
    end,
  },
}
