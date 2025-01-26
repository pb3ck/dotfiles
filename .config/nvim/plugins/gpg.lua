return {
    {
        "jamessan/vim-gnupg",
        init = function()
            vim.g.GPGPreferSymmetric = 1  -- Use symmetric encryption by default
            -- Uncomment and modify after you create your GPG key
            -- vim.g.GPGDefaultRecipients = {'your.email@example.com'}
        end,
    }
}