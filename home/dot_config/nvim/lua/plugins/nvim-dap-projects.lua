return {
  "ldelossa/nvim-dap-projects",
  dependencies = {
    config = function()
      require("nvim-dap-projects").search_project_config()
    end,
  },
}
