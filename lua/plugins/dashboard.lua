-- Adicione isso ao seu arquivo de configuração de plugins (por exemplo, `lua/plugins/alpha.lua`):
return {
    "goolord/alpha-nvim",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
        local alpha = require('alpha')
        local dashboard = require('alpha.themes.dashboard')

        -- Personalizar a tela de boas-vindas
        dashboard.section.header.val = {
          " .......................................................................",
          " .......................................................................",
          " ######   #######  ########  ######## ##    ## ##     ## #### ##     ## ",
          "##    ## ##     ## ##     ## ##       ###   ## ##     ##  ##  ###   ### ",
          "##       ##     ## ##     ## ##       ####  ## ##     ##  ##  #### #### ",
          "##       ##     ## ##     ## ######   ## ## ## ##     ##  ##  ## ### ## ",
          "##       ##     ## ##     ## ##       ##  ####  ##   ##   ##  ##     ## ",
          "##    ## ##     ## ##     ## ##       ##   ###   ## ##    ##  ##     ## ",
          " ######   #######  ########  ######## ##    ##    ###    #### ##     ## ",
          " .......................................................................",
          " .......................................................................",
        }

        dashboard.section.buttons.val = {
            dashboard.button("n", "  New File", ":ene <BAR> startinsert<CR>"),
            dashboard.button("p", "  Find file", ":Telescope find_files<CR>"),
            dashboard.button("f", "  Recent files", ":Telescope oldfiles<CR>"),
        }

        dashboard.section.footer.val = {
         "                                         ",
         "                                         ",
         "                                         ",
         "                                         ",
         "                                         ",
         "                                         ",
         "                                         ",
         "                                         ",
         "..Your new best code editor! by tocodando.."
        }

        alpha.setup(dashboard.config)

        -- Condicional para exibir a tela de boas-vindas ou não
        vim.api.nvim_create_autocmd("VimEnter", {
            callback = function()
                -- Verifica se o Neovim foi iniciado com um arquivo específico
                if vim.fn.argc() == 0 then
                    -- Verifica se o buffer está vazio (sem arquivo aberto)
                    if vim.fn.bufname('%') == '' then
                        alpha.setup(dashboard.config)
                    end
                end
            end,
        })

        -- Autocomando para exibir o dashboard ao abrir um diretório
        vim.api.nvim_create_autocmd("BufEnter", {
            callback = function()
                -- Verifica se o buffer está vazio e se é um diretório
                if vim.fn.bufname('%') == '' and vim.fn.isdirectory(vim.fn.expand('%:p')) == 1 then
                    alpha.setup(dashboard.config)
                end
            end,
        })

        -- Autocomando para ocultar o dashboard quando um arquivo é aberto
        vim.api.nvim_create_autocmd("BufReadPost", {
            callback = function()
                -- Se houver um tipo de arquivo, desative o dashboard
                if vim.fn.getbufvar(vim.fn.bufnr(), '&filetype') ~= '' then
                    require('alpha').setup {}
                end
            end,
        })

        -- Configuração de keymaps para o dashboard
        vim.api.nvim_set_keymap('n', '<C-n>', ':ene <BAR> startinsert<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-p>', ':Telescope find_files<CR>', { noremap = true, silent = true })
        vim.api.nvim_set_keymap('n', '<C-f>', ':Telescope oldfiles<CR>', { noremap = true, silent = true })

    end
}

