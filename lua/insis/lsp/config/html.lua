local common = require("insis.lsp.common-config")
local opts = {
  capabilities = common.capabilities,
  flags = common.flags,
  on_attach = function(client, bufnr)
    -- common.disableFormat(client)
    common.keyAttach(bufnr)
  end,
  init_options = {
    configurationSection = { "html", "css", "javascript" },
    embeddedLanguages = {
      css = true,
      javascript = true,
    },
    provideFormatter = true,
  },
  -- 确认validProperties 被适当地设置，避免 null 引起的错误
  settings = {
    html = {
      format = {
        enable = true,
      },
      validate = {
        styles = true,
        scripts = true,
      },
    },
    css = {
      lint = {
        validProperties = {}, -- 确保这个属性设置了默认值
      },
    },
  },
}
return {
  on_setup = function(server)
    server.setup(opts)
  end,
}
