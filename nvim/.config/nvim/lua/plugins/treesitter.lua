return {
  -- Highlight, edit, and navigate code
  "nvim-treesitter/nvim-treesitter",
  main = "nvim-treesitter.config",
  build = ":TSUpdate",
  config = function()
    require("nvim-treesitter.config").setup({
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = {
        "c",
        "cpp",
        "go",
        "lua",
        "python",
        "rust",
        "tsx",
        "typescript",
        "javascript",
        "svelte",
        "vimdoc",
        "vim",
        "luadoc",
        "blade",
      },

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = true,

      highlight = {
        enable = true,
      },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = "<c-space>",
          node_incremental = "<c-space>",
          scope_incremental = "<c-s>",
          node_decremental = "<M-space>",
        },
      },
    })

    -- Enable treesitter highlighting for all configured languages
    local treesitter_group = vim.api.nvim_create_augroup("TreesitterHighlight", { clear = true })
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "*",
      callback = function(args)
        local filetype = vim.bo[args.buf].filetype
        local lang = vim.treesitter.language.get_lang(filetype)
        if lang then
          pcall(vim.treesitter.start, args.buf, lang)
        end
      end,
      group = treesitter_group,
    })
  end,
}
