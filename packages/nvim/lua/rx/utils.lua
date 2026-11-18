_G.rx = _G.rx or {}

function rx.has_value(tab, val)
  for _, v in ipairs(tab) do
    if v == val then
      return true
    end
  end

  return false
end
