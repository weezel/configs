return {
  cmd = { 'golangci-lint-langserver' },
  root_dir = lspconfig.util.root_pattern('.git', 'go.mod'),
  filetypes = { 'go', 'gomod' },
  init_options = {
    command = {
      "golangci-lint",
      "run",
      "--output.json.path",
      "stdout",
      "--show-stats=false",
      "--issues-exit-code=1",
    };
  };
}

