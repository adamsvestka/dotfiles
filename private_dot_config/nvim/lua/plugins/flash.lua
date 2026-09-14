return {
  "folke/flash.nvim",
  keys = {
    { "<c-space>", false },
    {
      "<A-space>",
      mode = { "n", "o", "x" },
      function()
        require("flash").treesitter({
          actions = {
            ["<A-space>"] = "next",
            ["<BS>"] = "prev",
          },
        })
      end,
      desc = "Treesitter Incremental Selection",
    },
  },
}
