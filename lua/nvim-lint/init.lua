local nvim_lint = require'lint'

nvim_lint.linters.revive.args = {'-config', '/Users/colton/gomod/git.tcncloud.net/m/neo/config.toml'}

nvim_lint.linters_by_ft = {
    go = {'revive'},
}

-- run the linter on files that are defined
function enable_lint()
  if not nvim_lint.linters_by_ft[vim.bo.filetype] then
    return
  end
  local bufnr = vim.api.nvim_get_current_buf()
  vim.cmd(string.format("augroup lint_%d", bufnr))
  vim.cmd("au!")
  vim.cmd(string.format("au ColorScheme <buffer=%d> lua require'lint'.try_lint()", bufnr))
  vim.cmd(string.format("au BufReadPre <buffer=%d> lua require'lint'.try_lint()", bufnr))
  vim.cmd(string.format("au BufWritePost <buffer=%d> lua require'lint'.try_lint()", bufnr))
  vim.cmd(string.format("au BufEnter <buffer=%d> lua require'lint'.try_lint()", bufnr))
  vim.cmd("augroup end")
  local opts = {
    silent = true;
  }
end
enable_lint()
