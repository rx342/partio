return {
  s(
    "req",
    fmt(
      [[
        local {var} = require("{module}")
      ]],
      {
        module = i(1),
        var = f(function(args, _, _)
          local parts = vim.split(args[1][1], ".", { plain = true })
          return parts[#parts] or ""
        end, { 1 }),
      }
    )
  ),
}
