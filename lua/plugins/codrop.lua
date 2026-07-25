-- codrop.nvim — Neovim integration for the Codrop P2P sync daemon.
-- Tip for hacking on the plugin locally: add `dev = true` to the spec and set
-- `dev = { path = "~/Documents" }` in lazy.nvim's setup to use ~/Documents/codrop.nvim.
return {
  {
    "termdx/codrop.nvim",
    opts = {},
  },
  {
    "nvim-lualine/lualine.nvim",
    optional = true,
    opts = function(_, opts)
      opts.sections = opts.sections or {}
      opts.sections.lualine_x = opts.sections.lualine_x or {}
      table.insert(opts.sections.lualine_x, 1, {
        function()
          return require("codrop").statusline()
        end,
        cond = function()
          return vim.b.codrop_root ~= nil
        end,
      })
    end,
  },
}
