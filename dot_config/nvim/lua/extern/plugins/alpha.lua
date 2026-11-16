local gh = require('utils.gh').gh

vim.pack.add { gh 'goolord/alpha-nvim' }

local dashboard = require('alpha.themes.dashboard')

dashboard.section.header.val = {
  "                   /\\",
  "                 ||",
  "   ____ (((+))) _||_",
  "  /.--.\\  .-.  /.||.\\",
  " /.,   \\\\(0.0)// || \\\\",
  "/;`\";/\\ \\\\|m|//  ||  ;\\",
  "|:   \\ \\__`:`____||__:|",
  "|:    \\__ \\T/ (@~)(~@)|",
  "|:    _/|     |\\_\\/  :|",
  "|:   /  |     |  \\   :|",
  "|'  /   |     |   \\  '|",
  " \\_/    |     |    \\_/",
  "        |     |",
  "        |_____|",
  "    jgs |_____|",
}
dashboard.section.header.opts.hl = 'Keyword'

require('alpha').setup(dashboard.config)
