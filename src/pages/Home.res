let defaultColors = token =>
  switch token {
  | #primary => #hex("#f36")
  | #secondary => #hex("#ccc")
  }

module AncestorCustom = Ancestor.Make(
  Ancestor.Defaults.Breakpoints,
  {
    type colors = [
      | #primary
      | #secondary
    ]

    let colors = defaultColors
  },
  Ancestor.Defaults.Spacing,
  Ancestor.Defaults.Radius,
  Ancestor.Defaults.ZIndex,
)

open AncestorCustom

module Square = {
  let square = AncestorCustom.Css.css({
    bgColor: {
      xs: #primary,
      md: #secondary,
    },
    p: {xs: 1, md: 3},
    width: {
      xs: #px(100),
      sm: #px(300),
    },
    height: {
      xs: #px(100),
      md: #px(200),
    },
    _hover: {
      bgColor: {xs: #primary},
    },
  })

  @react.component
  let make = () => {
    <div className=square> {"Testing..."->React.string} </div>
  }
}

@react.component
let default = () => {
  <Stack
    _hover={bgColor: {md: #secondary}}
    bgColor={xs: #secondary, md: #primary}
    height={xs: #px(32)}
    p={xs: 2}
    borderRadius={xs: 1}
    alignItems={md: #center}>
    <Square />
  </Stack>
}
