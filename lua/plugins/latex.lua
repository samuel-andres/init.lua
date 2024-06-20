return {
    "lervag/vimtex",
    lazy = false,
    init = function()
        vim.g.vimtex_view_method = "mupdf"
        vim.cmd [[
            :autocmd BufNewFile,BufRead *.tex VimtexCompile
        ]]

        vim.g.vimtex_compiler_latexmk = {
            build_dir = ".out",
            options = {
                "-shell-escape",
                "-verbose",
                "-file-line-error",
                "-interaction=nonstopmode",
                "-synctex=1",
            },
        }
    end,
}
