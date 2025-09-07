= Table.TransformColumns(Renomear,{{"Usuário_Nome", Text.Proper}, {"Usuário_Email", Text.Lower}, {"Ocupação_MomentoAtual", Text.Proper}})

= Table.TransformColumnTypes(
    Formatação,
    List.Transform(
        Table.ColumnNames(Formatação),
        each {_, type text}
    )
)

= Table.TransformColumns(Tipagem, List.Transform(Table.ColumnNames(Tipagem),each {_, Text.Trim}))