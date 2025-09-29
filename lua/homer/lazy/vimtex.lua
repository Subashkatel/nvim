return {
    [1] = "lervag/vimtex",
    version = "^2.13.0",
    config = function()
        vim.g.tex_flavor = "latex"
        vim.g.tex_comment_nospell = 1
        
        vim.g.vimtex_compiler_latexmk = {
            ["options"] = {
                "-file-line-error",
                "-interaction=nonstopmode",
                "-shell-escape",
                "-synctex=1",
                "-verbose",
                "-pvc", -- Continuous compilation - key for real-time updates
            },
        }

        -- Updated warning suppressions with better patterns
        vim.g.vimtex_quickfix_ignore_filters = {
            'Underfull \\\\hbox',
            'Overfull \\\\hbox',
            'LaTeX hooks Warning',
            'Package siunitx Warning: Detected the "physics" package:',
            'Package hyperref Warning: Token not allowed in a PDF string',
            'badness',
        }                
       
        -- Auto-save when you stop typing for 1 second
        vim.opt.updatetime = 1000
        vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
            pattern = "*.tex",
            callback = function()
                if vim.bo.modified then
                    vim.cmd("silent! write")
                end
            end,
        })
        
        -- macOS-specific PDF viewer configuration
        vim.g.vimtex_view_method = 'skim'
        vim.g.vimtex_view_automatic = 1
        
        -- Optional: Enable forward search (Ctrl+click in PDF jumps to source)
        vim.g.vimtex_view_skim_sync = 1
        vim.g.vimtex_view_skim_activate = 1
    end,
}
