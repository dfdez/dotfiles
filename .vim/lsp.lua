local lsp_status = require('lsp-status')

lsp_status.config({
  indicator_errors = 'E:',
  indicator_warning = 'W:',
  indicator_info = ' I:',
  indicator_hint = 'H:',
  status_symbol = 'LSP ',
  indicator_ok = ''
})

local on_attach_vim = function(client)
  require'diagnostic'.on_attach(client)
  require'lsp-status'.on_attach(client)
end

require'nvim_lsp'.tsserver.setup{on_attach=on_attach_vim}
require'nvim_lsp'.html.setup{on_attach=on_attach_vim}
require'nvim_lsp'.cssls.setup{on_attach=on_attach_vim}
require'nvim_lsp'.vuels.setup{on_attach=on_attach_vim}
