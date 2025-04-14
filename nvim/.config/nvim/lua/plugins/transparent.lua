return {
    'tribela/vim-transparent',
    config = function()
        -- Thiết lập nền trong suốt khi mở Neovim
        vim.cmd('TransparentEnable')
    end
}