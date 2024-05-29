--- @param config PHPConfig
return function(config)
  return {

    getFormatOnSavePattern = function()
      return { "*.php" }
    end,

    getTSEnsureList = function()
      return { "php" }
    end,

    getLSPEnsureList = function()
      if config.lsp == "intelephense" then
        return { "intelephense" }
      end
      return {}
    end,

    getLSPConfigMap = function()
      return {
        intelephense = require("insis.lsp.config.php"),
      }
    end,

    getToolEnsureList = function()
      if config.formatter == "phpcbf" then
        return { "phpcbf" }
      end
      return {}
    end, -- end,

    getNulllsSources = function()
      local null_ls = require("null-ls")
      if config.formatter == "phpcbf" then
        return {
          null_ls.builtins.formatting.phpcbf.with({
            extra_args = { "--standard=" .. config.coding_standard }, -- 可以根据需要修改参数
          }),
        }
      end
      return {}
    end,

    getNeotestAdapters = function()
      return {}
    end,
  }
end
