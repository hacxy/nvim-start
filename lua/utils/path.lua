-- Define project markers
local root_patterns = { '.git', 'Makefile', 'package.json', 'pyproject.toml' }

-- Function to find the project root
local function find_project_root()
  -- Use vim.fs.root for newer Neovim versions
  if vim.fs.root then
    return vim.fs.root(0, root_patterns)
  else
    -- Fallback for older Neovim versions
    local path = vim.fs.find(root_patterns, { upward = true, limit = vim.loop.cwd() })[1]
    if path then
      return vim.fs.dirname(path)
    else
      -- Fallback to current working directory if no marker is found
      return vim.fn.getcwd()
    end
  end
end

return find_project_root
