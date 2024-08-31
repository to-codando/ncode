-- Função para verificar se há buffers abertos
local function show_bufferline()
  local buffers = vim.fn.getbufinfo({ buflisted = 1 })
  if #buffers > 0 then
    vim.cmd("set showtabline=2") -- Mostra a barra de buffers
  else
    vim.cmd("set showtabline=0") -- Esconde a barra de buffers
  end
end

-- Função para garantir que o comando BuffetSetCustomColors seja executado apenas após o plugin estar carregado
local function set_custom_colors()
  if vim.fn.exists(":BuffetSetCustomColors") == 2 then
    vim.cmd [[call BuffetSetCustomColors()]]
  else
    print("BuffetSetCustomColors command not available")
  end
end

-- Função para abrir um buffer vazio
local function open_empty_buffer()
  -- Cria um novo buffer
  vim.cmd('enew')
  -- Define o buffer como não editável
  vim.bo.buflisted = false
  vim.bo.buftype = 'nofile'
  vim.bo.swapfile = false
  vim.bo.bufhidden = 'wipe' -- Mude 'wipe' para 'hide' para garantir que o buffer não seja excluído
  -- Desabilita edição no buffer
  vim.cmd('setlocal nomodifiable')
end

-- Função recursiva para mesclar tabelas
local function merge_tables(tbl1, tbl2)
  for k, v in pairs(tbl2) do
    if type(v) == "table" then
      if not tbl1[k] then
        tbl1[k] = {}
      end
      merge_tables(tbl1[k], v) -- Chamada recursiva
    else
      tbl1[k] = v
    end
  end
end

-- Função auxiliar para lidar com navegação e expansão de snippets
local cmp = pcall(require, 'cmp')
local luasnip = pcall(require, 'luasnip')

local function handle_tab(fallback, direction)
  if cmp.visible() then
    if direction == 'next' then
      cmp.mapping.select_next_item()(fallback)
    elseif direction == 'prev' then
      cmp.mapping.select_prev_item()(fallback)
    end
  elseif direction == 'next' and luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  elseif direction == 'prev' and luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

local function set_keymaps(keymaps)
  for mode, mappings in pairs(keymaps) do
    for lhs, map in pairs(mappings) do
      local rhs = map.rhs
      local desc = map.desc
      local opts = map.opts or {}
      opts.desc = desc
      -- Adiciona uma verificação para garantir que rhs não seja nil
      if rhs then
        vim.keymap.set(mode, lhs, rhs, opts)
      else
        print("Erro: rhs é nil para o mapeamento " .. lhs .. " em modo " .. mode)
      end
    end
  end
end

local function format_keymaps(maps)
  local formatted_maps = {}
  for key, map in pairs(maps) do
    local cmd, desc = map[1], map[2]
    local mode = map.mode or "n"
    -- Formata a descrição com o modo
    formatted_maps[key] = {
      cmd,
      string.format("%s %s - %s", mode, key, desc)
    }
  end
  return formatted_maps
end

local function get_process_id(cmd)
  local handle = io.popen(cmd)
  local result = handle:read("*a")
  handle:close()
  local pid = result:match("%d+")
  return pid
end

local function update_nvim()
  -- Sincronize os plugins
  vim.cmd('Lazy sync')

  -- Recarregue o arquivo de configuração
  vim.cmd('source $MYVIMRC')

  -- Recarregue LSPs se necessário (opcional)
  -- local lsp = require('lspconfig')
  -- lsp.update()

  print("CodeNvim atualizado com sucesso!")
end

local function close_nvim_tree()
  local api = require('nvim-tree.api')
  if api.tree.is_visible() then
    vim.defer_fn(function()
      api.tree.close()
    end, 200) -- Ajuste o atraso se necessário
  end
end

local function ensure_no_buffers()
  -- Criar um novo buffer vazio se não houver buffers abertos
  vim.cmd('enew')
end

local function uninstall_plugins()
  -- Fechar o nvim-tree com atraso
  ensure_no_buffers()
  close_nvim_tree()

  -- Aguarde até que o nvim-tree esteja realmente fechado
  vim.wait(300, function()
    -- Remover diretórios de plugins
    local lazy_dir = vim.fn.expand('~/.local/share/nvim/lazy')
    if vim.fn.isdirectory(lazy_dir) == 1 then
      local handle = io.popen('rm -rf ' .. lazy_dir)
      handle:close()
    else
      vim.notify("O diretório de plugins não existe.", vim.log.levels.WARN)
    end

    local cache_dir = vim.fn.expand('~/.local/share/nvim/lazy_cache')
    if vim.fn.isdirectory(cache_dir) == 1 then
      local cache_handle = io.popen('rm -rf ' .. cache_dir)
      cache_handle:close()
    end

    vim.notify("Plugins removidos com sucesso!", vim.log.levels.INFO)
  end, 300)
end

-- Função fábrica para criar um objeto de registro e repetição de comandos
local function commander_creator()
  local last_command = ""
  local last_command_type = "" -- Para diferenciar entre "<Plug>" e "<Cmd>"

  -- Função para registrar e executar o comando
  local function register(command)
    -- Armazena o comando e seu tipo (tipo de comando)
    last_command = command
    last_command_type = command:match("<Plug>") and "plug" or "cmd"

    -- Executa o comando registrado imediatamente
    if last_command_type == "plug" then
      -- Usando `vim.api.nvim_feedkeys` para comandos "<Plug>"
      vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(command, true, false, true), 'n', true)
    else
      -- Usando `vim.api.nvim_command` para comandos "<Cmd>"
      -- Remove os caracteres `<Cmd>` e `</Cmd>` se presentes
      local clean_command = command:gsub("<Cmd>", ""):gsub("</Cmd>", "")
      vim.api.nvim_command(clean_command)
    end
  end

  -- Função para repetir o último comando registrado
  local function repeat_last()
    if last_command ~= "" then
      if last_command_type == "plug" then
        -- Repetir o comando "<Plug>"
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(last_command, true, false, true), 'n', true)
      else
        -- Repetir o comando "<Cmd>"
        -- Remove os caracteres `<Cmd>` e `</Cmd>` se presentes
        local clean_command = last_command:gsub("<Cmd>", ""):gsub("</Cmd>", "")
        vim.api.nvim_command(clean_command)
      end
    else
      print("No command to repeat")
    end
  end

  return {
    register = register,
    repeat_last = repeat_last
  }
end

return {
  show_bufferline = show_bufferline,
  set_custom_colors = set_custom_colors,
  open_empty_buffer = open_empty_buffer,
  merge_tables = merge_tables,
  handle_tab = handle_tab,
  set_keymaps = set_keymaps,
  format_keymaps = format_keymaps,
  get_process_id = get_process_id,
  update_nvim = update_nvim,
  uninstall_plugins = uninstall_plugins,
  commander_creator = commander_creator,
}
