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


return {
  show_bufferline = show_bufferline,
  set_custom_colors = set_custom_colors,
  open_empty_buffer = open_empty_buffer,
  merge_tables = merge_tables,
  handle_tab = handle_tab,
  set_keymaps = set_keymaps,
  format_keymaps = format_keymaps,
  get_process_id = get_process_id,
}


