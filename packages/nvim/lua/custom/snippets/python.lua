return {
  s("ifmain", t('if __name__ == "__main__":')),
  s("bp", t("breakpoint()")),
  s(
    "arg",
    fmt(
      [[
        parser = argparse.ArgumentParser()
        parser.add_argument("--{arg}", type={type}, default={default}, help="{help}")
        p_args = parser.parse_args()
      ]],
      {
        arg = i(1, "arg"),
        type = i(2, "str"),
        default = i(3, "None"),
        help = i(4, "doc"),
      }
    )
  ),
  s(
    "argv",
    fmt(
      [[
        parser.add_argument("--{arg}", type={type}, default="{default}", help="{help}")
      ]],
      {
        arg = i(1, "arg"),
        type = i(2, "str"),
        default = i(3, "default"),
        help = i(4, "doc"),
      }
    )
  ),
  s(
    "argb",
    fmt(
      [[
        parser.add_argument("--{arg}", action=argparse.BooleanOptionalAction, help="{help}")
      ]],
      {
        arg = i(1, "arg"),
        help = i(2, "doc"),
      }
    )
  ),
  s(
    "tfflags",
    fmt(
      [[
      tf.compat.v1.app.flags.DEFINE_{type}(  # type: ignore
        "{var}", {default}, {choice} "{doc}")
      ]],
      {
        type = c(
          1,
          { t("integer"), t("float"), t("string"), t("bool"), t("enum") },
          {}
        ),
        var = i(2, "variable"),
        default = d(3, function(args, _, _)
          local type = args[1][1]
          if type == "bool" then
            return ls.sn(nil, { t("False") })
          else
            return ls.sn(nil, i(1, "default"))
          end
        end, { 1 }),
        choice = d(4, function(args, _, _)
          local type = args[1][1]
          if type == "enum" then
            return ls.sn(nil, { i(1, "[choice]") })
          else
            return ls.sn(nil, t(""))
          end
        end, { 1 }),
        doc = i(5, "doc"),
      }
    )
  ),
  s(
    "pool",
    fmt(
      [[
            with {pool}(processes={num_processes}) as p:
                outputs = [p.apply_async(
                    {f},
                    args=({args}))
                    for {i} in {array}]

                for output in outputs:
                    {output_prefix}output.get()
      ]],
      {
        pool = c(1, { t("Pool"), t("ThreadPool") }, {}),
        num_processes = i(2, "2"),
        f = i(3, "f"),
        args = i(4, "x,"),
        i = i(5, "i"),
        array = i(6, "array"),
        output_prefix = i(7, ""),
      }
    )
  ),
}
