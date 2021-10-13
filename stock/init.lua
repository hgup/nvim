require('plugins')

core = {'functions','options','remaps','rice','utils'}
plugins = {'barbar','cmp','compe','lsp-config','nvim-tree'}
vim = {'utils','functions'}

for index=0,table.getn(core)-1 do
    require('core.' .. core[index])
end

for index=0,table.getn(plugins)-1 do
    require('plugins.' .. plugins[index])
end

for index=0,table.getn(vim)-1 do
    vim.cmd('source '..nvimrc..'/vim/'..vim[index]..'.vim')
end


