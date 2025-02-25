return {
  { "williamboman/mason.nvim" },
  {
    "mfussenegger/nvim-lint",
    dependencies = {
      "williamboman/mason.nvim"
    }
  },
  {
    "rshkarin/mason-nvim-lint",
    dependencies = {
      "mfussenegger/nvim-lint"
    }
  }
}
