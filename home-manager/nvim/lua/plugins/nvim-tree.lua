return {
  "nvim-tree/nvim-tree.lua",

  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  cmd = {
    "NvimTreeToggle",
    "NvimTreeOpen",
    "NvimTreeClose",
  },

  keys = {
    {
      "<leader>n",
      function()
        require("nvim-tree.api").tree.toggle()
      end,
      desc = "Toggle NvimTree",
    },
  },

  config = function()
    require("nvim-tree").setup({})
  end,
}
