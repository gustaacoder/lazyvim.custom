local M = {}

local function read_env_file(path)
  local env = {}

  local file = io.open(path, "r")

  if not file then
    return env
  end

  for line in file:lines() do
    local clean_line = line:match("^%s*(.-)%s*$")

    if clean_line ~= "" and not clean_line:match("^#") then
      local key, value = clean_line:match("^([%w_]+)%s*=%s*(.*)$")

      if key and value then
        value = value:gsub("^%s+", ""):gsub("%s+$", "")
        value = value:gsub('^"', ""):gsub('"$', "")
        value = value:gsub("^'", ""):gsub("'$", "")

        env[key] = value
      end
    end
  end

  file:close()

  return env
end

local function url_encode(value)
  if not value then
    return ""
  end

  value = tostring(value)

  return value:gsub("([^%w%-_%.~])", function(char)
    return string.format("%%%02X", string.byte(char))
  end)
end

local function file_exists(path)
  return vim.fn.filereadable(path) == 1
end

local function find_laravel_root()
  local cwd = vim.fn.getcwd()
  local current = cwd

  while current and current ~= "/" do
    if file_exists(current .. "/artisan") and file_exists(current .. "/.env") then
      return current
    end

    current = vim.fn.fnamemodify(current, ":h")
  end

  return nil
end

function M.setup()
  local root = find_laravel_root()

  if not root then
    return
  end

  local env_path = root .. "/.env"
  local env = read_env_file(env_path)

  local connection = env.DB_CONNECTION
  local database = env.DB_DATABASE
  local username = env.DB_USERNAME
  local password = env.DB_PASSWORD or ""

  if not connection or not database or not username then
    return
  end

  local project_name = vim.fn.fnamemodify(root, ":t")

  local driver = nil
  local host = "127.0.0.1"
  local port = env.FORWARD_DB_PORT or env.DB_PORT

  if connection == "mysql" or connection == "mariadb" then
    driver = "mysql"
    port = port or "3306"
  elseif connection == "pgsql" or connection == "postgres" or connection == "postgresql" then
    driver = "postgres"
    port = port or "5432"
  elseif connection == "sqlite" then
    local db_path = database

    if db_path == ":memory:" then
      return
    end

    if not db_path:match("^/") then
      db_path = root .. "/" .. db_path
    end

    vim.g.dbs = {
      {
        name = project_name,
        url = "sqlite:" .. db_path,
      },
    }

    return
  else
    return
  end

  local url =
    string.format("%s://%s:%s@%s:%s/%s", driver, url_encode(username), url_encode(password), host, port, database)

  vim.g.dbs = {
    {
      name = project_name,
      url = url,
    },
  }
end

vim.api.nvim_create_user_command("LaravelDBRefresh", function()
  M.setup()
  print("Conexão do Laravel atualizada pelo .env")
end, {})

vim.api.nvim_create_autocmd({ "VimEnter", "DirChanged" }, {
  callback = function()
    M.setup()
  end,
})

M.setup()

return M
