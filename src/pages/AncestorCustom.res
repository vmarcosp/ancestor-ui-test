module CustomColors = {
  type colors = [
    | #white
    | #gray
    | #gray200
    | #primary
  ]

  let colors = token =>
    switch token {
    | #white => #hex("fafafa")
    | #gray => #hex("f2f2f2")
    | #gray200 => #hex("556170")
    | #primary => #hex("0da5e9")
    }
}

include Ancestor.Make(
  Ancestor.Defaults.Breakpoints,
  CustomColors,
  Ancestor.Defaults.Spacing,
  Ancestor.Defaults.Radius,
  Ancestor.Defaults.ZIndex,
)
