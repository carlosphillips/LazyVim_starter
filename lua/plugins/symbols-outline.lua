-- Filter table #1.
-- @return A table.
function table:filter(filterFnc)
  local result = {}

  for k, v in ipairs(self) do
    if filterFnc(v, k, self) then
      table.insert(result, v)
    end
  end

  return result
end

-- Get index of a value at a table.
-- @param any value
-- @return any
function table:find(value)
  for k, v in ipairs(self) do
    if v == value then
      return k
    end
  end
end

-- Return the table minus another table
function table:difference(b)
  return table.filter(self, function(value)
    return not table.find(b, value)
  end)
end

return {
  "simrat39/symbols-outline.nvim",

  -- opts = { symbol_blacklist = { "Function", "Method" } },

  opts = function(_, opts)
    local wantedSymbols = {
      "Class",
      "Constructor",
      "Function",
      "Method",
    }
    vim.print(wantedSymbols)
    local kinds = require("symbols-outline.symbols").kinds
    local blacklist = table.difference(kinds, wantedSymbols)
    opts = { symbol_blacklist = blacklist }
    -- vim.print(opts)
    return opts
  end,

  init = function()
    vim.keymap.set(
      "n",
      "<leader>cs",
      require("symbols-outline").toggle_outline,
      { noremap = true, silent = true, desc = "Symbol outline" }
    )
  end,
}
