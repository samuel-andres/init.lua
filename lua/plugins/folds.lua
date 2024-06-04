return {
    "kevinhwang91/nvim-ufo",
    dependencies = { "kevinhwang91/promise-async" },
    config = function()
        ---@diagnostic disable-next-line: missing-fields
        require("ufo").setup {
            ---@diagnostic disable-next-line: unused-local
            provider_selector = function(bufnr, filetype, buftype)
                return { "treesitter", "indent" }
            end,
        }
    end,
}
