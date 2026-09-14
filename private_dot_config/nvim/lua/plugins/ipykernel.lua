vim.keymap.set("n", "<localleader>ip", function()
  local venv = os.getenv("VIRTUAL_ENV") or os.getenv("CONDA_PREFIX")
  if venv ~= nil then
    venv = string.match(venv, "/.+/(.+)")
    vim.cmd(("MoltenInit %s"):format(venv))
  else
    vim.cmd("MoltenInit python3")
  end
end, { desc = "Initialize Molten for python3", silent = true })

return {
  {
    "benlubas/molten-nvim",
    -- version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
    build = ":UpdateRemotePlugins",
    init = function()
      -- this is an example, not a default. Please see the readme for more configuration options
      -- vim.g.molten_output_win_max_height = 12
      vim.g.python3_host_prog = vim.fn.expand("~/.virtualenvs/neovim/bin/python3")
    end,
  },
}
