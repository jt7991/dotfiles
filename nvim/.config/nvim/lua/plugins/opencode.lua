return {
  "NickvanDyke/opencode.nvim",
  dependencies = {
    -- Recommended for better prompt input, and required to use `opencode.nvim`'s embedded terminal — otherwise optional
    { "folke/snacks.nvim", opts = { input = {}, picker = {}, terminal = {} } },
  },
  config = function()
    -- Required for `opts.auto_reload`
    vim.opt.autoread = true

    -- Recommended keymaps
    local opencode = require("opencode")
    vim.keymap.set({ "n", "x" }, "<leader>aa", function()
      opencode.ask("@this: ", { submit = true })
    end, { desc = "Ask AI" })

    vim.keymap.set({ "n", "x" }, "<leader>ax", opencode.select, { desc = "Execute opencode action…" })

    vim.keymap.set({ "n", "t" }, "<leader>at", opencode.toggle, { desc = "Toggle opencode" })

    vim.keymap.set({ "v" }, "<leader>ac", function()
      return opencode.prompt("@this ")
    end, { expr = true, desc = "Add context to opencode" })
  end,
}
