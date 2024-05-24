local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities.textDocument.completion.completionItem.snippetSupport = true
local opts = {
  capabilities = capabilities,
  filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less" },
  --  调整初始化选项和设置,消除一些无害的警告
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = true,
      },
    },
  },
  settings = {
    emmet = {
      showExpandedAbbreviation = "always",
      showSuggestionsAsSnippets = true,
      syntaxProfiles = {},
      variables = {},
    },
  },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
