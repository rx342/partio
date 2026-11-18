return {
  s(
    "eq",
    fmt(
      [[
      \begin{align}
          <expr>
      \end{align}
      ]],
      { expr = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "eqn",
    fmt(
      [[
      \begin{align*}
          <expr>
      \end{align*}
      ]],
      { expr = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "proof",
    fmt(
      [[
      \begin{proof}
          <proof>
      \end{proof}
      ]],
      { proof = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "frame",
    fmt(
      [[
      \begin{frame}
          <frame>
      \end{frame}
      ]],
      { frame = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "block",
    fmt(
      [[
      \begin{block}{<title>}
          <block>
      \end{block}
      ]],
      { block = i(1), title = i(2, "Remark") },
      { delimiters = "<>" }
    )
  ),
  s(
    "tab",
    fmt(
      [[
        \begin{table}[<pos>]
            \centering
            \caption{<caption>}
            \label{tab:<label>}
            \begin{tabular}{<col>}
                \toprule
                <content>
                \bottomrule
            \end{tabular}
        \end{table}
        ]],
      {
        pos = i(1, "htpb"),
        caption = i(2, "caption"),
        label = i(3, "label"),
        col = i(4, "c"),
        content = i(5),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    "thm",
    fmt(
      [[
        \begin{theorem}
            <content>
        \end{theorem}
      ]],
      {
        content = i(1),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    "item",
    fmt(
      [[
        \begin{itemize}[wide,noitemsep]
            \item <content>
        \end{itemize}
      ]],
      {
        content = i(1, ""),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    "enum",
    fmt(
      [[
        \begin{enumerate}[wide,noitemsep]
            \item <content>
        \end{enumerate}
      ]],
      {
        content = i(1),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    "fig",
    fmt(
      [[
        \begin{figure}[htpb]
            \centering
            \includegraphics[width=0.8\textwidth]{<path>}
            \caption{<content>}
            \label{fig:<label>}
        \end{figure}
      ]],
      {
        path = i(1),
        content = i(2),
        label = rep(1),
      },
      { delimiters = "<>" }
    )
  ),
  s(
    "$",
    fmt(
      [[ \({expr}\)
      ]],
      { expr = i(1) }
    )
  ),
  s(
    "->",
    fmt(
      [[ \mapsto
      ]],
      {}
    )
  ),
  s(
    "=>",
    fmt(
      [[ \Rightarrow
      ]],
      {}
    )
  ),
  s(
    "<=",
    fmt(
      [[ \Leftarrow
      ]],
      {}
    )
  ),
  s(
    "<=>",
    fmt(
      [[ \Leftrightarrow
      ]],
      {}
    )
  ),
  s(
    "min",
    fmt(
      [[
      \min\limits_{<lim>}
      ]],
      { lim = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "max",
    fmt(
      [[
      \max\limits_{<lim>}
      ]],
      { lim = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "argmin",
    fmt(
      [[
      \argmin\limits_{<lim>}
      ]],
      { lim = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "argmax",
    fmt(
      [[
      \argmax\limits_{<lim>}
      ]],
      { lim = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "norm",
    fmt(
      [[
      \left\| <value> \right\|
      ]],
      { value = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "lr()",
    fmt(
      [[
      \left( <value> \right)
      ]],
      { value = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "lr[]",
    fmt(
      [[
      \left[ <value> \right]
      ]],
      { value = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "lr{}",
    fmt(
      [[
      \left\{ <value> \right\}
      ]],
      { value = i(1) },
      { delimiters = "<>" }
    )
  ),
  s(
    "sum",
    fmt(
      [[
      \sum\limits_{<sub>}^{<super>}
      ]],
      { sub = i(1), super = i(2) },
      { delimiters = "<>" }
    )
  ),
  s(
    "prod",
    fmt(
      [[
      \prod\limits_{<sub>}^{<super>}
      ]],
      { sub = i(1), super = i(2) },
      { delimiters = "<>" }
    )
  ),
  s(
    "st",
    fmt(
      [[ \mid
      ]],
      {}
    )
  ),
  s(
    "frac",
    fmt(
      [[
        \frac{<num>}{<den>}
      ]],
      { num = i(1), den = i(2) },
      { delimiters = "<>" }
    )
  ),
  s(
    "dfrac",
    fmt(
      [[
        \dfrac{<num>}{<den>}
      ]],
      { num = i(1), den = i(2) },
      { delimiters = "<>" }
    )
  ),
  s(
    "lim",
    fmt(
      [[
        \lim_{<sub>}
      ]],
      { sub = i(1, "x\\to\\infty") },
      { delimiters = "<>" }
    )
  ),
  s(
    "int",
    fmt(
      [[
        \int_{<sub>}^{<super>} <func> \,dx
      ]],
      { sub = i(1, "a"), super = i(2, "b"), func = i(3) },
      { delimiters = "<>" }
    )
  ),
}
