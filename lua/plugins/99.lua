return {
  "ThePrimeagen/99",
  dependencies = { "saghen/blink.compat" },
  config = function()
    local _99 = require("99")
    local cwd = vim.uv.cwd()
    local basename = vim.fs.basename(cwd)
    _99.setup({
      model = "opencode-go/kimi-k3",
      logger = {
        level = _99.DEBUG,
        path = "/tmp/" .. basename .. ".99.debug",
        print_on_error = true,
      },
      completion = {
        custom_rules = {
          "scratch/custom_rules/",
        },
        files = {
          enabled = true,
          max_file_size = 102400, -- bytes, skip files larger than this
          max_files = 5000, -- cap on total discovered files
          exclude = { ".env", ".env.*", "node_modules", ".git" },
        },
        --- File Discovery:
        --- - In git repos: Uses `git ls-files` which automatically respects .gitignore
        --- - Non-git repos: Falls back to filesystem scanning with manual excludes
        --- - Both methods apply the configured `exclude` list on top of gitignore

        --- What autocomplete engine to use. Defaults to native (built-in) if not specified.
        source = "blink", -- "native" (default), "cmp", or "blink"
      },

      md_files = {
        "AGENTS.md",
        "AGENT.md",
        "CLAUDE.md",
      },
    })

    -- take extra note that i have visual selection only in v mode
    -- technically whatever your last visual selection is, will be used
    -- so i have this set to visual mode so i dont screw up and use an
    -- old visual selection
    --
    -- mode check + assert on required visual mode, as prepared for
    local function is_visual_mode()
      local mode = vim.api.nvim_get_mode().mode
      return mode == "v" or mode == "V" or mode == "\22" -- \22 is <C-v>
    end

    vim.keymap.set("v", "<leader>9v", function()
      assert(is_visual_mode(), "99: <leader>9v requires an active visual selection")
      _99.visual()
    end, { desc = "99: send visual selection" })

    --- if you have a request you dont want to make any changes, just cancel it
    vim.keymap.set("n", "<leader>9s", function()
      _99.stop_all_requests()
    end, { desc = "99: stop all requests" })

    vim.keymap.set("n", "<leader>9m", function()
      vim.ui.input({ prompt = "Model: ", default = _99.get_model() }, function(input)
        if input and input ~= "" then
          _99.set_model(input)
          vim.notify("Model set to: " .. input)
        end
      end)
    end, { desc = "99: set model" })

    vim.keymap.set("n", "<leader>9b", function()
      _99.vibe()
    end, { desc = "99: vibe" })
  end,
}
