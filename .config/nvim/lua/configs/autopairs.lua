vim.cmd([[
let g:AutoPairs = autopairs#AutoPairsDefine([{"open": "$", "close": "$", "filetype": "tex"}, {"open": '\w\zs<', "close": '>'}, {"open": "_", "close": "_", "filetype": ["markdown"]}, {"open": "**", "close": "**", "filetype": ["markdown"]}, {"open": "~~", "close": "~~", "filetype": ["markdown"]}, {"open": "|", "close": "|", "filetype": "help"}, {"open": '\vclass .{-} (: (.{-}[ ,])+)? ?\{', 'close': '};', 'mapopen': '{', 'filetype': 'cpp'}, {"open": '`', "close": "'", "filetype": "tex"}])
]])
vim.g.AutoPairsShortcutFastWrap = '<M-e>'
vim.g.AutoPairsMapBS = "1"
vim.g.AutoPairsShortcutToggle='<M-p>'
vim.g.AutoPairsShortcutJump='<M-n>'
vim.g.AutoPairsShortcutBackInsert='<M-b>'
vim.g.AutoPairsMultilineBackspace = 1
vim.g.AutoPairsMultilineClose = 1
vim.g.AutoPairsFlyMode = "0"
