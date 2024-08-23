local Input = require("nui.input")
local Path = require("plenary.path")

-- Função para obter o diretório de trabalho atual
local function get_current_working_directory()
  return vim.fn.getcwd()
end

-- Função para verificar se um caminho é um diretório
local function is_directory(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "directory"
end

-- Função para verificar se um caminho é um arquivo
local function is_file(path)
  local stat = vim.loop.fs_stat(path)
  return stat and stat.type == "file"
end

-- Função para dividir o caminho e arquivos
local function splitFileAndPaths(input_str)
  local path, files_str = input_str:match("^(.-)/([^/]+)$")
  if not path then
    path = ""
    files_str = input_str
  end

  local files = vim.split(files_str, "+", { trimempty = true })

  return { path = path, files = files }
end

-- Função para gerar caminhos completos para arquivos
local function get_full_files_path(data)
  local base_path = get_current_working_directory()
  local full_paths = {}

  for _, file in ipairs(data.files) do
    local full_path = Path:new(base_path, data.path, file):absolute()
    table.insert(full_paths, full_path)
  end

  return full_paths
end

-- Função para perguntar ao usuário se deseja substituir um arquivo
local function ask_to_replace(full_path, callback)
  local popup = Input({
    position = "50%",
    size = {
      width = 40,
    },
    border = {
      style = "rounded",
      text = {
        top = "Confirm Replacement",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = "O arquivo " .. full_path .. " já existe. Deseja substituí-lo? (y/n): ",
    on_submit = function(value)
      if value:lower() == "y" then
        callback()
      else
        vim.notify("Arquivo não substituído: " .. full_path, vim.log.levels.INFO)
      end
    end,
  })

  popup:mount()
end

-- Função para criar arquivos e pastas
local function create_files_and_dirs(input_str)
  local data = splitFileAndPaths(input_str)
  local full_paths = get_full_files_path(data)

  for _, full_path in ipairs(full_paths) do
    local path_obj = Path:new(full_path)
    local parent_dir = path_obj:parent():absolute()

    -- Cria o diretório pai se necessário
    if not is_directory(parent_dir) then
      Path:new(parent_dir):mkdir({ parents = true })
    end

    -- Verifica se o caminho é um diretório ou um arquivo existente
    if is_directory(full_path) then
      vim.notify("O diretório já existe: " .. full_path, vim.log.levels.INFO)
    elseif is_file(full_path) then
      ask_to_replace(full_path, function()
        path_obj:write("", "w")
        vim.notify("Arquivo substituído: " .. full_path)
      end)
    else
      path_obj:write("", "w")
      vim.notify("Arquivo criado: " .. full_path)
    end
  end
end

-- Função para abrir o popup e capturar o input do usuário
local function create_file()
  local popup = Input({
    position = "50%",
    size = {
      width = 40,
    },
    border = {
      style = "rounded",
      text = {
        top = "Create Files/Dirs",
        top_align = "center",
      },
    },
    win_options = {
      winblend = 10,
      winhighlight = "Normal:Normal,FloatBorder:FloatBorder",
    },
  }, {
    prompt = "> ",
    on_submit = function(value)
      create_files_and_dirs(value)
    end,
  })

  popup:mount()

  -- unmount input by pressing `<Esc>` in normal mode
  popup:map("n", "<Esc>", function()
    popup:unmount()
  end, { noremap = true })
end

return { create_file = create_file }
